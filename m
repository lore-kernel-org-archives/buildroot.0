From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Mon, 19 Dec 2016 15:57:09 +0000
Subject: [Buildroot] [PATCH] jack2: Try better fix for NGREG problem
In-Reply-To: <20161217172237.5934f18f@free-electrons.com>
References: <1479739795-31046-1-git-send-email-abrodkin@synopsys.com>
 <20161217172237.5934f18f@free-electrons.com>
Message-ID: <1482162949.4285.23.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sat, 2016-12-17 at 17:22 +0100, Thomas Petazzoni wrote:
> Hello,
> 
> On Mon, 21 Nov 2016 17:49:55 +0300, Alexey Brodkin wrote:
> > 
> > After quite some time trying this and that we seem to have no
> > better solution than proposed by Thomas back in the day [1].
> > 
> > The solution in question is to check [during jack2 configuration]
> > if NGREG is exposed via ucontext.h and then use its value in
> > source code later on. This replaces long and still growing list
> > of architectures for which we explicitly escape usage of NGREG.
> > 
> > Just for reference [2] is my attempt to fix in in the other
> > supposedly better way but with no luck because of the mess in
> > kernel's UAPI headers.
> > 
> > [1] https://urldefense.proofpoint.com/v2/url?u=http-3A__lists.busybox.net_pipermail_buildroot_2016-2DMay_161785.html
> > &d=DgICAg&c=DPL6_X_6JkXFx7AXWqB0tg&r=lqdeeSSEes0GFDDl656eViXO7breS55ytWkhpk5R81I&m=lO-
> > pWm8TsFCI8LpRpFt8VMDAaoxteVHDKeXx2lKUc6M&s=nQ80Ho3tQdAjjk76kuGcuhh_PBE9EAEFNOpYeQIryrk&e=?
> > [2] https://urldefense.proofpoint.com/v2/url?u=http-3A__lists.busybox.net_pipermail_buildroot_2016-2DJune_162461.htm
> > l&d=DgICAg&c=DPL6_X_6JkXFx7AXWqB0tg&r=lqdeeSSEes0GFDDl656eViXO7breS55ytWkhpk5R81I&m=lO-
> > pWm8TsFCI8LpRpFt8VMDAaoxteVHDKeXx2lKUc6M&s=37fBEUzi8Cri1lFd5OsOcCvWM_MYPDctH0kR9fYlTRM&e=?
> > 
> > Still not sure if that works for every other architectures, so testing
> > and Acks from all interested parties are much appreciated.
> 
> I have submitted an improved version of this:

Thanks for doing that!
Let's see if Jack2 appears in Autobuilder failures again now.

-Alexey
