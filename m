From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 26 Feb 2018 23:06:02 +0100
Subject: [Buildroot] [git commit branch/next] linux: allow both in-tree
 and custom dts files
In-Reply-To: <87606ktbl1.fsf@dell.be.48ers.dk>
References: <20180225171345.A60E48809E@busybox.osuosl.org>
 <20180225190328.GD2276@scaer> <87606ktbl1.fsf@dell.be.48ers.dk>
Message-ID: <20180226220602.GA2678@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2018-02-26 09:11 +0100, Peter Korsgaard spake thusly:
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
> 
>  > Simon, All,
>  > On 2018-02-25 17:19 +0100, Arnout Vandecappelle spake thusly:
>  >> commit: https://git.buildroot.net/buildroot/commit/?id=382fe9f9261812682eab2d35e47aa94dc554380e
>  >> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next
>  >> 
>  >> For some boards, for example the Raspberry Pi, it's necessary to build
>  >> in-tree dts files as well as custom/out of tree dts-files (dt-blob.bin).
>  >> The existing logic made these two options exclusive, this commit changes
>  >> that to allow both in-tree as well as custom sources for dts files.
> 
>  > This breaks all our cufrrent defconfig files that build a DTB, like
>  > for example configs/stm32f429_disco_defconfig, because the default
>  > that was implied by a choice is no longer true, so we need to add
>  > BR2_LINUX_KERNEL_USE_INTREE_DTS=y to those defconfig files.
> 
> That still doesn't fix it for any external defconfig. Adding a 'default
> y' to BR2_LINUX_KERNEL_USE_INTREE_DTS will likewise break it for users
> of BR2_LINUX_KERNEL_USE_CUSTOM_DTS. Perhaps we can change the logic to
> look for nonempty BR2_LINUX_KERNEL_INTREE_DTS_NAME /
> BR2_LINUX_KERNEL_CUSTOM_DTS_PATH variables?

As the patch that I sent does, maybe?
    https://patchwork.ozlabs.org/patch/878006/

Cordialement,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
