From: Waldemar Brodkorb <wbx@openadk.org>
Date: Mon, 23 Nov 2015 18:40:10 +0100
Subject: [Buildroot] [PATCH] jimtcl: fix sparc64 compile
In-Reply-To: <20151123182955.0bd4db5d@free-electrons.com>
References: <20151123164853.GA29207@waldemar-brodkorb.de>
 <20151123182955.0bd4db5d@free-electrons.com>
Message-ID: <20151123174010.GA19876@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,
Thomas Petazzoni wrote,

> Waldemar,
> 
> On Mon, 23 Nov 2015 17:48:53 +0100, Waldemar Brodkorb wrote:
> > It is general safe to use -fPIC for all architectures.
> > -fpic breaks sparc64 compile.
> > 
> > Generally gcc just optimize position independent code
> > for m68k, powerpc and sparc with -fpic.
> > The size differences are minimal, f.e. for powerpc:
> >    text    data     bss     dec     hex filename
> >  235983    5336     684  242003   3b153 output/target/usr/lib/libjim.0.75
> >  236255    8456     684  245395   3be93 output/target/usr/lib/libjim.so.0.75
> > 
> > So instead of keeping special settings for sparc64 it would be better
> > to always use -fPIC in general.
> 
> So in other words, you're saying that in other packages that add -fPIC
> only for sparc/sparc64, we should add it unconditionally?

Yes. I think we should get those patches upstream. I hope they don't
come up with any reasons for -fpic. I can't see any in our use case.
 
> > +# -fPIC works for any architecture
> 
> I think this comment is a bit useless. It should rather be:
> 
> # -fPIC is mandatory to build shared libraries on certain architectures
> # (e.g. SPARC) and causes no harm or drawbacks on other architectures

Can you fix it before commit? :=)

best regards
 Waldemar
