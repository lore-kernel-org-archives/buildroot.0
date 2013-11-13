From: Spenser Gilliland <spenser@gillilanding.com>
Date: Wed, 13 Nov 2013 16:35:33 -0600
Subject: [Buildroot] [PATCH v3 6/7] toolchain: uclibc does not support
	microblze
In-Reply-To: <20131113225819.56b10ada@skate>
References: <1384378130-8599-1-git-send-email-spenser@gillilanding.com>
 <1384378130-8599-7-git-send-email-spenser@gillilanding.com>
 <20131113225819.56b10ada@skate>
Message-ID: <1384382133.11719.5.camel@scotch.dyn.gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 2013-11-13 at 22:58 +0100, Thomas Petazzoni wrote:
> Dear Spenser Gilliland,
> 
> On Wed, 13 Nov 2013 15:28:49 -0600, Spenser Gilliland wrote:
> > 
> > Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
> > ---
> >  toolchain/toolchain-buildroot/Config.in |    1 +
> >  1 files changed, 1 insertions(+), 0 deletions(-)
> > 
> > diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
> > index 1529004..57bbc3d 100644
> > --- a/toolchain/toolchain-buildroot/Config.in
> > +++ b/toolchain/toolchain-buildroot/Config.in
> > @@ -9,6 +9,7 @@ choice
> >  config BR2_TOOLCHAIN_BUILDROOT_UCLIBC
> >  	bool "uClibc"
> >  	select BR2_TOOLCHAIN_USES_UCLIBC
> > +	depends on !BR2_microblaze
> 
> Hum, I see a libc/sysdeps/linux/microblaze in my uClibc tree. And also,
> since there are some no-MMU variant of Microblaze processors, which C
> library other than uClibc could they use?

In the distant past there may have been a version of uclibc that worked
with microblaze.  However from my limited testing, the current toolchain
does not work with uclibc. 

> That being said, I don't *require* you to add the support for uClibc.
> Having glibc/eglibc support is already good. We can add uClibc support
> later on.

Sounds great.

Thanks,
Spenser

-- 
Spenser Gilliland
Computer Engineer
IIT ECASP Lab
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 836 bytes
Desc: This is a digitally signed message part
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131113/6a497109/attachment.asc>
