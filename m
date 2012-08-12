From: Stefan Froberg <stefan.froberg@petroprogram.com>
Date: Sun, 12 Aug 2012 22:56:09 +0300
Subject: [Buildroot] [PATCH] valgrind: valgrind/valgrind.h missing if
	--disable-tls enabled
Message-ID: <1344801370-14582-1-git-send-email-stefan.froberg@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Enabling valgrind support and then doing debug build of Firefox
started configure script nagging about missing valgrind/valgrind.h file.

Found out that if --disable-tls is in VALGRIND_CONF_OPT then
the valgrind installation process will not include the previously mentioned file.

So this patch will enable/disable TLS for valgrind depending of
what you have in your compiler BR2_GCC_ENABLE_TLS setting.
