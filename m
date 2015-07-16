From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 16 Jul 2015 18:17:21 -0300
Subject: [Buildroot] [PATCH] package: Fix overwrite inittab w/ default
 skeleton
In-Reply-To: <20150716230722.304e5f9a@free-electrons.com>
References: <1437064235-32432-1-git-send-email-maxime.hadjinlian@gmail.com>
 <20150716230722.304e5f9a@free-electrons.com>
Message-ID: <55A81F61.3050307@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 16/07/15 18:07, Thomas Petazzoni wrote:

> Unfortunately, even if Gustavo gave his Acked-by, I'm tempted to not
> apply this patch. There are *tons* of other stuff that we don't install
> conditionally. For example, we used to install init scripts only if an
> init script was not already installed to allow a custom skeleton to
> provide such init scripts. But a while ago, we decided to get rid of
> this policy, and install init scripts and configuration files
> unconditionally. Just a few commits related to that:

Actually i reported the bug to Maxime, he just forgot to add the 
Reported-By.
The problem with this is that it's a change in behaviour, this didn't 
happen in the previous releases.

> Our reasoning is that using a custom skeleton is highly discouraged,
> and people should instead use a rootfs overlay or a post-build script
> for their customization.
>
> I don't see why inittab should be handled differently.
>
> I'll mark your patch as Rejected for the time being. If there is some
> more arguments on why we should have a special handling of inittab,
> then we can rediscuss the patch of course.

My usage scenario is customized initscripts that rely on a very minimal 
inittab (rcS, rcK and getty, nothing more).
All of the basic startup is handled in initscripts, which i think we 
should do for BR as well - there's no reason to stick a lot of stuff in 
inittab IMO.
But even if we do that i'm still concerned about the behaviour change 
that can lead to non-working systems when upgrading buildroot.
Another option is to just get rid of the custom skeleton altogether, if 
it's being stepped on right and left what's the purpose?
Regards.
