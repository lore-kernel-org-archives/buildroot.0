From: llandwerlin at gmail.com <llandwerlin@gmail.com>
Date: Fri, 11 Dec 2009 00:31:12 +0100
Subject: [Buildroot] [PATCH 0/6] gst-plugins-bad dependencies fix v2
Message-ID: <1260487878-21126-1-git-send-email-llandwerlin@gmail.com>
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

Here the patch list updated upon Peter's feedback :
[PATCH 1/6] package: Added libcdaudio package (dependency of gst-plugins-bad)
[PATCH 2/6] gst-plugins-bad: Fix dependency on libcdaudio
[PATCH 3/6] gst-plugins-bad: Fix dependency on openssl through the apexsink element
[PATCH 4/6] package: Added libdvdread package (dependency of gst-plugins-bad)
[PATCH 5/6] package: Added libdvdnav package (dependency of gst-plugins-bad)
[PATCH 6/6] gst-plugins-bad: Fix dependency on libdvdnav

--
Lionel Landwerlin
