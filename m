From: Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp>
Date: Sat, 14 Nov 2015 12:05:49 +0900
Subject: [Buildroot] [PATCH] package/gauche: remove unnecessary files
 for target, fix a typo
In-Reply-To: Your message of Wed, 11 Nov 2015 14:24:17 +0100.
 <20151111142417.76bf1bb7@free-electrons.com>
Message-ID: <201511140305.tAE35n9r007347@ms-omx01.plus.so-net.ne.jp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas.
Thank you for your comment.

I sent 3 patches to fix these.
Please pullup them.

Raplied inline.

Thomas Petazzoni writes:
...
> > 2015-11-11 12:36:54	xtensa		gc not ported
> 
> Right, exclude this architecture.
Done.

> > 2015-11-10 23:30:21	powerpc		./libgauche-0.9.so: undefined reference
>  to `getcontext'
> 
> This probably only happens with certain C libraries only. Check if this
> build failure occurs with uClibc or glibc, probably only with uClibc.
Yes, it happen on uClibc, so I incorporated patch for this from
bdwgc package.

> > 2015-11-10 23:11:45	arc		gc not ported
> 
> Right, exclude this architecture as well.
Done.

> > 2015-11-10 22:20:21	powerpc		./libgauche-0.9.so: undefined reference
>  to `getcontext'
> > 2015-11-10 17:30:19	arc		gc not ported
> > 2015-11-10 14:16:58	sh4		./libgauche-0.9.so: undefined reference
>  to `getcontext'
> > 2015-11-10 08:46:51	powerpc		./libgauche-0.9.so: undefined reference
>  to `getcontext'
> > 2015-11-10 04:28:00	arm		./libgauche-0.9.so: undefined reference
>  to `AO_pt_lock'
> 
> This is what happens when libatomic_ops is built before gauche. In this
> case, gauche tries to use the external libatomic_ops instead of its
> internal one.
> 
> As I already suggested to fix this, you have two options:
> 
>  (1) Understand why using the external libatomic_ops doesn't work and
>      fix it.
> 
>  (2) Pass a configure option to gauche to force it to use its internal
>      version of libatomic_ops.
> 
> I'd prefer (1), but we can live with (2) if (1) is too complicated.
I choose (2) for now, patch posted.

> > 2015-11-10 00:00:05	arm		./include/private/../gc_pthread_redirec
> ts.h:37:22: fatal error: dlfcn.h: No such file or directory
> 
> Two options here:
> 
>  (1) boehm gc in gauche supports the GC_NO_DLOPEN like the official
>      boehm gc. In this case, pass -DGC_NO_DLOPEN when
>      BR2_STATIC_LIBS=y. See bdwgc.mk for an example.
> 
>  (2) Make gauche depend on !BR2_STATIC_LIBS.
Patch for this not sent yet.
After 3 patches are pullup, I will send for this.

Regards,
Kawashima
============================================================
    Hiroshi Kawashima
