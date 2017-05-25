From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 25 May 2017 10:38:19 +0200
Subject: [Buildroot] [RFC] package/gnutls: Don't use a full library path
	in	gnutls.pc
References: <20170520104031.6841-1-romain.naour@gmail.com>
Message-ID: <rohivdxlhq.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Sat, 20 May 2017 12:40:31 +0200 schrieb Romain Naour:

> [1] https://gitlab.com/gnutls/gnutls/issues/203

Hi,

upstream responded:

> Note that static linking applications with gnutls is not something
> supported. gnutls relies on library constructors and destructors which 
> are not loaded when linking statically.

I am preparing a patch right now adding "depends on !BR2_STATIC_LIBS" to 
gnutls and the packages depending on it.

Regards, Bernd
