From: =?iso-8859-1?Q?Ga=EBl?= PORTAY <gael.portay@savoirfairelinux.com>
Date: Fri, 2 Mar 2018 06:49:01 -0500
Subject: [Buildroot] [PATCH 1/1] qt5webkit: fix build issue with 32-bits
 armv8-a
In-Reply-To: <20180302112652.GB8805@momiji>
References: <20180302105833.6828-1-gael.portay@savoirfairelinux.com>
 <20180302112652.GB8805@momiji>
Message-ID: <20180302114901.s7crdeo6tinrn6um@archlinux>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Adrian,

On Fri, Mar 02, 2018 at 11:26:52AM +0000, Adrian Perez de Castro wrote:
> > The patch is an adaptation of an upstream fix in version 5.212 of
> > qtwebkit[1].
> 
> I fixed this upstream a while ago:
> 
>   https://bugs.webkit.org/show_bug.cgi?id=174425
> 
> Note that you might need also the following patch for bmalloc:
> 
>   https://bugs.webkit.org/show_bug.cgi?id=174424
> 
> For WebKitGTK+ those patches were merged upstream since version 2.16.6; so
> I expect that newer versions of qt5webkit based on some upstream WebKit
> release from around July 2017 should be including the two patches linked
> above.
> 

It seems your modifications has not yet landed into qt5webkit (even in
5.212).

> That being said, I understand that your patch here targets versions of
> qt5webkit based on *older* WebKit revisions, right? That's fine of course
> and I think it would be desirable to check both for __ARM_ARCH_8__ and
> __ARM_ARCH_8A__ like upstream WebKit does:
> 
>    #if defined(__ARM_ARCH_8__) || defined(__ARM_ARCH_8A__)
>    // ...
> 

I will add this double check so the fix is closer that the upstream
version of WebKit.

> Of course if qt5webkit does NOT use bmalloc, then you do not need the
> corresponding fix for it ? sorry, I don't know what's the qt5webkit situation
> in this regard, I have not been following it much since the Qt port was
> removed from the upstream WebKit source tree.
> 

It looks like qt5webkit does not use bmalloc.

> 
> Reviewed-by: Adrian Perez de Castro <aperez@igalia.com>
> 
> Patch looks good to me, but please double-check the comments above, in
> particular the situation with bmalloc which might need a similar fix.
> 

Thanks for your review.
