From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 10 Aug 2017 11:26:31 +0200
Subject: [Buildroot] [PATCH] glibc: fix sh4 compile error
In-Reply-To: <20170804170742.GA10573@waldemar-brodkorb.de>
References: <20170804170742.GA10573@waldemar-brodkorb.de>
Message-ID: <ca02a9da-c4bd-aa8b-adc9-34fa677d1bbc@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 04-08-17 19:07, Waldemar Brodkorb wrote:
> Fixes:
> 
> /tmp/output/build/glibc-2.25/build/libc_pic.a(dl-error.os): In function `__GI__dl_signal_error':
> dl-error.c:(.text+0x0): multiple definition of `_dl_signal_error'
> /tmp/output/build/glibc-2.25/build/elf/dl-allobjs.os:(.text+0x134d8): first defined here
> /tmp/output/build/glibc-2.25/build/libc_pic.a(dl-error.os): In function `__GI__dl_catch_error':
> dl-error.c:(.text+0x190): multiple definition of `_dl_catch_error'
> /tmp/output/build/glibc-2.25/build/elf/dl-allobjs.os:(.text+0x136fc): first defined here
> /tmp/output/build/glibc-2.25/build/libc_pic.a(init-first.os):(.data+0x0): multiple definition of `__libc_multiple_libcs'
> /tmp/output/build/glibc-2.25/build/elf/dl-allobjs.os:(.bss+0x6c): first defined here
> /tmp/output/build/glibc-2.25/build/libc_pic.a(_itoa.os): In function `_itoa':
> _itoa.c:(.text+0xd4): multiple definition of `_itoa'
> /tmp/output/build/glibc-2.25/build/elf/dl-allobjs.os:(.text+0x133c8): first defined here
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

 Applied to master, thanks.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
