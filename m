From: Will Newton <will.newton@gmail.com>
Date: Fri, 2 Oct 2009 10:00:55 +0100
Subject: [Buildroot] [***SPAM*** Score: 3.3] problem with locale
In-Reply-To: <4AC4D0C8.5000109@carallon.com>
References: <4AC4D0C8.5000109@carallon.com>
Message-ID: <87a5b0800910020200p3972c259yd46812807d7749f6@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Oct 1, 2009 at 4:54 PM, William Wagner <will_wagner@carallon.com> wrote:
> Hello all,
>
> Just started moving to latest buildroot dev tree. I have hit an error using
> the attached config, it is a pretty plain x86 config but with locale
> support.
>
> It fails to build uClibc with this error:
> ? LN include/sys/vm86.h
> ? HOSTCC extra/locale/gen_wc8bit
> extra/locale/gen_wc8bit.c: In function 'main':
> extra/locale/gen_wc8bit.c:356: warning: array subscript is above array
> bounds
> extra/locale/gen_wc8bit.c:415: warning: array subscript is above array
> bounds
> extra/locale/gen_wc8bit.c:481: warning: array subscript is above array
> bounds
> ? GEN extra/locale/codesets.txt
> ? GEN extra/locale/c8tables.h
> setlocale(LC_CTYPE,"en_US.UTF-8") failed!
> make[1]: *** [extra/locale/c8tables.h] Error 1
> make[1]: Leaving directory
> `/home/willw/buildroot/output/toolchain/uClibc-0.9.30.1'
> make: ***
> [/home/willw/buildroot/output/toolchain/uClibc-0.9.30.1/.configured]
> Error 2

This looks like your host system does not support the en_US.UTF-8
locale, although that would seem unlikely. Is it listed by locale -a?
