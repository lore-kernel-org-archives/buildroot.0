From: Vincent Fazio <vfazio@xes-inc.com>
Date: Tue, 17 Dec 2019 14:02:39 -0600
Subject: [Buildroot] [RFC/PATCH] download/git: support Git LFS
In-Reply-To: <20180427125419.787ee93e.john@metanate.com>
Message-ID: <20191217200239.GA18361@vfazio1.xes-mad.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> On Fri, 27 Apr 2018 11:17:34 +0100
> John Keeping <john@metanate.com> wrote:
> 
> > On Thu, 26 Apr 2018 22:24:40 +0200
> > "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> > 
> > > On 2018-04-26 18:36 +0100, John Keeping spake thusly:  
> > > > Git Large File Storage replaces large files with text pointers in
> > > > the Git repository while storing the contents on a remote server.
> > > > If a repository is using this extension, then git-lfs must be used
> > > > to checkout the large files before the source archive is
> > > > generated.
> > > > 
> > > > Signed-off-by: John Keeping <john@metanate.com>
> > > > ---
> > > > Currently this relies on git-lfs being installed on the host
> > > > system and I'm not sure if that's considered acceptable or
> > > > not.    
> > > 
> > > I think that would be acceptable, but would require a dependency
> > > check, basically, something like
> > > 
> > >   - support/depenencies/check-host-git.mk :
> > > 
> > >         ifeq (,$(call suitable-host-package,git,$(GIT) $(if
> > > $(BR2_GIT_NEEDS_LFS).lfs))) $(error You need a git that supports
> > > git-lfs) endif
> > > 
> > >   - support/depenencies/check-host-git.sh
> > > 
> > >         #!/bin/sh
> > > 
> > >         GIT="${1}"
> > >         LFS="${2}"
> > > 
> > >         # If LFS not required, any git is OK
> > >         if [ -z "${LFS}" ]; then
> > >             echo "${GIT}"
> > >             exit 0
> > >         fi
> > > 
> > >         # Test LFS
> > >         if ${GIT} help lfs >/dev/null 2>&1; then
> > >             # Works!
> > >             echo "${GIT}"
> > >             exit 0
> > >         fi
> > > 
> > >         exit 1
> > > 
> > > Now, all you have, is to find a way to synthetise
> > > BR2_GIT_NEEDS_LFS. ;-)  
> > 
> > This makes sense, I'll add this check for v2.
> 
> Actually, it looks like adding "git-lfs" to DL_TOOLS_DEPENDENCIES works
> and it's a lot simpler.  What do you think about handling it that way?
> 
> 
> Regards,
> John

Can we revive this discussion? I don't see this implemented yet and I know our organization could really use this functionality.

- Vincent
