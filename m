From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 2 Jul 2015 23:46:22 +0200
Subject: [Buildroot] [PATCH 1/1] package/libdrm: fix building if GCC's C
 standard is not gnu99
In-Reply-To: <20150702231241.69ef0bea@gmx.net>
References: <1435860302-16176-1-git-send-email-bernd.kuhls@t-online.de>
 <20150702231241.69ef0bea@gmx.net>
Message-ID: <5595B12E.1070705@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/02/15 23:12, Peter Seiderer wrote:
[snip]
> From build/libv4l-1.6.2/config.log:
> 
> configure:4709: checking for .../host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc option to accept ISO C99
> configure:4858: .../host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc -std=gnu99 -c -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64   -Os  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 conftest.c >&5
> conftest.c:54:9: error: unknown type name 'wchar_t'
>    const wchar_t *name;
> 
> 
> The C99 detection problem seems more related to missing wchar_t type support than the compiler option?

 Good catch!

[Adding Waldemar for uClibc input]

 The configure script does include wchar.h, but it seems that wchar_t doesn't
get defined after all... Waldemar, any idea?


 Regards,
 Arnout

[snip]


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
