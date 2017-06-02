From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 02 Jun 2017 08:52:40 +0000
Subject: [Buildroot] [Bug 9926] systemd-resolved.service: Failed at step
 NAMESPACE (systemd 233)
In-Reply-To: <bug-9926-163@https.bugs.busybox.net/>
References: <bug-9926-163@https.bugs.busybox.net/>
Message-ID: <bug-9926-163-MKX63T2iDv@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9926

--- Comment #2 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
When Buildroot builds the kernel itself, and systemd is enabled, it makes sure
a number of options are enabled. From linux/linux.mk:

        $(if $(BR2_PACKAGE_SYSTEMD),
                $(call KCONFIG_ENABLE_OPT,CONFIG_CGROUPS,$(@D)/.config)
                $(call KCONFIG_ENABLE_OPT,CONFIG_INOTIFY_USER,$(@D)/.config)
                $(call KCONFIG_ENABLE_OPT,CONFIG_FHANDLE,$(@D)/.config)
                $(call KCONFIG_ENABLE_OPT,CONFIG_AUTOFS4_FS,$(@D)/.config)
                $(call KCONFIG_ENABLE_OPT,CONFIG_TMPFS_POSIX_ACL,$(@D)/.config)
                $(call
KCONFIG_ENABLE_OPT,CONFIG_TMPFS_POSIX_XATTR,$(@D)/.config))

Can you check if you have all those options enabled in your kernel
configuration?

-- 
You are receiving this mail because:
You are on the CC list for the bug.
