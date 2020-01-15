From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 15 Jan 2020 14:40:48 +0100
Subject: [Buildroot] Allowing to build from Git branches
In-Reply-To: <a299da2b-3b31-d9d3-ebbd-7c67b731ffe7@logilin.fr>
References: <20200114220401.61700031@windsurf>
 <CAFOYHZAq0Yrhg10m+U5UNa5+YRY+gcqDQ9K8sE+Sjg1P32edWQ@mail.gmail.com>
 <20200115090044.5b9d56d0@windsurf>
 <a299da2b-3b31-d9d3-ebbd-7c67b731ffe7@logilin.fr>
Message-ID: <20200115144048.424279f5@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 15 Jan 2020 09:54:16 +0100
Christophe Blaess <mailist@logilin.fr> wrote:

> > However, what I am proposing is not going that far. All what I'm
> > proposing is that if you're doing a clean build, if a package points to
> > a Git branch as an upstream source, then Buildroot would re-fetch from
> > that Git branch rather than using a locally cached tarball in DL_DIR
> > potentially corresponding to an older version of that Git branch.  
> 
> Would it be possible to have an option on a per-package basis to always 
> by-pass the DL_DIR mechanism and re-fetch the sources?

Yes, that would definitely be an idea. There was some discussion
yesterday evening about this on IRC with Yann E. Morin, and indeed one
of the idea that came up is to have something like
<pkg>_DOWNLOAD_TRANSIENT = YES, which would tell the download
infrastructure to refetch from upstream everytime the package is built
instead of using a locally available tarball.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
