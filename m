From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 08 Jul 2008 15:45:59 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/package/openssl
In-Reply-To: <d6cda7730807080635m5c2949e2me4b4cca844e82e07@mail.gmail.com>
	("Thiago A. =?utf-8?Q?Corr=C3=AAa=22's?= message of "Tue\, 8 Jul 2008
	10\:35\:21 -0300")
References: <20080708101305.8702C3C697@busybox.net>
	<20080708120426.GB30117@cloud.net.au>
	<d6cda7730807080525x78e47b99keb583cec5e3fd045@mail.gmail.com>
	<87bq18mtwg.fsf@macbook.be.48ers.dk>
	<d6cda7730807080616s2f16871fo498ad1ea9095ef75@mail.gmail.com>
	<87lk0cjyh3.fsf@macbook.be.48ers.dk>
	<d6cda7730807080635m5c2949e2me4b4cca844e82e07@mail.gmail.com>
Message-ID: <87vdzgh4ko.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thiago" == Thiago A Corr?a <thiago.correa@gmail.com> writes:

Hi,

 >> I don't get it, how do the files get installed into TARGET_DIR?
 >> 
 Thiago> Oh, that's because in the google repository it was made in different
 Thiago> commits, but there John changed it to use make install instead. He was
 Thiago> looking into the issue of having Midori and other packages connect to
 Thiago> https servers. To fix that, besides having a proper openssl install,
 Thiago> one needs to install the CA certificates. But none the less make
 Thiago> install is better than copying individual files.

Yes, if it doesn't install a bunch of unneeded stuff.

 Thiago> $(STAGING_DIR)/usr/lib/libcrypto.a: $(OPENSSL_DIR)/apps/openssl
 Thiago>         $(MAKE) CC=$(TARGET_CC) INSTALL_PREFIX=$(STAGING_DIR)/usr -C
 Thiago> $(OPENSSL_DIR) install
 Thiago>         $(MAKE) CC=$(TARGET_CC) INSTALL_PREFIX=$(TARGET_DIR) -C
 Thiago> $(OPENSSL_DIR) install

Ahh, we normally put those in seperate targets
($TARGET_DIR)/usr/lib/libcrypto... )

-- 
Bye, Peter Korsgaard
