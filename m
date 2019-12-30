From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 30 Dec 2019 13:48:32 +0100
Subject: [Buildroot] [PATCH 0/3] Improve libopenssl target arch selection
In-Reply-To: <20191027102420.15560-1-thomas.petazzoni@bootlin.com>
References: <20191027102420.15560-1-thomas.petazzoni@bootlin.com>
Message-ID: <20191230124832.GN26395@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2019-10-27 11:24 +0100, Thomas Petazzoni spake thusly:
> Hello,
> 
> Reviewing commit 027c02660b8cd670eff0ba6fdd9e49253968517f
> ("package/libopenssl: set no-asm with generic architectures") from
> Fabrice made me realize that the OpenSSL target architecture selection
> logic was not very easy to read, and was missing a number of useful
> cases.
> 
> So here is a small patch series that moves the target architecture
> selection logic to Config.in, and then makes use of linux-generic64
> and linux-x86 when appropriate.
> 
> Thomas
> 
> Thomas Petazzoni (3):
>   package/libopenssl: move target arch selection to Config.in
>   package/libopenssl: make use of linux-generic64 for 64-bit archs
>   package/libopenssl: make use of linux-x86 for i386

I've applied all athree to master, thanks.

I'll reply further on patch 1, for some specific comments.

Regards,
Yann E. MORIN.

>  package/libopenssl/Config.in     | 31 ++++++++++++++++++++++++++++
>  package/libopenssl/libopenssl.mk | 35 +-------------------------------
>  package/openssl/Config.in        |  2 ++
>  3 files changed, 34 insertions(+), 34 deletions(-)
>  create mode 100644 package/libopenssl/Config.in
> 
> -- 
> 2.21.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
