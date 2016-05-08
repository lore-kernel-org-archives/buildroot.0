From: Gilles Chanteperdrix <gilles.chanteperdrix@xenomai.org>
Date: Sun, 8 May 2016 22:19:51 +0200
Subject: [Buildroot] [PATCH 19/34] reproducibility/python: make python
 reproducible
In-Reply-To: <20160507222926.33bded73@free-electrons.com>
References: <20160430074358.GE1781@hermes.click-hack.org>
 <1462002570-14706-1-git-send-email-gilles.chanteperdrix@xenomai.org>
 <1462002570-14706-19-git-send-email-gilles.chanteperdrix@xenomai.org>
 <20160507222926.33bded73@free-electrons.com>
Message-ID: <20160508201951.GQ13285@hermes.click-hack.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, May 07, 2016 at 10:29:26PM +0200, Thomas Petazzoni wrote:
> Hello,
> 
> On Sat, 30 Apr 2016 09:49:15 +0200, Gilles Chanteperdrix wrote:
> > python build is not reproducible for two reasons:
> > - the libpython library embeds the build timestamps, fix this by
> >   overriding the __DATE__ and __TIME__ macro using SOURCE_DATE_EPOCH;
> > - _sysconfigdata.py and config/Makefile on target includes references
> >   through INSTALL and MKDIR_P variables to host tools, fix this by
> >   overriding these variables values with the corresponding paths on
> >   buildroot rootfs.
> 
> For this second part, are you really aiming at having reproducible
> builds with different build directories ? As you say in your cover
> letter, that's an even more complicated problem.

No, the aim is to get binaries which do not depend on the location
of "install" and "mkdir" on the host file system, but rather get
them to depend on their location on the target file system, since it
is where theses files are going to be used.

-- 
					    Gilles.
https://click-hack.org
