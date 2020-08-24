From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 24 Aug 2020 18:03:37 +0200
Subject: [Buildroot] Problem adding a new package tpm2-tss-engine
In-Reply-To: <VI1PR03MB45286A4A50F37EBB0DC2E56298560@VI1PR03MB4528.eurprd03.prod.outlook.com>
References: <VI1PR03MB45286A4A50F37EBB0DC2E56298560@VI1PR03MB4528.eurprd03.prod.outlook.com>
Message-ID: <20200824160337.GB2246@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Marie, All,

On 2020-08-24 14:06 +0000, Marie Maurer spake thusly:
> Hello,
[--SNIP--]
> TPM2_TSS_AUTORECONF = YES

Typo in the name of that variable; it should be TPM2_TSS_ENGINE_AUTORECONF.

Run 'make check-package' which should hint at such typoes.

> define TPM2_TSS_ENGINE_PRE_CONFIGURE_BOOTSTRAP
>     cd $(@D)/ && ./bootstrap
> endef
> TPM2_TSS_ENGINE_PRE_CONFIGURE_HOOKS += TPM2_TSS_ENGINE_PRE_CONFIGURE_BOOTSTRAP

No need for this hook, since you have _AUTORECONF, above.

Also, such hooks are usually bad, because such bootstrap scripts usually
do not have the proper variables and options that are needed to properly
autoreconf in the Buildroot context.

So I guess your issue stems from the typo in the _AUTORECONF variable.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
