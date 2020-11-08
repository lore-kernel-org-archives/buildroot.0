From: C Larbi <pkl2000us@gmail.com>
Date: Sun, 8 Nov 2020 21:07:57 +0000
Subject: [Buildroot] [ISSUE] webkitgtk/webkitgtk.mk
Message-ID: <CANVomh9b1fBc6vzrqjttcFijQP3Pi6tFSRkWKWgpPrhh6MZa1g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Compiling webkitgtk for a raspberrypi4 target using busybox as init throws
a "requires systemd" error at configuration stage

was solved adding command to configuration options in webkitgtk.mk:

WEBKITGTK_DEPENDENCIES = host-ruby host-python host-gperf \
	enchant harfbuzz icu jpeg libgcrypt libgtk3 libsecret libsoup \
	libtasn1 libxml2 libxslt openjpeg sqlite webp woff2
WEBKITGTK_CONF_OPTS = \
	-DENABLE_API_TESTS=OFF \
	-DENABLE_GEOLOCATION=OFF \
	-DENABLE_GTKDOC=OFF \
	-DENABLE_INTROSPECTION=OFF \
	-DENABLE_MINIBROWSER=ON \
	-DENABLE_SPELLCHECK=ON \
	-DPORT=GTK \
+       *-DUSE_SYSTEMD=OFF \*
	-DSILENCE_CROSS_COMPILATION_NOTICES=ON \
	-DUSE_LIBNOTIFY=OFF \
	-DUSE_LIBHYPHEN=OFF \
	-DUSE_OPENJPEG=ON \
	-DUSE_WOFF2=ON \
	-DUSE_WPE_RENDERER=OFF

regards
Cerezo
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20201108/895e0324/attachment.html>
