From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 9 Apr 2017 15:44:22 +0200
Subject: [Buildroot] [PATCH 3/4] libselinux: allow compiling python
 wrapper module for target
In-Reply-To: <20170202224505.22882-3-Adamduskett@outlook.com>
References: <20170202224505.22882-1-Adamduskett@outlook.com>
 <20170202224505.22882-3-Adamduskett@outlook.com>
Message-ID: <20170409154422.16c86a64@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  2 Feb 2017 17:45:04 -0500, Adam Duskett wrote:
> libselinux currently does not compile it's python wrapper module
> for the target.  This is needed for audit2allow to function properly.
> 
> This patch allows for the python wrapper to be built.  The current
> makefile will try to install the python wrapper to the host directory
> unless the PYSITEDIR variable is set.  I wrapped the build of the
> python wrapper in a check for AUDIT2ALLOW because of the extra python
> dependency, as I am sure many users don't want to have to install
> python if they don't have to.
> 
> Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
> ---
>  package/libselinux/libselinux.mk | 32 ++++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)

Applied to master with the following changes:

    [Thomas:
     - Remove useless empty lines, as noted by Matt Weber
     - Move code related to python bindings before builds/install
       commands, since those commands will use variables defined by the
       python bindings logic.
     - Instead of enabling the python bindings when
       BR2_PACKAGE_POLICYCOREUTILS_AUDIT2ALLOW is set, enable the python
       bindings when python is available. We generally try to avoid
       looking at options of other packages to decide what to install.
     - Introduce LIBSELINUX_MAKE_TARGETS and
       LIBSELINUX_MAKE_INSTALL_TARGETS variable, in order to avoid
       duplicate the make/make install commands.
     - As suggested by Matt Weber, remove LIBSELINUX_PYTHONLIBDIR
       definitions, and don't pass PYLIBVER and PYTHONLIBDIR in
    MAKE_OPTS.]

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
