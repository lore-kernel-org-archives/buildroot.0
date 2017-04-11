From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 11 Apr 2017 14:40:12 +0200
Subject: [Buildroot] [PATCH 3/4] libselinux: allow compiling python
 wrapper module for target
In-Reply-To: <20170202224505.22882-3-Adamduskett@outlook.com>
References: <20170202224505.22882-1-Adamduskett@outlook.com>
 <20170202224505.22882-3-Adamduskett@outlook.com>
Message-ID: <20170411144012.10215812@free-electrons.com>
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

This causes some build failures:
http://autobuild.buildroot.net/results/db1/db1e6f3054092fc5576ccab8e04a3b9d74ca9a8c/build-end.log.

Could you have a look ?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
