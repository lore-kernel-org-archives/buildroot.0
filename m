From: Guido =?iso-8859-1?Q?Mart=EDnez?= <guido@vanguardiasur.com.ar>
Date: Wed, 15 Jul 2015 14:19:40 -0300
Subject: [Buildroot] [PATCH v5 1/3] busybox: disable nslookup applet
In-Reply-To: <20150714185514.37730552@free-electrons.com>
References: <1436886664-3206-1-git-send-email-guido@vanguardiasur.com.ar>
 <1436890174-23236-1-git-send-email-guido@vanguardiasur.com.ar>
 <20150714183126.3a0ed496@free-electrons.com>
 <20150714185514.37730552@free-electrons.com>
Message-ID: <20150715171940.GA23491@fox>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Tue, Jul 14, 2015 at 06:55:14PM +0200, Thomas Petazzoni wrote:
> [...]
>
> I did a comparison between the uClibc_config.h of the OSELAS Cortex-M3
> toolchain and the uClibc_config.h of a uClibc toolchain built by
> Buildroot, and there are quite a few differences in the configuration.
> 
> First and foremost, OSELAS is using uClibc 0.9.33.2 with almost no
> patches. And in Buildroot, we had to add a lot of patches to uClibc to
> make it properly support a number of packages (which is also why we've
> switched to uClibc-ng as the default C library).
> 
> And then, the uClibc configuration itself is quite different: a number
> of features that we enable by default in the Buildroot uClibc
> configuration are not enabled in the OSELAS Cortex-M3 uClibc. So when
> we will start adding the OSELAS Cortex-M3 toolchain in the
> autobuilders, it will probably start showing a number of failures
> caused by this uClibc version/configuration being quite different from
> the usual Buildroot expectations.
> 
> So, we've got two possibilities here:
> 
>  1/ Just give up on the OSELAS toolchain, and focus on making Buildroot
>     capable of building a Cortex-M3 toolchain.
> 
>  2/ Really add the toolchain anyway, but be prepared for some
>     additional work to handle all those issues. Since the Cortex-M3 is
>     noMMU, it means that a significant fraction of the packages are not
>     available, so maybe it will be more reasonable that I expect. But I
>     was in fact hoping to be able to add other OSELAS toolchains, even
>     for MMU capable platforms. But if they have such uClibc
>     configurations, we might be limited to using their glibc toolchains.
> 
> What do you think?

I have no problem with option 1. In fact, I was going to try to do it
anyway even if the OSELAS toolchain got accepted. I'll start looking
into it in detail and report back. I haven't done anything similar in
the past so it might take me a while.

Thanks to all who reviewed the patches!

-- 
Guido Mart?nez, VanguardiaSur
www.vanguardiasur.com.ar
