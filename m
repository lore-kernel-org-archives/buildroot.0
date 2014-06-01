From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 1 Jun 2014 14:51:19 +0200
Subject: [Buildroot] UCLIBC_EXTRA_CFLAGS in uClibc overridden while
 using buildroot
In-Reply-To: <5315041D.9010906@zacarias.com.ar>
References: <43F7AEDD312F9E499A1A4E3608E505ED2ABF12D3@SJEXCHMB09.corp.ad.broadcom.com>
 <20130607115530.7132b7b1@skate>
 <43F7AEDD312F9E499A1A4E3608E505ED2ABF14F2@SJEXCHMB09.corp.ad.broadcom.com>
 <5315041D.9010906@zacarias.com.ar>
Message-ID: <20140601145119.128ff510@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 03 Mar 2014 19:37:17 -0300, Gustavo Zacarias wrote:
> On 06/07/2013 06:08 PM, Rajendra Dendukuri wrote:
> 
> > Thanks for the inputs. The said patch works. Can we get this into release buildroot source tree.
> 
> Hi.
> Revived old thread!
> It may work for your particular case, but generally, it's a bad idea to
> allow tweaking libc build CFLAGS, specially when they're merged with
> package CFLAGS.
> What's the intention of this, fixing some problem or just plain
> optimization?
> The patch as it is right now would break PowerPC SPE ABI toolchains and
> probably Xtensa to a certain degree too (see package/Makefile.in)
> A config option with separate extra CFLAGS for uClibc could be
> introduced, but really, if it's not fixing anything in particular, why?
> If you're fixing some issue in a determined fixed scenario then it might
> be good to make it automatic.

Almost three months later after Gustavo's request for more details, the
original submitter hasn't provide these details. I'm therefore marking
the patch as Rejected in patchwork. Rajendra, if you think your patch
is still useful, please resend an updated version, with a more detailed
explanation of the cases where it is needed.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
