From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 19 Jul 2013 00:39:29 +0200
Subject: [Buildroot] [PATCH 3/4] package/nss-mdns: do not overwrite
	user's nsswitch.conf
In-Reply-To: <30a72c128f8850ae5ee21e06365bc89e37c6e9ab.1374182572.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Thu, 18 Jul 2013 23:24:14 +0200")
References: <cover.1374182572.git.yann.morin.1998@free.fr>
 <cover.1374182572.git.yann.morin.1998@free.fr>
 <30a72c128f8850ae5ee21e06365bc89e37c6e9ab.1374182572.git.yann.morin.1998@free.fr>
Message-ID: <8761w7wl0e.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 Yann> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
 Yann> Instead of over-writing the nsswitch.conf file (which may already
 Yann> contain user's specific configuration if it comes from a rootfs
 Yann> overlay, or a custom skeleton), just replace the 'hosts' line.

It's only an issue for custom skeletons, not overlays as they are only
added after all the packages are built.

Committed with the description adjusted, thanks.

-- 
Bye, Peter Korsgaard
