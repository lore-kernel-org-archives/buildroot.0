From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 11 Oct 2012 20:51:59 -0300
Subject: [Buildroot] rpm5
In-Reply-To: <50774BED.9040400@mind.be>
References: <1349695691.6518.2.camel@localhost> <50748D38.6000101@mind.be>
 <CABtOAfzoOqrjf83+caK4moJc26RsKEfvej2rOBS0ma2vw8-fpQ@mail.gmail.com>
 <507744C6.6010303@mind.be>
 <CABtOAfwz7TLgP5qf6HKhFnK-isC92GRxgjTjLM9VsW_B5xYrxA@mail.gmail.com>
 <50774BED.9040400@mind.be>
Message-ID: <50775B9F.8030101@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/11/12 19:45, Arnout Vandecappelle wrote:

>  LIB_GOMP should have been set to -lgomp if openmp is enabled, so that
> patch
> wouldn't do much AFAICS.
> 
>  Oh, but now I see the real issue: in beecrypt's acinclude.m4, they
> check for
> $OPENMP_CFLAGS to decide if OPENMP_LIBS should be set.  But you don't
> need to
> pass any option to enable openmp, so $OPENMP_CFLAGS is empty...  Instead it
> should check for $ac_cv_prog_c_openmp.
> 
>  Since AFAIK we have no toolchain that supports OpenMP in buildroot, I'm
> not
> sure if it makes sense to patch it in buildroot...

The internal toolchain has support/an option for OpenMP
(BR2_ENABLE_GCC_OPENMP).
So it should probably be handled in the beecrypt package.
Regards.
