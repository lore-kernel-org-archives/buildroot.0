From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon,  7 Jun 2010 10:20:06 +0000 (UTC)
Subject: [Buildroot] [Bug 1723] [PATCH] axel: convert to autotools
	infrastructure
In-Reply-To: <bug-1723-163@https.bugs.busybox.net/>
References: <bug-1723-163@https.bugs.busybox.net/>
Message-ID: <20100607102006.D3A25834CE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1723

--- Comment #2 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com>  ---
Thanks!

However, this patch is not completely correct :

 * AXEL_CONFIGURE_CMDS shouldn't be defined. Instead, you should use
AXEL_CONF_OPT to pass the --i18n=0 option. No need to pass --prefix.

 * Are you sure you need to pass AXEL_MAKE_OPT and AXEL_INSTALL_TARGET ? If the
package uses autoconf/automake, it shouldn't be needed.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
