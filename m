From: Adrian Perez de Castro <aperez@igalia.com>
Date: Wed, 16 Aug 2017 16:41:07 +0300
Subject: [Buildroot] [PATCH 1/1] libepoxy: add patch to fix segfaults
 when using in X11 without GLX
In-Reply-To: <20170814213117.4735-1-aperez@igalia.com>
References: <20170814213117.4735-1-aperez@igalia.com>
Message-ID: <20170816164107.GB2311@momiji.helsinki.igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 15 Aug 2017 00:31:17 +0300, Adrian Perez de Castro <aperez@igalia.com> wrote:
> This adds a patch cherry-picked from libepoxy 1.4.2, which adds missing
> NULL-pointer checks and avoids segmentation faults when using libepoxy
> under X11, when the server does not have the GLX extension, or it is
> disabled -- and applications can still use EGL.
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
> ---

Is there any chance of getting this merged before the 2017.08 release? If
there is an area where there are ?interesting? GL setups which could hit the
segfaults fixed by the patch, that's in the embedded world ;-)

(I know people are busy and that the backlog of patches to be reviewed is not
precisely small, but I think it would be a pity that this would go missing in
the release.)

Cheers,


--
 Adri?n ?
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 195 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170816/48a9b0cd/attachment.asc>
