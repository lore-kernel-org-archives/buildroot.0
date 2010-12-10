From: Heiko Zuerker <heiko@zuerker.org>
Date: Fri, 10 Dec 2010 10:57:28 -0600
Subject: [Buildroot] [PATCH 2/2] iproute2: Fix auto configuration to
 work in cross environment.
In-Reply-To: <AANLkTikV2v-Vja9XeaYNDPYpQd6=XBS=fdGTPoc964hS@mail.gmail.com>
References: <1291988711-8162-1-git-send-email-serj.kalichev@gmail.com>
	<1291988711-8162-2-git-send-email-serj.kalichev@gmail.com>
	<AANLkTikV2v-Vja9XeaYNDPYpQd6=XBS=fdGTPoc964hS@mail.gmail.com>
Message-ID: <20101210105728.1410449ecz7jupic@www.home.zuerker.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Quoting Mike Frysinger <vapier@gentoo.org>:

> On Fri, Dec 10, 2010 at 8:45 AM, Serj Kalichev wrote:
>> The iproute2's configure script was fixed to work with cross
>> toolchain. Now it can use tools from cross toolchain but not
>> from the host. So it can automatically generate right Config
>> file. The checks for the IPv6 support and Berkeley DB
>> availability were added to the configure script. The
>> Berkeley DB support is needed to build (or not) arpd.
>
> this is way more work than necessary.  the iproute2 configure script
> does all of two things:
>  - detect atm support
>  - detect iptables version
>
> instead of trying to clean up the bundled configure script which is a
> pile of crap, simply have the iproute2.mk file do:
> echo TC_CONFIG_ATM:=y > Config
> echo TC_CONFIG_XT:=$(BR2_IPTABLES) >> Config
>
> after all, we already know that the version of iptables in BR is the
> latest and so dont need any of the hacky iptables detection.

I included this already in a patch I'll submit later today.
I moved the atm and xtables into configurable options.

> here is a simple patch i wrote for Gentoo that allows you to disable
> iptables support completely:
> http://sources.gentoo.org/sys-apps/iproute2/files/iproute2-2.6.35-no-iptables.patch


-- 

Regards
   Heiko Zuerker
   http://www.devil-linux.org


----------------------------------------------------------------
This message was sent using IMP, the Internet Messaging Program.
