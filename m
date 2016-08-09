From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 9 Aug 2016 10:49:51 +0200
Subject: [Buildroot] [PATCH] glibc: add version 2.24
In-Reply-To: <20160808164209.GA5876@free.fr>
References: <1470387567-64171-1-git-send-email-Vincent.Riera@imgtec.com>
 <20160805185348.4c0ff1fd@free-electrons.com>
 <20160808164209.GA5876@free.fr>
Message-ID: <20160809104951.1ad736d4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 8 Aug 2016 18:42:09 +0200, Yann E. MORIN wrote:

> > It is not written completely clearly: they first say that on
> > x86/x86-64, 2.6.32 is sufficient, but they conclude that 3.2 is the
> > minimum version on all architectures. It would be good to clarify this
> > aspect.  
> 
> What this means, at least what I understand it means, is that:
> 
>   - glibc 2.24 will not *run* on kernels more ancient than 3.2, except on
>     x86/x86_64, when it will not run on kernels older than 2.6.32.
> 
>     This is a runtime dependency.
> 
>   - glibc needs kernel headers 3.2 (or later) for all architectures,
>     even for x86/x86_64.
> 
>     This is a built-time dependency.

OK. From Buildroot's perspective, all what matters is the build-time
dependency. If the 3.2 kernel headers are needed to build glibc 2.24,
then glibc 2.24 should depend on headers >= 3.2.

> > Regardless of this detail, this means we will have to encode this
> > dependency somehow. Indeed, we still have people using kernels older
> > than 3.2 I believe on various platforms.  
> 
> On all but x86_x86_64, yes.

I don't get this. From my point of view, the x86/x86_64 "exception" is
of no use to us: all we are interested in is the build-time dependency.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
