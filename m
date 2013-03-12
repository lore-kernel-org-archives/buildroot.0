From: Julien Boibessot <julien.boibessot@free.fr>
Date: Tue, 12 Mar 2013 21:44:57 +0100
Subject: [Buildroot] [PATCH] [RFC] Add a LOADADDR= option when building
 uImage
In-Reply-To: <CAKduhStbK-9P4GhALmssGO07TdwX1r1rkfOtdUH6NqaYdHJcfg@mail.gmail.com>
References: <1362998134-4614-1-git-send-email-julien.boibessot@free.fr>
 <CAKduhStbK-9P4GhALmssGO07TdwX1r1rkfOtdUH6NqaYdHJcfg@mail.gmail.com>
Message-ID: <513F93C9.7090206@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Daniel,

On 03/12/2013 09:39 AM, Daniel Price wrote:
> Julien,
>
> I would appreciate this patch because I spent a lot of time
> discovering LOADADDR and this would have really helped me.  My
> suggestions:

thanks for your feedback !

> 1) Should this variable be exposed only for ARM for now?  ("depends on
> BR2_arm || BR2_armeb")

yes, I will do

> 2) Should this variable only be exposed for linux versions >= 3.7?
> 3.7 is when CONFIG_ARCH_MULTIPLATFORM appears.

yes, but I don't know how to do that.
any idea ?

> 3) The description in the help text might not help someone new to this
> topic (like me).  I would suggest something like:
>
> "If your ARM system's kernel is configured via the new (3.7+)
> multi-architecture support (CONFIG_ARCH_MULTIPLATFORM=y in your linux
> kernel .config), then it is necessary to specify a kernel load address
> for the uImage.  This should be a hexadecimal string beginning with
> 0x.  Example setting: 0x00008000."

yes that's better than mine.
I'm just trying to figure out how to depend from
CONFIG_ARCH_MULTIPLATFORM and then I will send a new version of my patch.

Thanks !

Regards,
Julien
