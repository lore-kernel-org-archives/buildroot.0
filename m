From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 25 Jul 2014 19:26:21 +0200
Subject: [Buildroot] [PATCH] libfslvpuwrap: fix tests of return value
 from IOGetVirtMem
In-Reply-To: <53D28D83.3020608@boundarydevices.com>
References: <1406270593-17193-1-git-send-email-bisson.gary@gmail.com>
 <20140725165550.GB3955@free.fr>
 <53D28D83.3020608@boundarydevices.com>
Message-ID: <20140725172621.GC3955@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Eric, All,

On 2014-07-25 10:01 -0700, Eric Nelson spake thusly:
> On 07/25/2014 09:55 AM, Yann E. MORIN wrote:
[--SNIP--]
> >> --- /dev/null
> >> +++ b/package/libfslvpuwrap/libfslvpuwrap-0001-vpu_wrapper-fix-tests-of-return-value-from-IOGetVirt.patch
> >> @@ -0,0 +1,41 @@
> >> +From 7ca66c10c05168c7d342df7c7a70d4a1ae0629f7 Mon Sep 17 00:00:00 2001
> >> +From: Eric Nelson <eric.nelson@boundarydevices.com>
> >> +Date: Sat, 28 Jun 2014 09:45:09 -0700
> >> +Subject: [PATCH] vpu_wrapper: fix tests of return value from IOGetVirtMem
> >> +
> >> +IOGetVirtMem() returns a pointer or specifically -1 (MAP_FAILED)
> >> +in the case of failure.
> >> +
> >> +Upstream-Status: Pending
> > 
> > Is there a public URL to the bug report or the patch submission?
> > If so, can you paste the URL here, so we know when we update that we
> > need to remove that patch?
> >
> 
> Since Freescale is now basing their releases on Yocto, the
> meta-freescale list is the best equivalent of "upstream"
> for these Freescale components.
> 
> Unfortunately, patches there are in a different form, and
> I pushed the equivalent forms and they were acked and
> promises made by Freescale (Lauren) to include in the next
> release:
> 
> 	https://lists.yoctoproject.org/pipermail/meta-freescale/2014-June/thread.html#8881

Great! We can add this to the patch description:
    https://lists.yoctoproject.org/pipermail/meta-freescale/2014-June/008993.html

where Freescale said "The patch is good.  Team said they'll push it into
our upcoming beta release."

I guess this is easy enough that it does not warrant a resend of the
patch, so the two URLs above can be added by whoever commits that to the
tree.

Thanks! ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
