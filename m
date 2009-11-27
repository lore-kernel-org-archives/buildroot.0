From: Joachim Pihl <jpihl@nevion.com>
Date: Fri, 27 Nov 2009 09:03:16 +0100
Subject: [Buildroot] 2009.11-rc1 build failure
In-Reply-To: <873a419x3e.fsf@macbook.be.48ers.dk>
References: <op.u3z7srteyqa4qb@jap-lappis> <873a419x3e.fsf@macbook.be.48ers.dk>
Message-ID: <op.u31nbqpqyqa4qb@jap-lappis.nevion.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 26 Nov 2009 15:31:17 +0100, Peter Korsgaard <jacmet@uclibc.org>  
wrote:

> Huh, that's wrong - The config you attached has:
>
> BR2_KERNEL_HEADERS_2_6_31=y
> # BR2_KERNEL_HEADERS_VERSION is not set
> # BR2_KERNEL_HEADERS_SNAP is not set
> BR2_DEFAULT_KERNEL_HEADERS="2.6.31.6"
>
> And still you are trying to use headers from 2.6.27.10.

This is what I extracted from the email that came back from this list, I  
think you made a mistake somewhere:

# BR2_KERNEL_HEADERS_2_6_31 is not set
BR2_KERNEL_HEADERS_VERSION=y
# BR2_KERNEL_HEADERS_SNAP is not set
BR2_DEFAULT_KERNEL_VERSION="2.6.27.10"
BR2_DEFAULT_KERNEL_HEADERS="2.6.27.10"

> Are you sure you're using that exact config and just running make?

AFAIK .config should be the right config file,
sequence was as follows:

download and unpack
make xconfig
manually specify kernel version (matches the already patched kernel I had  
lying about)
exit config
make




> The getline problem is a known issue with old kernels and new
> distributions (fixed in 2.6.29+ and later versions of 2.6.27.x).

OK.

Some time back, I remember hearing that 2.6.27 was the branch that was to  
be maintained for XScale PXA. Is this correct, or are all XScale oddities  
handled in later kernel versions?





-- 
Joachim Pihl
Senior R&D Engineer
Nevion

Tel: +47 33 48 94 66
Fax: +47 33 48 99 98
Mobile: +47 91 33 98 91
jpihl at nevion.com
www.nevion.com

-----------------------------------
The Global Video Transport Leader
-----------------------------------
