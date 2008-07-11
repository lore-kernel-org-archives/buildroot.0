From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Fri, 11 Jul 2008 10:17:29 +0200
Subject: [Buildroot] Makefile.autotools.in problems
In-Reply-To: <87y74aqiyy.fsf@macbook.be.48ers.dk>
References: <18377517.post@talk.nabble.com>
	<87y74aqiyy.fsf@macbook.be.48ers.dk>
Message-ID: <20080711081729.GB11051@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Jul 10, 2008 at 09:47:01AM +0200, Peter Korsgaard wrote:
>>>>>> "Daniel" == Daniel Laird <daniel.j.laird@nxp.com> writes:
>
>Hi,
>
> Daniel> This is only a problem as I have not deleted patches
> Daniel> associated with an old version.  However I wanted to raise
> Daniel> the issue in case it was originally planned that you could
> Daniel> have multiple patches in the directory for different versions
> Daniel> and it would apply only those patches that match.
>
>Yes, the Makefile.autotools.in is kinda half baked still.
>
> Daniel> Perhaps we could have a PKG_STRICT_PATCH variable.  That if
> Daniel> set to true would only apply patches that match the version
> Daniel> string, if not set it would apply all patches.
>
>That or put the patches in version specific sub directories like
>openembedded does.

What's the point in keeping patches for multiple versions again?

We usually "svn mv" affected patches (or should anyway). There really
are very, very few packages where it makes sense to keep multiple
versions. Except toolchain/* only the kernel comes to mind, the rest
should just have exactly 1 version, but that one should build and work
fine.
