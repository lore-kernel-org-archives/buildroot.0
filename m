From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 26 May 2009 17:52:04 +0000 (UTC)
Subject: [Buildroot] [Bug 345] libcurl package needs a urandom fix
In-Reply-To: <bug-345-163@https.bugs.busybox.net/>
References: <bug-345-163@https.bugs.busybox.net/>
Message-ID: <20090526175205.13DA2777A8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=345





--- Comment #5 from Gustavo Zacarias <gustavo@zacarias.com.ar>  2009-05-26 17:52:04 UTC ---
If BR2_PACKAGE_XSERVER_tinyx is defined (but not
BR2_PACKAGE_XSERVER_XORG_SERVER) it stills pulls in openssl in
package/x11r7/xserver_xorg-server/xserver_xorg-server.mk but it doesn't select
it in package/x11r7/xserver_xorg-server/Config.in
It should probably be depended upon in the .mk file only if xorg biggie is
selected.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
