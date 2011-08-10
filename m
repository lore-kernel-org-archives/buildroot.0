From: Frederic Bassaler <frederic.bassaler@gmail.com>
Date: Wed, 10 Aug 2011 19:25:20 +0200
Subject: [Buildroot] BUG: no https support with midori
Message-ID: <20110810192520.7524c2ab@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Midori needs libsoup to be compiled with SSL support, otherwise no
https support.

libsoup 2.32.2 needs libgnutls and libgcrypt, I have enabled them in
my .config, but libsoup refuses to compile :

checking pkg-config is at least version 0.16... yes
checking for GLIB - version >= 2.21.3... yes (version 2.28.6)
checking for XML... yes
checking for Win32... no
checking for gmtime_r... yes
checking for mmap... yes
checking for socket... yes
checking for LIBGNUTLS... yes
checking for libgcrypt-config... no
checking for LIBGCRYPT - version >= 1.2.0... no
configure: error: Could not configure SSL support.
Pass "--disable-ssl" if you really want to build without SSL support
make: ***
[/home/fred/buildroot/output/build/libsoup-2.32.2/.stamp_configured]
Erreur 1
