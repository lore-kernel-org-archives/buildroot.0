From: Heiko Zuerker <heiko@zuerker.org>
Date: Thu, 09 Dec 2010 13:03:46 -0600
Subject: [Buildroot] iproute2 failing for x86_64 with ext. toolchain
In-Reply-To: <201012091946.12899.yann.morin.1998@anciens.enib.fr>
References: <20101207162124.20071ez7m458t3lw@www.home.zuerker.org>
	<4D0112E5.301@zacarias.com.ar>
	<20101209122657.12946lktv4rsa84k@www.home.zuerker.org>
	<201012091946.12899.yann.morin.1998@anciens.enib.fr>
Message-ID: <20101209130346.19245g12m9kufokk@www.home.zuerker.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Quoting "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>:

> Heiko, All,
>
> On Thursday 09 December 2010 19:26:57 Heiko Zuerker wrote:
>> It now blows up because it can't find xtables.h. Seems like the
>> external toolchain (ct-ng 1.9.0) didn't include that from the kernel.
>> I'll do some more testing on it.
>
> As an addendum to my previous mail: xtables.h does no exist. indeed, but
> x_tables.h does, and is correctly is installed in my toolchains, here.
>
> It should be included as though:
>   #include <linux/netfilter/x_tables.h>

I tried that and then it choked on some other stuff.

Since I messed around a lot, I recompiled the toolchain (had kernel  
2.6.32 and switched to .25) and did a buildroot "make clean" to make  
sure I have a clean compile.

-- 

Regards
   Heiko Zuerker
   http://www.devil-linux.org


----------------------------------------------------------------
This message was sent using IMP, the Internet Messaging Program.
