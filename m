From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 11 Jun 2021 18:51:30 +0000
Subject: [Buildroot] [Bug 13831] mesa3d - kmsro driver requires dri3
In-Reply-To: <bug-13831-163@https.bugs.busybox.net/>
References: <bug-13831-163@https.bugs.busybox.net/>
Message-ID: <bug-13831-163-l2sgz73Zka@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13831

--- Comment #2 from Peter Seiderer <ps.report@gmx.net> ---
(In reply to Erico Nunes from comment #1)

I can confirm  X11/glxgears runtime failure with dri3 disabled (on RPi4) and a
running glxgears with package/mesa3d/mesa3d.mk hacked to '-Ddri3=enabled'...

The mentioned patches are '[RFC,v2,01/12] package/mesa3d: add config option for
DRI3 support' ([1] and '[RFC,v2,04/12] package/mesa3d: DRI3 with GLX needs
xshmfence' ([2]), already considered to update patch one to the new dri3
sensitivity..., but needs more time to do it accurate because of the
BR2_TOOLCHAIN_HAS_SYNC_4 dependency stuff...

[1]
https://patchwork.ozlabs.org/project/buildroot/patch/20210110222833.26301-2-ps.report at gmx.net/
[2]
https://patchwork.ozlabs.org/project/buildroot/patch/20210110222833.26301-5-ps.report at gmx.net/

-- 
You are receiving this mail because:
You are on the CC list for the bug.
