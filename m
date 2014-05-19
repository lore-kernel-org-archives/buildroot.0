From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 19 May 2014 22:15:49 +0200
Subject: [Buildroot] [PATCH 1/1] fio: fix missing fallocate64()
In-Reply-To: <537A5CD4.70500@frajasalo.de>
References: <1399668168-4521-1-git-send-email-frank@frajasalo.de>
 <20140512214442.014f1eb5@free-electrons.com>
 <537A5CD4.70500@frajasalo.de>
Message-ID: <20140519221549.09b43dbf@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Frank Bergmann,

On Mon, 19 May 2014 21:34:44 +0200, Frank Bergmann wrote:

> On 12.05.2014 21:44, Thomas Petazzoni wrote:
> > Dear Frank Bergmann,
> >
> > On Fri,  9 May 2014 22:42:48 +0200, Frank Bergmann wrote:
> >
> >> +ifeq ($(BR2_nios2),y)
> >> +BR2_GLOBAL_PATCH_DIR += "board/common-nios2"
> >> +endif
> >
> > Unfortunately, we don't want to have architecture-specific patches, and
> > not applied with this mechanism.
> 
> Sorry I didn't take notice of that.
> Maybe someone could edit chapter 3.4.4 "Customizing packages"
> (http://buildroot.org/downloads/manual/manual.html#packages-custom)
> where such architecture-specific patches are mentioned to avoid
> misinterpreting it like I did.

I don't think chapter 3.4.4 is wrong, but the BR2_GLOBAL_PATCH_DIR is
not meant to be used by Buildroot upstream itself. It's a way for
Buildroot *users* to apply their own custom patches on top of the
various packages that Buildroot has.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
