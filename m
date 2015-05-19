From: Bryce Schober <bryce.schober@gmail.com>
Date: Tue, 19 May 2015 11:37:55 -0700
Subject: [Buildroot] [OT] Cross-platform Host-SDK infrastructure similar to
	buildroot?
Message-ID: <CAJpxd05f9fofuOdRSOREL6nz8fqMb_+-nrko9_SSv2M6aWYkTw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello folks, I have a question that is only tangentially related to
buildroot...

I really like the "buildroot" style of managing the versions of packages
and libraries and configurations in one place to generate a self-consistent
"SDK" for the target... But what I'd really like is the same convenience
for the host. Is there anything like buildroot that enables you to easily
build a set of libraries and packages for the host? Especially one that
could handle multiple platforms, for example including linux as well as
mingw and osx... Does such a fabled unicorn of awsomeness exist?

I've been abusing buildroot a bit to have it build some of the less
host-configuration-dependent libraries, but it's not a great fit. If I
build for a "target" that matches the host configuration, then all of the
dependencies must be met with buildroot-generated libraries, and it can't
depend on even commonly-available host libraries. If I build host versions
of packages, then I often have to hack / improve the buildroot package to
even support building for the host. So neither way really works very
cleanly. And I can't really imagine what it would take to hack buildroot
into cross-building for mingw-64...

And buildroot is pretty root-file-system focused as well. I imagine that
what I would need is for the the "build" part of buildroot to be more
independent from the "root" part of buildroot, so that it could be more
target-agnostic. Has this subject ever come up under the buildroot umbrella
before?

<><  <><  <><
Bryce Schober
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150519/8aee2aaa/attachment.html>
