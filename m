From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 18 Nov 2014 22:06:36 +0100
Subject: [Buildroot] [PATCH 2/2] package/nodejs: remove config options
	--without-ssl2 and --without-ssl3
In-Reply-To: <1416224516-6065-2-git-send-email-jkrause@posteo.de>
 (=?utf-8?Q?=22J=C3=B6rg?=
 Krause"'s message of "Mon, 17 Nov 2014 12:41:56 +0100")
References: <1416224516-6065-1-git-send-email-jkrause@posteo.de>
 <1416224516-6065-2-git-send-email-jkrause@posteo.de>
Message-ID: <87zjbonrqb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "J?rg" == J?rg Krause <jkrause@posteo.de> writes:

 > The config options --without-ssl2 and --without-ssl3 are intended to be used if
 > nodejs is build with the bundled OpenSSL library for excluding the SSL2 and 
 > SSL3 features.

 > Both options are actual only evaluated if --without-ssl is not set:

 > $ cat configure | grep configure_openssl -n -A 13 
 > 619:def configure_openssl(o):
 > 620-  o['variables']['node_use_openssl'] = b(not options.without_ssl)
 > 621-  o['variables']['node_shared_openssl'] = b(options.shared_openssl)
 > 622-  o['variables']['openssl_no_asm'] = (
 > 623-    1 if options.openssl_no_asm else 0)
 > 624- 
 > 625-  if options.without_ssl:
 > 626-    return
 > 627-
 > 628-  if options.ssl2:
 > 629-    o['defines'] += ['OPENSSL_NO_SSL2=1']
 > 630-
 > 631-  if options.ssl3:
 > 632-    o['defines'] += ['OPENSSL_NO_SSL3=1']

 > This patch reverts commit e712638b4adc6e18b3ce99ab37b94530e9aa786f which does
 > not help to fix the build errors, eg.:
 > http://autobuild.buildroot.net/results/0bf/0bf17bf710db051d491123482c90f2f72810804b/

 > Signed-off-by: J?rg Krause <jkrause@posteo.de>

Committed with the commit message tweaked as suggested by Fabio, thanks.

-- 
Bye, Peter Korsgaard
