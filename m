From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 24 Aug 2020 18:38:01 +0200
Subject: [Buildroot] Problem adding a new package tpm2-tss-engine
In-Reply-To: <VI1PR03MB4528F54C1492D171A1B7B37B98560@VI1PR03MB4528.eurprd03.prod.outlook.com>
References: <VI1PR03MB45286A4A50F37EBB0DC2E56298560@VI1PR03MB4528.eurprd03.prod.outlook.com>
 <20200824160337.GB2246@scaer>
 <VI1PR03MB4528F54C1492D171A1B7B37B98560@VI1PR03MB4528.eurprd03.prod.outlook.com>
Message-ID: <20200824163801.GC2246@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Marie, All,

On 2020-08-24 16:21 +0000, Marie Maurer spake thusly:
> define TPM2_TSS_ENGINE_PRE_CONFIGURE_BOOTSTRAP
>         cd $(@D)/ && ./bootstrap
> endef
> TPM2_TSS_ENGINE_PRE_CONFIGURE_HOOKS += TPM2_TSS_ENGINE_PRE_CONFIGURE_BOOTSTRAP

In case I was not clear in my previous reply: do _not_ use the bootstrap
script, it is not needed.  So, drop your TPM2_TSS_ENGINE_PRE_CONFIGURE_BOOTSTRAP
macro altogether.

Setting _AUTORECONF = YES should be enough to trigger the
autoreconfiguring of the package.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
