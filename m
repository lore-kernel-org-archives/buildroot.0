From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Wed, 16 May 2007 20:16:23 +0200
Subject: [Buildroot] _IO_getc inconsistent with uClibc?
In-Reply-To: <1179337889.9676.22.camel@localhost>
References: <1179337889.9676.22.camel@localhost>
Message-ID: <20070516181623.GA20902@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, May 16, 2007 at 07:51:29PM +0200, Mats Erik Andersson wrote:
>Hi there,
>
>in an effort to implement bluez-utils-2.15 for
>an embedded system using uClibc, I ran into
>unexpected problems, since my linker cannot
>resolve the the symbol _IO_getc. Using a similar
>configuration with Debian Sarge and building
>bluez-utils, does not pose any problems, and
>its linker kindly points to
>
>    _IO_getc@@GLIBC_2.0
>
>when the relevant object files have been linkt
>together. It was exactly at this stage that my
>Buildroot setting decided to cancel work for the day!
>
>Now, I did allow uClibc to use macros for getc
>and puts in the configuration, out of old habit.
>Is it these macros that cause the mess?

What version of uClibc are you using?
Does uClibc-0.9.29-fix-fget_putc.diff help?
