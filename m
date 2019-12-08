From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 08 Dec 2019 11:22:53 +0100
Subject: [Buildroot] [PATCH 1/1] package/ytree: fix license
In-Reply-To: <CAPi7W81M3ygL=uv8ZZ4D87_ju+LXpKjLFA_Aju-L-EbLh8P8pA@mail.gmail.com>
 (Fabrice Fontaine's message of "Sun, 8 Dec 2019 09:50:39 +0100")
References: <20191207212720.1301402-1-fontaine.fabrice@gmail.com>
 <87h82bjlv8.fsf@dell.be.48ers.dk>
 <CAPi7W81M3ygL=uv8ZZ4D87_ju+LXpKjLFA_Aju-L-EbLh8P8pA@mail.gmail.com>
Message-ID: <87v9qri0aq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Dear Peter,
 > Le dim. 8 d?c. 2019 ? 08:51, Peter Korsgaard <peter@korsgaard.com> a ?crit :
 >> 
 >> >>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:
 >> 
 >> > License is GPL-2.0+ not GPL-2.0 as specified in files that contain
 >> > license information: tilde.{h,c} and xmalloc.{h,c}
 >> 
 >> ytree is messy. I have been in contact with the upstream developer to
 >> clarify this, and he ended up releasing a 2.0 tarball with no code
 >> changes, just the clarification that it is released under GPL-2.0+. That
 >> tarball unfortunately had some issues (including having a GPL-3.0 COPYING
 >> file rather than 2.0), which I pointed out but never heard back.
 >> 
 >> I have just redownloaded the 2.0 tarball, and I see the COPYING file has
 >> been silently changed to 2.0, so perhaps a nicer solution would be to
 >> combine this license change with the bump to 2.0?
 > COPYING from current version (1.99pl2) is already a GPL-2.0 COPYING
 > file so I don't know when upstream made this change but for sure hash
 > of COPYING is the same in 1.99pl2 and 2.00.

Yes, but the 2.00 release has the following snippet added to the CHANGES
and README files:

diff -u ytree-1.99pl2/CHANGES ytree-2.00/CHANGES
--- ytree-1.99pl2/CHANGES       2019-09-29 12:37:57.000000000 +0200
+++ ytree-2.00/CHANGES  2019-11-16 17:38:11.000000000 +0100
@@ -157,4 +157,7 @@
     Debug Path display for non color mode (Thanks to Ali)
 New in 1.99pl2
     Filename extensions debug (Thanks to Frank)
+New in 2.00
+    No new functionality, but changed the copyright to GPLv2 or
+    (at your option) any later version.

--- ytree-1.99pl2/README        2019-09-29 12:37:57.000000000 +0200
+++ ytree-2.00/README   2019-11-16 17:28:11.000000000 +0100
@@ -53,5 +53,7 @@
        your ~/.bashrc. See the man page for details.

 Copyright
-       This program is distributed as free software under the GNU
-       license (see COPYING for more information).
+       This program is free software; you can redistribute it and/or modify it
+        under the terms of the GNU General Public License as published by the
+        Free Software Foundation; either version 2 of the License,
+        or (at your option) any later version.

Which clarifies that it is indeed GPL-2.0+

And as I mentioned, the 2.00 tarball has later been fixed up to include
the correct COPYING file.

-- 
Bye, Peter Korsgaard
