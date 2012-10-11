From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 12 Oct 2012 00:45:01 +0200
Subject: [Buildroot] rpm5
In-Reply-To: <CABtOAfwz7TLgP5qf6HKhFnK-isC92GRxgjTjLM9VsW_B5xYrxA@mail.gmail.com>
References: <1349695691.6518.2.camel@localhost> <50748D38.6000101@mind.be>
 <CABtOAfzoOqrjf83+caK4moJc26RsKEfvej2rOBS0ma2vw8-fpQ@mail.gmail.com>
 <507744C6.6010303@mind.be>
 <CABtOAfwz7TLgP5qf6HKhFnK-isC92GRxgjTjLM9VsW_B5xYrxA@mail.gmail.com>
Message-ID: <50774BED.9040400@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/10/12 00:27, Alexander Khryukin wrote:
> I wrote a simple patch that enables support of -lgomp instead of $LIB_GOMP macro

  LIB_GOMP should have been set to -lgomp if openmp is enabled, so that patch
wouldn't do much AFAICS.

  Oh, but now I see the real issue: in beecrypt's acinclude.m4, they check for
$OPENMP_CFLAGS to decide if OPENMP_LIBS should be set.  But you don't need to
pass any option to enable openmp, so $OPENMP_CFLAGS is empty...  Instead it
should check for $ac_cv_prog_c_openmp.

  Since AFAIK we have no toolchain that supports OpenMP in buildroot, I'm not
sure if it makes sense to patch it in buildroot...

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
