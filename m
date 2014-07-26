From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 26 Jul 2014 12:01:55 +0200
Subject: [Buildroot] [PATCH] gst-fsl-plugins: fix build for kernel
 headers >= 3.10
In-Reply-To: <20140726090257.0feb0d7f@free-electrons.com>
References: <1406352870-9607-1-git-send-email-bisson.gary@gmail.com>
 <20140726090257.0feb0d7f@free-electrons.com>
Message-ID: <20140726100155.GB3939@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-07-26 09:02 +0200, Thomas Petazzoni spake thusly:
> On Fri, 25 Jul 2014 22:34:30 -0700, Gary Bisson wrote:
> > This package couldn't build using a toolchain with kernel headers >=
> > 3.10 because of the use of VIDIOC_DBG_G_CHIP_IDENT. As stated in
> > videodev2.h, this ioctl should never be used.
> > 
> > Signed-off-by: Gary Bisson <bisson.gary@gmail.com>
> > ---
> > Yann, Thomas, all,
> > After looking at the source code it appears that nothing justifies the use of
> > that obsolete ioctl. Its only purpose is to get the video device name so this
> > patch actually removes those unnecessary calls.
> > Thanks,
> > Gary
> 
> So, if I'm correct, this supersedes the patches from Yann
> (http://patchwork.ozlabs.org/patch/373813/ and
> http://patchwork.ozlabs.org/patch/373814/), right ?

Well, 373813 is still valid: it is a clarification in the manual that
_AT_LEAST_X_Y symbols can be used to require either lowest or highest
headers version.

So, even if we end up noy needing this for this issue, it is still
valid, no?

But indeed, 373814 is supersedded by this patch from Gary (and I'm happy
of the outcome!) I'll mark the affected patches supserdded in Patchwork.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
