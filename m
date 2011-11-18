From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 18 Nov 2011 08:34:58 +0100
Subject: [Buildroot] RFC: package patching
In-Reply-To: <20111118080500.213b42b0@skate> (Thomas Petazzoni's message of
 "Fri, 18 Nov 2011 08:05:00 +0100")
References: <CAAXf6LXWc56UcU0s0DBRAVd4SKgB+3P6N49Dc4aGkYFP4oq20Q@mail.gmail.com>
 <20111116190306.6e9596a0@skate>
 <CAAXf6LW_qTUwtbdC+QjYnUAd1w5gZ4H55-6+G1Gnt3NV-s4F5w@mail.gmail.com>
 <201111172123.05834.arnout@mind.be> <20111117224211.0e793a0b@skate>
 <CAAXf6LVzQpbdCJ3yaQsSREAoNUTjhGLGTgm3izj19m6Z2HJFYg@mail.gmail.com>
 <20111118080500.213b42b0@skate>
Message-ID: <8762ihanod.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 >> - for packages that have multiple versions at once in buildroot,
 >> patches go into package/foo/foo-version, but have the same filename:
 >> <pkg>-<seqnum>-<description>.patch

 Thomas> I would name the directory package/<foo>/<version> instead of
 Thomas> package/<foo>/<foo>-<version>, because repeating <foo> is useless.

Agreed, but that might break existing users (but the number of people
having a version-specific subdir with custom patches is probably quite
small, so it might be ok).

 Thomas> I also would like to see removed:

 Thomas>  * Support for *.patch.$(ARCH). But that requires some work to get rid
 Thomas>    of the current 4 arch-specific patches that we have for liboil, fbv,
 Thomas>    libmad and jamvm.

 Thomas>  * Support for host-*.patch (which are applied only to the host
 Thomas>    variant). We have only one such patch in the tree (for libgtk2) and
 Thomas>    with a bit of effort, we could make it generic enough so that it
 Thomas>    works on both host and target.

Agreed.

 >> Some remaining questions:
 >> * what if a package has multiple versions, and a certain patch applies
 >> to both versions. Should there be one copy of the patch in
 >> package/foo, or should the patch be duplicated in
 >> package/foo/foo-version1 and package/foo/foo-version2 ?

 Thomas> Duplicated.

Agreed.

 >> * how many digits should the sequence number have? I now that
 >> git-format-patch uses 4 digits (0001) but really isn't necessary for
 >> buildroot since the number of patches we'll have for each package is
 >> limited. A package with 99 patches would already be extraneous, so I'd
 >> say 01 (2 digits) is enough.
 >> This may seem like a detail, but discussing this should keep things
 >> consistent throughout the future.

 Thomas> Agreed that 2 digits is enough.

Me too.

-- 
Bye, Peter Korsgaard
