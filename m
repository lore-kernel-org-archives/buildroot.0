From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 03 Mar 2014 19:37:17 -0300
Subject: [Buildroot] UCLIBC_EXTRA_CFLAGS in uClibc overridden while
 using buildroot
In-Reply-To: <43F7AEDD312F9E499A1A4E3608E505ED2ABF14F2@SJEXCHMB09.corp.ad.broadcom.com>
References: <43F7AEDD312F9E499A1A4E3608E505ED2ABF12D3@SJEXCHMB09.corp.ad.broadcom.com>
 <20130607115530.7132b7b1@skate>
 <43F7AEDD312F9E499A1A4E3608E505ED2ABF14F2@SJEXCHMB09.corp.ad.broadcom.com>
Message-ID: <5315041D.9010906@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/07/2013 06:08 PM, Rajendra Dendukuri wrote:

> Thanks for the inputs. The said patch works. Can we get this into release buildroot source tree.

Hi.
Revived old thread!
It may work for your particular case, but generally, it's a bad idea to
allow tweaking libc build CFLAGS, specially when they're merged with
package CFLAGS.
What's the intention of this, fixing some problem or just plain
optimization?
The patch as it is right now would break PowerPC SPE ABI toolchains and
probably Xtensa to a certain degree too (see package/Makefile.in)
A config option with separate extra CFLAGS for uClibc could be
introduced, but really, if it's not fixing anything in particular, why?
If you're fixing some issue in a determined fixed scenario then it might
be good to make it automatic.
Regards.
