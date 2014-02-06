From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Feb 2014 10:08:19 +0100
Subject: [Buildroot] [RFC PATCH] Add OpenTyrian package (SDL game)
In-Reply-To: <52F2BE4F.3080600@mind.be>
References: <1391624243-10898-1-git-send-email-julien.boibessot@free.fr>
 <52F2BE4F.3080600@mind.be>
Message-ID: <20140206100819.11d566f5@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Wed, 05 Feb 2014 23:42:23 +0100, Arnout Vandecappelle wrote:

> > +OPENTYRIAN_DATA = tyrian21.zip
> > +OPENTYRIAN_DATA_SITE = http://sites.google.com/a/camanis.net/opentyrian/tyrian/
> 
>  Why not simply http://www.camanis.net/opentyrian/tyrian21.zip ?
> 
> > +
> > +define OPENTYRIAN_DOWNLOAD_DATA
> > +	@$(call MESSAGE,Downloading data)
> > +#	@$(call DOWNLOAD,$(OPENTYRIAN_DATA_SITE),$(OPENTYRIAN_DATA)) << doesn't work !!
> 
>  DOWNLOAD expects the full URL as the first argument. The optional second
> argument exists for cases where the local file should be different than
> the base of the URL (e.g. if it contains question marks or other madness).

As I've replied separately, packages should not directly use the
DOWNLOAD macro, I believe.

> > +define OPENTYRIAN_BUILD_CMDS
> > +        $(MAKE) PLATFORM=UNIX \
> > +		CC="$(TARGET_CC)" \
> > +		STRIP="$(STRIPCMD) $(STRIP_STRIP_UNNEEDED)" \
> 
>  Everything in target is already stripped automatically at the end, so
> it's usually not needed to pass this.

Except if the package does its own stripping, and defaults to the host
strip to do this. In this case, we can either pass STRIP=/bin/true, or
pass the real STRIP value.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
