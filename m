From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sun, 20 Apr 2014 20:54:02 +0200
Subject: [Buildroot] [PATCH 0/2] SMACK: mandatory access control
Message-ID: <1398020044-21021-1-git-send-email-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

This small series adds support for SMACK, the Simplified Mandatory Access
Control Kernel.

In computer security, a Mandatory Access Control is a mechanism where the
operating system contrains the access to an object (file, socket, ...) by a
subject (typically a process) according to rules. A well-known example is
SELinux.

SMACK is an implementation of this mechanism, aimed towards simplicity.
It can be used to harden embedded devices. It is currently used in Tizen.

This series introduces the "smack" package, which provides the user space
library as well as the tools to manage the access rules. When selecting this
package, the support for SMACK is actived in the kernel. SMACK is controlled
via the pseudo file system /sys/fs/smackfs. Systemd can mount it automatically
if compiled with SMACK support. So the systemd package has been updated
accordingly.

Best regards,
ELB

Eric Le Bihan (2):
  smack: new package.
  systemd: add SMACK support option.

 linux/linux.mk             |  4 ++++
 package/Config.in          |  1 +
 package/smack/Config.in    | 28 ++++++++++++++++++++++++++++
 package/smack/smack.mk     | 14 ++++++++++++++
 package/systemd/Config.in  | 14 ++++++++++++++
 package/systemd/systemd.mk | 13 +++++++++++++
 6 files changed, 74 insertions(+)
 create mode 100644 package/smack/Config.in
 create mode 100644 package/smack/smack.mk

-- 
1.9.0
