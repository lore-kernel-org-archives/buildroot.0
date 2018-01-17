From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Wed, 17 Jan 2018 10:06:47 +0100
Subject: [Buildroot] [PATCH] libselinux: add patch to make the build
 process more standard
In-Reply-To: <20180116234426.4d2433c0@windsurf>
References: <20180116082153.8425-1-marcus.folkesson@gmail.com>
 <20180116234426.4d2433c0@windsurf>
Message-ID: <20180117090647.GA886@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Tue, Jan 16, 2018 at 11:44:26PM +0100, Thomas Petazzoni wrote:
> Hello,
> 
> On Tue, 16 Jan 2018 09:21:53 +0100, Marcus Folkesson wrote:
> > Patch the Makefiles to make PREFIX and DESTDIR follow standard
> > semantics to get rid of DESTDIR during compile time in
> > libselinux.mk and generate proper pkg-config files.
> > 
> > Fixes:
> >  http://autobuild.buildroot.net/results/74d27370c7623e89e401203a485193340e992e7c/
> > 
> > Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> > ---
> >  ...build-follow-standard-semantics-for-DESTD.patch | 137 +++++++++++++++++++++
> >  package/libselinux/0003-revert-ln-relative.patch   |  24 ----
> >  package/libselinux/0004-revert-ln-relative.patch   |  24 ++++
> >  package/libselinux/libselinux.mk                   |   8 +-
> >  4 files changed, 163 insertions(+), 30 deletions(-)
> >  create mode 100644 package/libselinux/0003-libselinux-build-follow-standard-semantics-for-DESTD.patch
> >  delete mode 100644 package/libselinux/0003-revert-ln-relative.patch
> >  create mode 100644 package/libselinux/0004-revert-ln-relative.patch
> 
> Applied to master, thanks. Thanks a lot for working on this!
> 
> Besides the 3 packages you already fixed, there is also selinux-python
> that still uses DESTDIR during the build process.
> 
> Also, could you submit your 3 patches (libselinux, libsepol and
> libsemanage) to the upstream SELinux project? We really would like to
> see these being adopted by the upstream project.

I have reworked all Makefiles in the SELinux project (including
selinux-python), all patches is submitted upstreams and under review.

OK, I will add the patch for selinux-python package aswell.


> 
> Thanks!
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com


Best regards
Marcus Folkesson
