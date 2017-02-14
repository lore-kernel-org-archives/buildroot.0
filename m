From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Tue, 14 Feb 2017 21:10:54 +0100
Subject: [Buildroot] [PATCH] bctoolbox: fix typos and logic error
In-Reply-To: <878tp8k21w.fsf@dell.be.48ers.dk>
References: <20170214090132.GA5012@waldemar-brodkorb.de>
 <1487085729.1684.3.camel@embedded.rocks>
 <20170214153958.GE12810@waldemar-brodkorb.de>
 <1487089783.1684.5.camel@embedded.rocks> <878tp8k21w.fsf@dell.be.48ers.dk>
Message-ID: <1487103054.4255.1.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 2017-02-14 at 20:25 +0100, Peter Korsgaard wrote:
> > > > > > "J?rg" == J?rg Krause <joerg.krause@embedded.rocks> writes:
> 
> Hi,
> 
> ?>> Do you have a chance to suggest a better fix and test with static
> ?>> linking?
> 
> ?> From my understanding of pkg-config, 'Libs.private' should be:
> 
> ?> """
> ?> Libs.private:??-lmbedtls -lmbedcrypto -lmbedx509
> 
> And possibly a -L to where these libraries are located (which is the
> original issue).

Is this necassary? I had a look at some pkg-config files and none of
them used '-L' in 'Libs.private', only in 'Libs:'

> ?> """
> ?> -L/mnt/data/git/buildroot/output/host/usr/arm-buildroot-linux-
> ?> uclibcgnueabi/sysroot/usr/lib -lbctoolbox -lmbedtls -lmbedcrypto
> ?> -lmbedx509
> ?> """
> 
> ?> .. which should be correct.
> 
> WIll you send a patch to do this?

Sure.

J?rg
