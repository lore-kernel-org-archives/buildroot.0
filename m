From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 21 Oct 2015 22:51:57 +0200
Subject: [Buildroot] Compiler errors pointing in BUILD_DIR when using
 OVERRIDE_SRCDIR
In-Reply-To: <5627F50F.2060201@mind.be>
References: <CAKMA=Nbi2xkzg77St8PAbmQ79WKCeFw3KWDTuFkRYNR0pULzeQ@mail.gmail.com>
 <5627F50F.2060201@mind.be>
Message-ID: <20151021225157.04f425da@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, Julien,

On Wed, 21 Oct 2015 22:26:55 +0200, Arnout Vandecappelle wrote:

> > In my company we are using buildroot for package development.
> > According to the buildroot documentation we are using the
> > <pkg>_OVERRIDE_SRCDIR mechanism.
> > 
> > It works great when the build is going well. However when there is a
> > compiler error/warning the issue is referring files in
> > output/build/<pkg> (because the source code was rsynced at this
> > location to be built).
> >>From a developer point of view (which is editing source code in
> > <pkg>_OVERRIDE_SRCDIR), it is difficult to work because if you jump on
> > the error, it does not jump on the source file which is edited. This
> > behavior generates mistake.
> > 
> > What do you think about that (limitation, bug ?) ? Do you think it
> > would be possible to improve it ?
> 
>  Some people (e.g., me :-) use the same source directory to build several
> configurations in separate output directories. In that case, building in the
> source directory wouldn't work...
> 
>  If the package in question supports out-of-tree building (like e.g. the kernel
> or most autotools-based packages), it would be possible that we don't copy the
> sources but instead just build out-of-tree in the build directory. Thomas
> Petazzoni posted a patch series to that effect about two and a half years ago,
> but that series was incomplete and never got applied. So you could take it over,
> perhaps improve and repost it. See [1], but mind [2]. Also, Thomas may have a
> more recent version of the series.

In fact, I already had a discussion with Julien about this issue (I
happen to know Julien for other reasons), and already pointed him to
the idea of doing per-package out-of-tree build. I unfortunately don't
have a more recent version of the series than what I posted a long,
long time ago.

Another option maybe is to ask rsync to create hardlinks so that
developers could edit directly the source files in output/build/<pkg>/
and in fact what gets edited are the files in the original location.
Though I agree that this is quite hackish and I'm pretty sure has lots
of nasty corner cases.

Clearly, the long-term solution to solve this problem is out of tree
build of packages.

At least, this request is great for one thing: it gives me one more
argument to push per-package out of tree build. I was wondering what to
do during my upcoming 10-11 hours flight, maybe you gave me an idea :)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
