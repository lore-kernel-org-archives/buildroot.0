From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Dec 2013 09:50:20 +0100
Subject: [Buildroot] [PATCH] gst-plugins-good: fix typo
 BR2_TOOLCHAIN_HAS_THREAD
In-Reply-To: <8ff8a1a8a7d5dfae8a57.1387486943@argentina>
References: <8ff8a1a8a7d5dfae8a57.1387486943@argentina>
Message-ID: <20131220095020.565215ee@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Yann,

On Thu, 19 Dec 2013 22:02:23 +0100, Thomas De Schampheleire wrote:

>  comment "souphttpsrc needs a toolchain w/ wchar, threads"
> -	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREAD
> +	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS

Do you know if there is a way of making kconfig complain loudly if
there is a reference to an undefined symbol?

I know of only one occurrence in Buildroot where we rely on a
non-existing symbol: BR2_BROKEN. But we could just as well define this
symbol to be always false.

Having such a check would help ensuring we don't make typos on symbol
names.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
