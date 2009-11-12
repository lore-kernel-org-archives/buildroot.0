From: llandwerlin at gmail.com <llandwerlin@gmail.com>
Date: Thu, 12 Nov 2009 23:33:12 +0100
Subject: [Buildroot] gst-plugins-bad dependencies fix
Message-ID: <1258065198-22972-1-git-send-email-llandwerlin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following patches fix dependencies problems I had seen when
compiling the gst-plugins-bad package.

The thing is that the configure script did not raised any error on
missing librairies (libcdaudio, libdvdread, libdvdnav and openssl), I
just got error at compilation/link time (missing headers, missing
library at link). I guess there is something wrong with the check of
those packages (there are probably not using pkg-config), because they
are installed on my host system and detected when cross compiling.
Anyway, those patches still fix a real problem.

Here the patch list :

[PATCH 1/6] Added libcdaudio package (dependency of gst-plugins-bad)
[PATCH 2/6] Fix gst-plugins-bad dependency on libcdaudio
[PATCH 3/6] Fix gst-plugins-bad dependency on openssl through the apexsink element
[PATCH 4/6] Added libdvdread package (dependency of gst-plugins-bad)
[PATCH 5/6] Added libdvdnav package (dependency of gst-plugins-bad)
[PATCH 6/6] Fix gst-plugins-bad dependency on libdvdnav

--
Lionel Landwerlin <llandwerlin@gmail.com>
