From: Stridh, Robin ActeSE <robin.stridh@acteembedded.se>
Date: Tue, 17 Feb 2009 22:23:00 +0100
Subject: [Buildroot] GTK applications fails on AT91SAM9263
Message-ID: <5B920D714A1C354D8949DBF58C2A35D604139AE3@freja.acte.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

The default system for AT91SAM9263 using at91sam9263ek_defconfig builds without errors on my Ubuntu 8.10 (after some small fixes on the host system). However running GTK programs on the target using this root file system fails with the following error:

# gtk-demo 
** GLib:ERROR:(gstrfuncs.c:379):IA__g_ascii_strtod: assertion failed: (decimal_point_len != 0)

After finding out that this was related to "locale", I rebuilt my toolchain without locale support (I also removed wchar) and suddenly it works (ok, still a lot of things missing, but at least the application gtk-demo starts).

I know wchar and locale support are ususally demanded for building tinyX, but obviously not allowed for building GTK stuff. Does this mean you cannot use the same toolchain for building X and GTK-DirectFB applications?

Can someone explain what locale support in the toolchain actually means, and how come it conflicts with GTK? 

Best regards,
Robin
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090217/0873cbda/attachment.htm>
