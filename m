From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 20 Apr 2018 07:31:52 +0300
Subject: [Buildroot] [PATCH 2/2] lz4: improve static only build support
In-Reply-To: <20180419225017.308d2d1e@windsurf.numericable.fr>
References: <d7eb4454e9b67f918eef87dddff7e93616748b36.1524131196.git.baruch@tkos.co.il>
 <0d4f47355e8ecd124338524f94947fd7cd3e3cb0.1524131196.git.baruch@tkos.co.il>
 <20180419225017.308d2d1e@windsurf.numericable.fr>
Message-ID: <20180420043152.tkqwo5tkj2kkbu55@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Thu, Apr 19, 2018 at 10:50:17PM +0200, Thomas Petazzoni wrote:
> On Thu, 19 Apr 2018 12:46:36 +0300, Baruch Siach wrote:
> > The current method of supporting static only build, removal of all lines
> > that match the SHARED regex from lib/Makefile, is crude and fragile.
> > Instead, patch lib/Makefile to allow disable of shared libraries.
> > 
> > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> 
> Thanks for cleaning this up, looks like a good idea. However...
> 
> > +LZ4_MAKE_OPTS = DESTDIR=$(STAGING_DIR) PREFIX=/usr
> 
> This looks weird. Why is DESTDIR needed at build time ? And how a
> DESTDIR=$(STAGING_DIR) in the INSTALL_TARGET_CMDS be the correct thing ?

It is not. Thanks for spotting. I'll fix and resend.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
