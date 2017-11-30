From: =?iso-8859-1?Q?Ga=EBl?= PORTAY <gael.portay@savoirfairelinux.com>
Date: Thu, 30 Nov 2017 14:57:02 -0500
Subject: [Buildroot] [PATCH 1/1] netcat-openbsd: depends on
 linux-headers >= 3.12
In-Reply-To: <20171130203625.28575e36@windsurf.lan>
References: <20171128154437.1631-1-gael.portay@savoirfairelinux.com>
 <20171129222435.557776c3@windsurf.home>
 <20171130171049.v2sidfmz3ybnpnwo@tarshish>
 <20171130203625.28575e36@windsurf.lan>
Message-ID: <20171130195702.va3cwfbz5zhe2scp@archlinux>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Thu, Nov 30, 2017 at 08:36:25PM +0100, Thomas Petazzoni wrote:
> Hello,
> 
> On Thu, 30 Nov 2017 19:10:49 +0200, Baruch Siach wrote:
> 
> > On Wed, Nov 29, 2017 at 10:24:35PM +0100, Thomas Petazzoni wrote:
> > > Since you have looked at a lot of different kernel headers related
> > > issues, what do you think about this one below?  
> > 
> > Makes sense. We have faced the same issue with musl and iproute2. In each of 
> > these cases we used different solutions because both provide their own 
> > headers. For the simple case, it is reaonable to limit build to toolchains 
> > with newer kernel headers providing libc-compat.h.
> > 
> > Reviewed-by: Baruch Siach <baruch@tkos.co.il>
> 
> Well, what bothers me is that netcat is a fairly simple tool, so I find
> it odd that we restrict it to >= 3.12.
>

If you prefer, I can update debian patch to not include the kernel UAPI
header.

It will compile, but this version of netcat will be "amputated" from
ipv6 feature.

Gael
