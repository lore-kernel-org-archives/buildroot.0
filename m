From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 14 Feb 2017 20:25:15 +0100
Subject: [Buildroot] [PATCH] bctoolbox: fix typos and logic error
In-Reply-To: <1487089783.1684.5.camel@embedded.rocks> (=?utf-8?Q?=22J?=
 =?utf-8?Q?=C3=B6rg?= Krause"'s message
 of "Tue, 14 Feb 2017 17:29:43 +0100")
References: <20170214090132.GA5012@waldemar-brodkorb.de>
 <1487085729.1684.3.camel@embedded.rocks>
 <20170214153958.GE12810@waldemar-brodkorb.de>
 <1487089783.1684.5.camel@embedded.rocks>
Message-ID: <878tp8k21w.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "J?rg" == J?rg Krause <joerg.krause@embedded.rocks> writes:

Hi,

 >> Do you have a chance to suggest a better fix and test with static
 >> linking?

 > From my understanding of pkg-config, 'Libs.private' should be:

 > """
 > Libs.private:??-lmbedtls -lmbedcrypto -lmbedx509

And possibly a -L to where these libraries are located (which is the
original issue).

 > """
 > -L/mnt/data/git/buildroot/output/host/usr/arm-buildroot-linux-
 > uclibcgnueabi/sysroot/usr/lib -lbctoolbox -lmbedtls -lmbedcrypto
 > -lmbedx509
 > """

 > .. which should be correct.

WIll you send a patch to do this?

-- 
Bye, Peter Korsgaard
