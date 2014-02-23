From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 23 Feb 2014 12:51:02 +0100
Subject: [Buildroot] [PATCH] toolchain: control GNU_TARGET_NAME vendor
 part
In-Reply-To: <884EA965490E3C4D8E66AEF41E98025006C3BB@ezex10.ezchip.com>
References: <884EA965490E3C4D8E66AEF41E98025006BF23@ezex10.ezchip.com>
 <20140223104658.4088cdc6@skate>
 <884EA965490E3C4D8E66AEF41E98025006C3BB@ezex10.ezchip.com>
Message-ID: <20140223125102.025dd91a@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Noam Camus,

(Please do not top post. It would also be nice if you used a mail
client that wrapped lines at a reasonable length.)

On Sun, 23 Feb 2014 11:45:46 +0000, Noam Camus wrote:

> Here (EZchip) we change toolchain elements such binutils/gdb kernel (headers) and gcc.
> We are using override feature of buildroot to create our custom buildroot toolchain.
> One of the GCC changes we carry is that we assume dedicated vendor (ezchip) to control several GCC defaults and enable extra configurations within GCC.

Hum, ok. Is the vendor part of the tuple meant to be used this way?

> About "unknown" I guess that it can be blocked by checking the value and in some cases cause intentional make error.
> 
> I hope this makes sense to you.

Right. I guess we can make this configurable. However, your patch has
some issues:

 * It only creates the option BR2_TOOLCHAIN_BUILDROOT_VENDOR in the
   internal toolchain backend. But GNU_TARGET_NAME is also used with
   the external toolchain backend, which means in the external
   toolchain case we would end up with a GNU_TARGET_NAME having an
   empty vendor part of the tuple.

 * The new Config.in option lacks an help text, and the help text
   should explain in detail how this should be used, and in which
   situations. Also the title of the help text should be just
   "custom toolchain vendor name".

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
