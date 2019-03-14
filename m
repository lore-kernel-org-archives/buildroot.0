From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 14 Mar 2019 12:06:10 +0100
Subject: [Buildroot] [PATCH v2 02/13] qt5: Convert to generic target
 install command
In-Reply-To: <580bc2fc-615a-f200-0428-1096d2dcdf63@mind.be>
References: <20190314094024.1961-1-anaumann@ultratronik.de>
 <20190314094024.1961-3-anaumann@ultratronik.de>
 <20190314111311.48cda006@windsurf>
 <580bc2fc-615a-f200-0428-1096d2dcdf63@mind.be>
Message-ID: <20190314120610.4ee82dd9@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 14 Mar 2019 12:01:16 +0100
Arnout Vandecappelle <arnout@mind.be> wrote:

> > One issue with this approach is that if you do a complete build, and
> > then do "make qt5base-reinstall", then the date of the .stamp_built
> > file of qt5base has not changed, and will be older than the one of all
> > other packages that have been built after qt5base. Therefore, the rsync
> > that you do will copy again not only the files from qt5base, but also
> > the ones from all other packages that have been built after qt5base.  
> 
>  I agree that this is a problem.
> 
>  But I think it can be easily solved by using the pkg-file-list instead of find.
> Since we already have a dependency of target on staging, we know that the
> pkg-file-list is up-to-date.

True.

> > I continue to believe we want to find a solution where "make
> > INSTALL_ROOT=$(TARGET_DIR) install" and "make
> > INSTALL_ROOT=$(STAGING_DIR) install" works properly.  
> 
>  I disagree. I think the pattern of installing to staging and then copying to
> target is a good pattern.

We basically don't use this pattern anywhere. I would agree with the
general direction of killing the staging vs. target difference, and
simply produce "target" out of "staging" at the very end of the build,
but that's a huge undertaking.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
