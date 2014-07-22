From: =?UTF-8?B?SsO2cmcgS3JhdXNl?= <jkrause@posteo.de>
Date: Tue, 22 Jul 2014 20:11:25 +0200
Subject: [Buildroot] [RFC 1/3] Rename package mpc to libmpc
In-Reply-To: <20140722170246.GA3667@free.fr>
References: <1405951937-21226-1-git-send-email-jkrause@posteo.de>
 <1405951937-21226-2-git-send-email-jkrause@posteo.de>
 <20140721162558.749a1393@free-electrons.com>
 <53CD400B.1070106@zacarias.com.ar>
 <20140721201921.35334933@free-electrons.com> <53CE1F97.1020300@posteo.de>
 <53CE3AF3.50606@zacarias.com.ar> <20140722170246.GA3667@free.fr>
Message-ID: <53CEA94D.9050403@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Dear all,

On 07/22/2014 07:02 PM, Yann E. MORIN wrote:
> Gustavo, J?rg, All,
>
> On 2014-07-22 07:20 -0300, Gustavo Zacarias spake thusly:
>> On 07/22/2014 05:23 AM, J?rg Krause wrote:
>>> okay, I understand that renaming is potentially problematic. But the
>>> package mpc is not a dependency for any package. gmp is a dependency for
>>> eight packages, and mpfr for one.
>>>
>>> Looking at Debian, Arch, and Fedora, these packages are all named
>>> libmpc, libgmp, and libmpfr. I liked the idea of having consistent
>>> package names. And if I am searching for mpc in the menuconfig I find
>>> the multiprecision library as libmpc and the mpd client as mpc. So it's
>>> not to difficult to find the right package.
>> Well in gentoo mpfr is mpfr and so no, not prepended by lib since there
>> are categories which allows for duplicate naming.
>> The problem is if someone uses mpc in their custom packages, there's no
>> easy way of warning about the rename.
> Not only that, but users re-using a .config from a previous Buildroot
> version would also be a problem.
>
> We can not have a legacy symbol for mpc as our previous "libmpc" and a
> new symbol for mpc as the new package "mpd client", since that would be
> the same symbol.
>
> So, I agree with Thomas here: we should not rename the current mpc, and
> find an alternate name for the new mpc.

Okay, you all convinced me :-) We leave it as it is.

>
>>> There are dozen of clients for mpd. At least calling the package
>>> "mpclient" will show my the package when searching for "mpc" in the
>>> menuconfig.
>> Yes that was the idea, mpclient doesn't sound right, but search works,
>> we could as well use mpcclient for example.
> Or mpd-mpc.

This was my idea, too. I think I will choose this name.

>
>>> Btw, is there any rule for duplicate names?
>> There's no rule for duplicates, best effort comes to mind.
> Untold policy is: first come, first served. ;-)

Damn, so I am much to late ;-)

Thanky you all for the discussion! So I think we can close this topic now.

Best regards
J?rg
