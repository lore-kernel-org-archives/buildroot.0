From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 27 Mar 2021 21:11:06 +0000
Subject: [Buildroot] [Bug 13271] systemd-resolved: /etc/resolv.conf link
 broken on per-package build
In-Reply-To: <bug-13271-163@https.bugs.busybox.net/>
References: <bug-13271-163@https.bugs.busybox.net/>
Message-ID: <bug-13271-163-lhTgpBoKw4@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13271

Yann E. MORIN <yann.morin.1998@free.fr> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |yann.morin.1998 at free.fr

--- Comment #3 from Yann E. MORIN <yann.morin.1998@free.fr> ---
Michael, All,

> define SYSTEMD_INSTALL_RESOLVCONF_HOOK
> 	ln -sf ../run/systemd/resolve/resolv.conf \
> 		$(TARGET_DIR)/etc/resolv.conf
> endef
> [...]
> SYSTEMD_POST_INSTALL_TARGET_HOOKS += \
> 	SYSTEMD_INSTALL_RESOLVCONF_HOOK

Indeed, a hook doing such changes should be made to be a target-fianlize
hook rather than a post-target-install hook.

In systemd, there is already a target-finalize hook, for the nsswitch
configuration file.

Care to send a patch, please?

Regards,
Yann E. MORIN.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
