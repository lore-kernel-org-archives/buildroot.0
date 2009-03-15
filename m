From: Robert Urban <urban@unix-beratung.de>
Date: Sun, 15 Mar 2009 15:18:08 +0100
Subject: [Buildroot] added new package: ndyndns-1.14
Message-ID: <49BD0E20.7050906@unix-beratung.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

ndyndns is an update utility for dyndns. It depends on libcurl.  Here's the
package/Config.in diff:

Index: Config.in
===================================================================
--- Config.in   (revision 25601)
+++ Config.in   (working copy)
@@ -170,6 +170,7 @@
 source "package/mutt/Config.in"
 source "package/nbd/Config.in"
 source "package/ncftp/Config.in"
+source "package/ndyndns/Config.in"
 source "package/neon/Config.in"
 if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
 source "package/netcat/Config.in"


The files under package/ndyndns (including ndyndns directory) can be found at:

	http://www.spielwiese.de/rob/Buildroot/package-ndyndns.tgz

cheers,

Rob Urban

P.S. ndyndns is using ispunct()/isalnum() to process config files with lines
of the form "username=A_USERNAME". Apparently ispunct() doesn't think
equals-sign ('=') is punctuation.  I had to patch ndyndns to check for '\r'
and '\n' instead.  Is there some way of influencing what ispunct() thinks is
valid punctuation?
