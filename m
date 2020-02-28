From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 28 Feb 2020 15:54:10 +0000
Subject: [Buildroot] [Bug 12576] 2020.02-RC1: error while loading shared
 libraries: libsystemd-shared-244.so
In-Reply-To: <bug-12576-163@https.bugs.busybox.net/>
References: <bug-12576-163@https.bugs.busybox.net/>
Message-ID: <bug-12576-163-vp0DH16am0@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12576

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Hello Melanie,

Thanks for your bug report. Could you try the below patch, and see if it fixes
the issue for you:

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 1150fd390e..20637f3a8a 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -570,6 +570,7 @@ HOST_SYSTEMD_DEPENDENCIES = \
 # * thus re-tweak rpath after the installation for all binaries that need it
 HOST_SYSTEMD_HOST_TOOLS = \
        systemd-analyze \
+       systemd-machine-id-setup \
        systemd-mount \
        systemctl \
        udevadm

-- 
You are receiving this mail because:
You are on the CC list for the bug.
