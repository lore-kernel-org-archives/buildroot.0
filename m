From: Waldemar Brodkorb <wbx@openadk.org>
Date: Fri, 4 Dec 2015 06:40:03 +0100
Subject: [Buildroot] [PATCH] bdwgc: fix compile for sparc
In-Reply-To: <87lh9bcluc.fsf@dell.be.48ers.dk>
References: <20151203144655.GA13813@waldemar-brodkorb.de>
 <87lh9bcluc.fsf@dell.be.48ers.dk>
Message-ID: <20151204054003.GM19876@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,
Peter Korsgaard wrote,

> >>>>> "Waldemar" == Waldemar Brodkorb <wbx@openadk.org> writes:
>  > +* src/sparc_sunos4_mach_dep.s: Likewise.
> 
> Please also sign off on the patch.

Sent new version.
 
> > +++ b/package/bdwgc/bdwgc.mk
>  > @@ -19,6 +19,9 @@ BDWGC_DEPENDENCIES = libatomic_ops host-pkgconf
>  >  BDWGC_AUTORECONF = YES
>  
>  >  BDWGC_CFLAGS = $(TARGET_CFLAGS)
>  > +ifeq ($(BR2_sparc),y)
>  > +BDWGC_CFLAGS += -DAO_NO_SPARC_V9
> 
> Should this also be done for for the v9 variant? (E.G BR2_sparc_v9)

There is no v9 variant anymore. Just sparcv8/leon3.
But I have sent a patch to allow building for sparc64 with sparc v9,
which does not require to set AO_NO_SPARC_V9, because it is v9 ;)

best regards
 Waldemar
