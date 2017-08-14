From: Adrian Perez de Castro <aperez@igalia.com>
Date: Mon, 14 Aug 2017 23:06:53 +0300
Subject: [Buildroot] [PATCH 1/1] libepoxy: bump to version 1.4.3
In-Reply-To: <20170814213113.6187b327@windsurf>
References: <20170814172320.16984-1-aperez@igalia.com>
 <20170814213113.6187b327@windsurf>
Message-ID: <20170814230653.GB14043@momiji>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Mon, 14 Aug 2017 21:31:13 +0200, Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

> On Mon, 14 Aug 2017 20:23:20 +0300, Adrian Perez de Castro wrote:
> > Among other small fixes, the new version fixes crashes when running in
> > X11 without GLX (i.e. using EGL). Additionally, the changes from patch
> > "0002-Make-EGL-support-optional.patch" were committed upstream, and the
> > file can be dropped.
> > 
> > Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
> 
> Since we're post -rc2 comes the question: do we want to apply this in
> master (i.e to be part of the 2017.08 release) or in next.
>
> If it fixes a crash, we probably want it in master. But version bumps
> are a bit frowned upon. How much differences are there between 1.4.1
> and 1.4.3 ? Are they significant ? If they are significant, is it
> possible to backport just the one patch that fixes the crash ?

Good point. I would apply the patch as-is onto ?next?, and for the 2017.08
branch it looks doable to pick just the patch that fixes the segfaults [1].
I'll try and submit a patch which does just the latter.

Cheers,

---
[1] https://github.com/anholt/libepoxy/pull/118/commits/106eae7aad23dffcefe11ec3bf86e54e35137689
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 195 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170814/af68b389/attachment.asc>
