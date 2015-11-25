From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 26 Nov 2015 00:06:36 +0100
Subject: [Buildroot] [PATCH 0/4] autobuild: new config options;
	conf file, startup script (branch yem/limits)
Message-ID: <cover.1448492437.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series, against the autobuilder tree, adds two new configuration
options, a sample runtime config file, and a SysV init startup script.

The two new rutime options are:
  --nice N      specify the niceness of the 'make' command
  --pid-file    file where to save the main process PID

The niceness allows limitting the impact of the autobuilder on the rest
of the job, when on a shared machine. A better solution would be to
implement a container with cgroups, but a systemd unit file would be so
much convenient! ;-)

The PID file allows to simplify the startup script, and really ensure
that we get the autobuild process' PID.

A SysV init startup script, as well as a sample defaults config file are
provided, to ease running the autobuild script as a daemon.

A sample runtime configuration file is provided as well.

Note that nothing in there is really bullet-proof...

Regards,
Yann E. MORIN.


The following changes since commit 611b515aa40c635d1af24883a9eab9e1e363a33c:

  Add mips32r6 and mips64r6 toolchains (2015-11-22 15:31:07 +0100)

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot-test yem/limits

for you to fetch changes up to 9243b48a5bc32c35039519eabf4b6946f36f3260:

  etc: add SysV-init startup script and sample config file (2015-11-25 23:58:32 +0100)

----------------------------------------------------------------
Yann E. MORIN (4):
      autobuild: add config option to set niceness
      autobuild: store PID to PID file
      conf: add a sample run-time configuration file
      etc: add SysV-init startup script and sample config file

 conf/buildroot-autobuild.sample |   5 ++
 etc/default/buildroot-autobuild |  23 +++++++
 etc/init.d/buildroot-autobuild  | 148 ++++++++++++++++++++++++++++++++++++++++
 scripts/autobuild-run           |  17 ++++-
 4 files changed, 192 insertions(+), 1 deletion(-)
 create mode 100644 conf/buildroot-autobuild.sample
 create mode 100644 etc/default/buildroot-autobuild
 create mode 100755 etc/init.d/buildroot-autobuild

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
