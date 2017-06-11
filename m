From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Jun 2017 16:27:32 +0200
Subject: [Buildroot] [PATCH v6 1/1] linuxptp: new package
In-Reply-To: <1496861069-6958-1-git-send-email-brain@jikos.cz>
References: <1496861069-6958-1-git-send-email-brain@jikos.cz>
Message-ID: <20170611162732.7e700d0c@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  7 Jun 2017 20:44:29 +0200, Petr Kulhavy wrote:
> Add the Linux PTP Project package.
> http://linuxptp.sourceforge.net/
> 
> The SysV and systemd init scripts start the daemon in slave-only mode on eth0
> and synchronize the system clock to PTP.
> 
> Signed-off-by: Petr Kulhavy <brain@jikos.cz>
> --
> Changes v5 -> v6:
> 	- fix broken SYSV init-script path in makefile
> 	- use current GIT head with fixed issues instead of the released version 1.8
> 	- remove patches as they are now integrated in GIT
> 
> Changes v4 -> v5:
> 	- move ptp4l parameters into a config file /etc/linuxptp.cfg
> 	- add step threshold of 1 second into the configuration to quickly correct large errors
> 	- add systemd service for phc2sys to sync the system clock
> 
> Changes v3 -> v4:
> 	- rename init scripts to linuxptp
> 	- use git format of the additional patches
> 	- use the package name in menuconfig 
> 	- clean-up the clock_nanosleep patch
> 
> Changes v2 -> v3:
> 	- add patches to fix build issues and enable compilation on all targets
> 
> Changes v1 -> v2:
> 	- rename package from ptp4l to linuxptp
> 	- add EXTRA_LDFLAGS to the build cmd (suggested by Danomi Manchego)
> 	- sysV startup script: add restart/reload code, use PID file
> 	- clean-up empty lines and formatting issues
> 	- license uses SPDX license code
> 	- update DEVELOPERS file
> ---
>  DEVELOPERS                                     |  3 ++
>  package/Config.in                              |  1 +
>  package/linuxptp/Config.in                     | 13 ++++++++
>  package/linuxptp/S65linuxptp                   | 46 ++++++++++++++++++++++++++
>  package/linuxptp/linuxptp-system-clock.service | 11 ++++++
>  package/linuxptp/linuxptp.cfg                  | 19 +++++++++++
>  package/linuxptp/linuxptp.hash                 |  2 ++
>  package/linuxptp/linuxptp.mk                   | 43 ++++++++++++++++++++++++
>  package/linuxptp/linuxptp.service              | 11 ++++++
>  9 files changed, 149 insertions(+)
>  create mode 100644 package/linuxptp/Config.in
>  create mode 100755 package/linuxptp/S65linuxptp
>  create mode 100644 package/linuxptp/linuxptp-system-clock.service
>  create mode 100644 package/linuxptp/linuxptp.cfg
>  create mode 100644 package/linuxptp/linuxptp.hash
>  create mode 100644 package/linuxptp/linuxptp.mk
>  create mode 100644 package/linuxptp/linuxptp.service

Applied to master, thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
