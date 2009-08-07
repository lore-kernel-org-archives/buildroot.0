From: Jean-Christian de Rivaz <jc@eclis.ch>
Date: Fri, 07 Aug 2009 21:52:16 +0200
Subject: [Buildroot] buildroot-libtool.patch failed with dbus 1.3.0
Message-ID: <4A7C85F0.7070604@eclis.ch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

In the hope to close a dbus issue, I tryed to update it to the version
1.3.0 by changing the DBUS_VERSION in package/dbus/dbus.mk.
Unfortunately this raised a libtool problem that seem specific to
buildroot as the native dbus archive compile without this problem:

 >>> dbus 1.3.0 Extracting
 >>> dbus 1.3.0 Patching libtool

Applying buildroot-libtool.patch using plaintext:
patching file ltmain.sh
Hunk #1 FAILED at 273.
Hunk #2 succeeded at 5425 (offset 3017 lines).
Hunk #3 FAILED at 5569.
Hunk #4 FAILED at 5913.
Hunk #5 succeeded at 8089 with fuzz 1 (offset 2466 lines).
Hunk #6 FAILED at 8414.
4 out of 6 hunks FAILED -- saving rejects to file ltmain.sh.rej
Patch failed!  Please fix buildroot-libtool.patch!
make: *** 
[/home/jcdr/try/buildroot/build_i686/dbus-1.3.0/.stamp_libtool_patch] 
Erreur 1

I tested also the last buildroot git tree with ARM and i386: same
result.

If I understand correctly, buildroot have a script
package/Makefile.autotools.in that try to patch the ltmain.sh for his
specific need. How can I disable or fix this ?

Best Regards,

Jean-Christian de Rivaz
