From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 18 Dec 2015 08:24:32 +0000
Subject: [Buildroot] [Bug 8536] Building sudo with PAM results in unusable
	sudo
In-Reply-To: <bug-8536-163@https.bugs.busybox.net/>
References: <bug-8536-163@https.bugs.busybox.net/>
Message-ID: <bug-8536-163-dy1hqMtocL@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8536

--- Comment #2 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
(In reply to James Knight from comment #1)
Our sudo package is already automatically installing a /etc/pam.d/sudo file,
see:

ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
define SUDO_INSTALL_PAM_CONF
        $(INSTALL) -D -m 0644 package/sudo/sudo.pam
$(TARGET_DIR)/etc/pam.d/sudo
endef

So I guess the bug reporter expect things to work properly out of the box.
James, did you test with the /etc/pam.d/sudo file installed by default by
Buildroot?

-- 
You are receiving this mail because:
You are on the CC list for the bug.
