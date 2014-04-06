From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 6 Apr 2014 12:46:19 +0300
Subject: [Buildroot] [PATCH 0/2] use host compressor for rootfs
In-Reply-To: <20140406113248.5d7216a6@skate>
References: <1396770501-9443-1-git-send-email-tremyfr@yahoo.fr>
 <20140406075912.GC4096@tarshish>
 <1396776324.27939.YahooMailNeo@web28803.mail.ir2.yahoo.com>
 <20140406113248.5d7216a6@skate>
Message-ID: <20140406094619.GE4096@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, Thomas,

On Sun, Apr 06, 2014 at 11:32:48AM +0200, Thomas Petazzoni wrote:
> On Sun, 6 Apr 2014 10:25:24 +0100 (BST), Philippe Reynes wrote:
> 
> > I've missed this "mandatory dependancy".
> > I suppose that this dependancy is usefull to uncompress tarball.
> > But I think that the compilation of firmware should be done with
> > tools compiled by buildroot.
> > 
> > If lzma is used to compress the rootfs, then lzma is compile
> > by builtoot. If gzip is used to compress the rootfs, then we use
> > local gzip. It's not very "coherent".
> > And using compiled binary with buildroot increase chance to
> > regenerate firmware on (very) different machine.
> > 
> > And I agree with you, it's not a "real" issue, it's more a "nice to have".
> 
> Well, I guess there are two important things here:
> 
>  1) Buildroot tries to avoid building native utilities needlessly. So
>     when possible, we try to use the tools available on the machine, in
>     order to keep the overall build time as reasonable as possible.
> 
>  2) gzip and bzip2 are widely available tools, which haven't caused any
>     compatibility issue in years. On the other hands, tools like lzma,
>     xz and so on are a lot less widely available. They may not even be
>     available at all on old Linux distributions that some companies are
>     still using.
> 
> Both of these points combined explain why we handle gzip/bzip2
> differently than lzma/xz.

Since commit d1f325f554cab (xzcat: treat as host prerequisite and build if 
needed) xz is always built when the host does not have it. Can we remove 
host-xz from the dependencies of HOST_SQUASHFS and ROOTFS_*_XZ?

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
