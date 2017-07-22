From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 22 Jul 2017 23:49:46 +0200
Subject: [Buildroot] [PATCH 2/4 v3] package/kvm-unit-tests: introduce
 _ARCH_SUPPORTS
In-Reply-To: <20170722232826.68061aec@windsurf>
References: <cover.1499592591.git.yann.morin.1998@free.fr>
 <996d1d52c27da1a7725ed425ac895c3a7b5b7301.1499592591.git.yann.morin.1998@free.fr>
 <20170722232826.68061aec@windsurf>
Message-ID: <20170722214946.GF9929@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2017-07-22 23:28 +0200, Thomas Petazzoni spake thusly:
> On Sun,  9 Jul 2017 11:29:59 +0200, Yann E. MORIN wrote:
> > +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_5 if BR2_i386
> > +	depends on BR2_HOST_GCC_AT_LEAST_4_5 if BR2_x86_64
> 
> Did you actually test this? "make menuconfig" complains:
> 
> thomas at windsurf:~/projets/buildroot (master)$ make menuconfig
> package/kvm-unit-tests/Config.in:16: syntax error
> package/kvm-unit-tests/Config.in:15: invalid option
> package/kvm-unit-tests/Config.in:17: syntax error
> package/kvm-unit-tests/Config.in:16: invalid option
> Makefile:876: recipe for target 'menuconfig' failed

I am really surprised, because I am sure I did test it, yes. But
apparently, I did not.

I have no idea about what hapenned... :-/

> So I've replaced them with the more usual:
> 
> +       depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_5 || !BR2_i386
> +       depends on BR2_HOST_GCC_AT_LEAST_4_5 || !BR2_x86_64
> 
> I've also re-add the Config.in comment about the host gcc >= 4.5
> dependency.
> 
> Applied with those changes. Thanks!	

Thanks!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
