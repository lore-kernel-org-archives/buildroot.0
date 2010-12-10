From: Mike Frysinger <vapier@gentoo.org>
Date: Fri, 10 Dec 2010 13:30:53 -0500
Subject: [Buildroot] [PATCH 2/2] iproute2: Fix auto configuration to
 work in cross environment.
In-Reply-To: <AANLkTimGFdUmur3EkfSbpamCotp9L5iSUWQVNPqN4hx+@mail.gmail.com>
References: <1291988711-8162-1-git-send-email-serj.kalichev@gmail.com>
	<1291988711-8162-2-git-send-email-serj.kalichev@gmail.com>
	<AANLkTikV2v-Vja9XeaYNDPYpQd6=XBS=fdGTPoc964hS@mail.gmail.com>
	<AANLkTinACyTB=SF_Ji4Fk8Z1X2n38T9B3HCDmJ1BRmBt@mail.gmail.com>
	<AANLkTim+gc8LaxdmFBNcqBq5HC3LmquLcrVQLu_D1Ng3@mail.gmail.com>
	<AANLkTimGFdUmur3EkfSbpamCotp9L5iSUWQVNPqN4hx+@mail.gmail.com>
Message-ID: <AANLkTi=EB44yGcBcLYt7_D-Pfq4hR-=hERh+qBG5i9Sm@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Dec 10, 2010 at 1:29 PM, Pkun wrote:
> 2010/12/10 Mike Frysinger:
>> On Fri, Dec 10, 2010 at 12:46 PM, Pkun wrote:
>>> 2010/12/10 Mike Frysinger
>>>> On Fri, Dec 10, 2010 at 8:45 AM, Serj Kalichev wrote:
>>>> > The iproute2's configure script was fixed to work with cross
>>>> > toolchain. Now it can use tools from cross toolchain but not
>>>> > from the host. So it can automatically generate right Config
>>>> > file. The checks for the IPv6 support and Berkeley DB
>>>> > availability were added to the configure script. The
>>>> > Berkeley DB support is needed to build (or not) arpd.
>>>>
>>>> this is way more work than necessary. ?the iproute2 configure script
>>>> does all of two things:
>>>> ?- detect atm support
>>>> ?- detect iptables version
>>>>
>>>> instead of trying to clean up the bundled configure script which is a
>>>> pile of crap, simply have the iproute2.mk file do:
>>>> echo TC_CONFIG_ATM:=y > Config
>>>> echo TC_CONFIG_XT:=$(BR2_IPTABLES) >> Config
>>>>
>>>> after all, we already know that the version of iptables in BR is the
>>>> latest and so dont need any of the hacky iptables detection.
>>>>
>>>> here is a simple patch i wrote for Gentoo that allows you to disable
>>>> iptables support completely:
>>>>
>>>> http://sources.gentoo.org/sys-apps/iproute2/files/iproute2-2.6.35-no-iptables.patch
>>>
>>> To write ad-hoc iproute2.mk is not general way. Especially the replacing -o2
>>> with the CFLAGS by the sed. You don't need iptables integration but I do. I
>>> don't need IPv6. I don't need ATM but it was switch on in my system by
>>> ./configure that use host dirs instead staging. You suggest to hardcode
>>> settings. It's not good.
>>
>> all of this is irrelevant to what i highlighted. ?my point is to not
>> run configure and i showed you how to do it cleanly instead. ?nothing
>> in my proposal limits dynamic selection of features.
>
> I this case people must do it by hands with patching iproute2.mk

no, it really doesnt.  i gave an *example*.  nowhere did i say "you
must use the example exactly as i posted".
-mike
