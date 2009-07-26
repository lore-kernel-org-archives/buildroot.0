From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 26 Jul 2009 07:15:22 +0000 (UTC)
Subject: [Buildroot] [Bug 321] alsa-lib uses host include files for python
 which breaks builds on 64 bit Linux
In-Reply-To: <bug-321-163@https.bugs.busybox.net/>
References: <bug-321-163@https.bugs.busybox.net/>
Message-ID: <20090726071522.9C086777FC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=321





--- Comment #1 from Ulf Samuelsson <ulf.samuelsson@atmel.com>  2009-07-26 07:15:21 UTC ---
Adding

 ALSA_LIB_CONF_OPT += --with-pythonlibs=-lpython$(PYTHON_VERSION_MAJOR)
+ALSA_LIB_CONF_OPT +=
--with-pythonincludes=-I$(STAGING_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR)
 ALSA_LIB_CFLAGS+=-I$(STAGING_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR)

to the alsa-lib build recipe seems to fix the problem.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
