From: Michael S. Zick <minimod@morethan.org>
Date: Fri, 18 Nov 2011 06:24:41 -0600
Subject: [Buildroot] RFC: package patching
In-Reply-To: <CAAXf6LVzQpbdCJ3yaQsSREAoNUTjhGLGTgm3izj19m6Z2HJFYg@mail.gmail.com>
References: <CAAXf6LXWc56UcU0s0DBRAVd4SKgB+3P6N49Dc4aGkYFP4oq20Q@mail.gmail.com>
 <20111117224211.0e793a0b@skate>
 <CAAXf6LVzQpbdCJ3yaQsSREAoNUTjhGLGTgm3izj19m6Z2HJFYg@mail.gmail.com>
Message-ID: <201111180624.43018.minimod@morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri November 18 2011, Thomas De Schampheleire wrote:
> On Thu, Nov 17, 2011 at 10:42 PM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
> > Le Thu, 17 Nov 2011 21:23:05 +0000,
> > Arnout Vandecappelle <arnout@mind.be> a ?crit :
> >
> >> ?With that in mind, I would propose a format like this for backport
> >> patches:
> >>
> >> <pkg>-<seqno>-from_<nextversion>-description-of-the-patch
> >
> > Having a comment inside a patch seems to be enough. Sometimes when the
> > patch is pushed upstream, it's merged in the Git repo of the upstream
> > project, but there isn't yet a release with the modification, so it
> > would be hard to known which "nextversion" the patch will be in.
> >
> > We already have comments in patches, those comments can carry the
> > upstream status of the patch, which is also compatible with what we
> > intend to do with the send-patches.org project.
> >
> >> ?I think ThomasP meant that it is best to _remove_ the version numbers.
> >> A version bumper will most likely try to take along all patches anyway, so
> >> putting a version number is just increasing the diffstat. ?Without version
> >> numbers, the diffstat will show much better which patches could be
> >> removed, which ones were added and which ones needed to be modified.
> >
> > Agreed.
> 
> Ok, so an attempt to summarize the discussion so far:
> 
> - most patches should live in package/foo and have a filename of the form:
> <pkg>-<seqnum>-<description>.patch
> 
> - for packages that have multiple versions at once in buildroot,
> patches go into package/foo/foo-version, but have the same filename:
> <pkg>-<seqnum>-<description>.patch
> 
> - support for <pkg>-<version>-<description>.patch is removed, and all
> existing such patches are renamed/moved according to the rules above.
> 
> 
> Some remaining questions:
> * what if a package has multiple versions, and a certain patch applies
> to both versions. Should there be one copy of the patch in
> package/foo, or should the patch be duplicated in
> package/foo/foo-version1 and package/foo/foo-version2 ?
>

Patch should be duplicated, because name will now contain the
sequence number and although the patch contents would be duplicated,
the order of application might not be.

Mike 
> * how many digits should the sequence number have? I now that
> git-format-patch uses 4 digits (0001) but really isn't necessary for
> buildroot since the number of patches we'll have for each package is
> limited. A package with 99 patches would already be extraneous, so I'd
> say 01 (2 digits) is enough.
> This may seem like a detail, but discussing this should keep things
> consistent throughout the future.
> 
> Thanks,
> Thomas
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
> 
