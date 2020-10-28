From: Mauro Meneghin <mauro.meneghin@youview.com>
Date: Wed, 28 Oct 2020 17:15:55 +0000
Subject: [Buildroot] [PATCH 1/1] package/ltrace: bump ltrace to more
 recent git repo with latest commit
In-Reply-To: <20201026223513.096b2b69@windsurf.home>
References: <20201023134329.1810-1-mauro.meneghin@youview.com>,
 <20201026223513.096b2b69@windsurf.home>
Message-ID: <DBAPR05MB7144792C3D4B221929C60C789A170@DBAPR05MB7144.eurprd05.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thank you Thomas Petazzoni

________________________________
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Sent: 26 October 2020 21:35
To: Mauro Meneghin <mauro.meneghin@youview.com>
Cc: buildroot at buildroot.org <buildroot@buildroot.org>
Subject: Re: [Buildroot] [PATCH 1/1] package/ltrace: bump ltrace to more recent git repo with latest commit

[External email]


On Fri, 23 Oct 2020 14:43:29 +0100
Mauro Meneghin <mauro.meneghin@youview.com> wrote:

> I've updated LTRACE_SITE to point to https://github.com/dkogan/ltrace
> of Dima Kogan that includes some bug fixes, in particular the following
> commit to avoid a crash:
>   192e0a6 void struct members are now ignored
>
> The previous ltrace version gave me a crash on a ARMv7 device, showing
> this error:
>   "Assertion `field_info->type != ARGTYPE_VOID' failed."
>
> Using this commit ltrace shows a '<void>' return value in such cases,
> but at least avoids the crash.
>
> Signed-off-by: Mauro Meneghin <mauro.meneghin@youview.com>

Thanks for your patch. I have rewritten a bit the commit log to not use
first person sentences.

> -LTRACE_VERSION = c22d359433b333937ee3d803450dc41998115685
> -#LTRACE_SITE = git://anonscm.debian.org/collab-maint/ltrace.git
> +# This github version has some extra fixes on top of https://ltrace.org/
> +# in particular the following commit to avoid a crash:
> +#   192e0a6 void struct members are now ignored
> +LTRACE_VERSION = 82c66409c7a93ca6ad2e4563ef030dfb7e6df4d4
> +LTRACE_SITE = git://github.com/dkogan/ltrace.git

And changed that to use the "github" macro we have in Buildroot.

Applied with those changes. Thanks!

Thomas
--
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


[External email. Treat hyperlinks and attachments with caution]

This transmission contains information that may be confidential and contain personal views which are not necessarily those of YouView TV Ltd. YouView TV Ltd (Co No:7308805) is a limited liability company registered in England and Wales with its registered address at YouView TV Ltd, 3rd Floor, 10 Lower Thames Street, London, EC3R 6YT. For details see our web site at http://www.youview.com
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20201028/04736876/attachment.html>
