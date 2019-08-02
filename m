From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 2 Aug 2019 14:24:42 +0200
Subject: [Buildroot] [PATCHv2] package/mtd: needs zstd
In-Reply-To: <6a36d470-0597-0166-d0e0-0aea26783a45@free.fr>
References: <20190802081401.2545-1-yann.morin.1998@free.fr>
 <983ab9a0-941e-0ea5-cf64-4217eda63220@armadeus.com>
 <20190802083112.GA3083@scaer>
 <6a36d470-0597-0166-d0e0-0aea26783a45@free.fr>
Message-ID: <20190802122442.GA20164@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Julien, All,

On 2019-08-02 13:34 +0200, Julien Boibessot spake thusly:
> On 02/08/2019 10:31, Yann E. MORIN wrote:
>  On 2019-08-02 10:23 +0200, Julien Boibessot spake thusly:
>  But in configure, as yhou already quoted, we can see that zstd is
>  mandatory for ubifs:    AM_COND_IF([BUILD_UBIFS], [
>                  need_uuid="yes"                need_xattr="yes"
>                  need_zlib="yes"                need_lzo="yes"
>                  need_zstd="yes"                   <<<<<<<<
>                  need_openssl="yes"        ])
>  So, zstd is not a conditional dependency when ubifs is enabled. Or do I
>  still need to get more cofee? ;-)
> 
> well in configure it can also be disabled (like openssl):
> 
>   Optional Packages:
>   ? ...
>   ? --without-zstd????????? Disable support for ZSTD compression

Indeed, I've just tested, and it is really optiona. I've sent a v3.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
