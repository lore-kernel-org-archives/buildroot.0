From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 9 Apr 2017 15:43:49 +0200
Subject: [Buildroot] [PATCH 2/4] checkpolicy: allow compiling for target
In-Reply-To: <20170202224505.22882-2-Adamduskett@outlook.com>
References: <20170202224505.22882-1-Adamduskett@outlook.com>
 <20170202224505.22882-2-Adamduskett@outlook.com>
Message-ID: <20170409154349.0e5dfd1d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  2 Feb 2017 17:45:03 -0500, Adam Duskett wrote:
> checkpolicy is currently a host-only package, however it is a dependency
> of audit2allow.  This patch allows for checkpolicy to be compiled for the
> target.
> 
> Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
> ---
>  package/Config.in                  |  1 +
>  package/checkpolicy/Config.in      | 11 +++++++++++
>  package/checkpolicy/checkpolicy.mk | 23 +++++++++++++++++++++++
>  3 files changed, 35 insertions(+)
>  create mode 100644 package/checkpolicy/Config.in

Applied to master with the following changes:

    [Thomas:
     - remove LIBSELINUX_INSTALL_STAGING = YES, doing it in
       checkpolicy.mk is wrong, and libselinux is already installed to
       staging
     - add "select BR2_PACKAGE_LIBSELINUX" in Config.in, and propagate the
       necessary dependencies
     - add host-flex in dependencies, since it is also needed (in addition
       to target flex).]

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
