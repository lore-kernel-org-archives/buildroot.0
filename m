From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Fri, 9 Feb 2007 21:11:19 +0100
Subject: [Buildroot] [PATCH] at45-split (2/3)1
In-Reply-To: <00a001c74c80$b6b664c0$01c4af0a@Glamdring>
References: <Zbq64Q2XcDDN.vTjBx34D@mailout.dof.se>
	<20070209165804.GR12488@aon.at>
	<00a001c74c80$b6b664c0$01c4af0a@Glamdring>
Message-ID: <20070209201119.GX12488@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Feb 09, 2007 at 08:29:54PM +0100, Ulf Samuelsson wrote:
>
>>>
>>>Thanks and sorry for the delay.
>>>
>>>PS: I'm aware of your Board support builddir patch, that i didn't look
>>>at yet, are there any other pending patches i managed to miss?
>>>
>
>There is actually one more.
>The "local" patch.
>
>Eric NAK'ed this patch, due to "duplication" with "package/customize"
>so I reworked the patch by removing "package/customize"
>and putting the functionality into the "local" directory.
>
>For maintenance reasons, I find it important that this stuff is in at the 
>top level.
>The "local" directory is a place holder for the users
>packages/ which he/she never plans to submit to
>the mainstream, and it is just a pain to have it

and that's unfortunately the reason why i, personally, dislike it.

Why would you want me or anybody else that contributes to publically
visible areas to maintain your base if those people who devote their
rare spare-time to support a proper working base to be closed out from
improvements? This project is about collaboration and doesn't aim at
providing a convenience gate between closed areas like drivers
/ specs and the rest of e.g. the kernel-API but for userspace which is --
in the area of this project GPL, AFAICS.

I'm not too keen on playing the maintenance clerk anybody shouts at if
one drops an old version, but that local patch aims at exactly this area
of non-fun, at least in MHO.

Guess i just fail to see the benefit that'd impose, generally.

How does the "local patch" help e.g. me (to achieve what) ? 

>inside the package directory.
>
>Once the patch is there, you can download the latest version
>and then copy your own local directory into the buildroot tree.
>This will replace the contencts of the "local" directory
>and you do not have to patch toplevel Makefile or Config.in.
>(A symbolic link from "local" to an out of tree directory will also do)
>
>If you read the comments from everyone but Eric,
>I think you find that everyone else is positive to the patch.
>I have had several off-line mails from people that support the idea.

I can imagine that, yes ;)
>
>The patch will also update the /etc/hostname
>from the BR2_BOARDNAME in the BSP patch.
>(Maybe it shodul change name to BR2_HOSTNAME?)

A BR2_HOSTNAME that defaults to the board short of a user-configured
name sounds fine to me.
>and allow the developer to provide his/her own welcome banner.

Sure.
