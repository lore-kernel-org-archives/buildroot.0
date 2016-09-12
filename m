From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Sep 2016 21:12:09 +0200
Subject: [Buildroot] [PATCH v5 1/1] package/rpm: switch to version
 4.12.0.1
In-Reply-To: <CALe+oY-r_4eY1CLEXezkU0vrCAj8wFAA=NTycpoBS7C9ELLxpw@mail.gmail.com>
References: <20160909163708.31980-1-james.knight@rockwellcollins.com>
 <20160911155431.6204c127@free-electrons.com>
 <44f2d9ff-605a-f414-21df-e9d3eace0164@mind.be>
 <20160911231539.29e123e3@free-electrons.com>
 <CALe+oY-r_4eY1CLEXezkU0vrCAj8wFAA=NTycpoBS7C9ELLxpw@mail.gmail.com>
Message-ID: <20160912211209.05946124@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 12 Sep 2016 12:06:18 -0400, James Knight wrote:

> Unless it's somewhere else, rpm.org's claim of release 4.13 was never
> completed [1]. The only 4.13 release made was a release candidate [2]
> (although I believe the Fedora team uses the RC; will probably
> additional distribution patches).
> 
> ---
> 
> The request to change to rpm.org's variant for Buildroot is based off
> of several reasons. As already mentioned by Baruch Siach in the past
> (reiterated by Arnout), rpm.org's stream is more active. This is
> driven by the fact that rpm.org variant is used in most RPM-based
> distributions. This brings the benefit of having the ability to stack
> on stable patches from a series of distributions which use it (ex:
> [3]). Will there ever be an official 4.13 or later release, I would
> assume not; but, I don't think rpm.org is going anywhere until they
> replace it with something like Flatpak.
> 
> For a lot of the work I've been working on, I uses RPMs to stack
> software packages for OS's I generated with Buildroot. To help make it
> easier to build/package RPMs for a target, I try to ensure a generate
> toolchain provides a compatibility RPM tool suite for developers to
> use. After trying both rpm.org and RPM5's variants, I find rpm.org's
> variant easier to build and maintain. With the current version of RPM5
> we have in Buildroot, it does some things I do not like. For example,
> it builds its internal version of BerkeleyDB instead of using
> Buildroot. I tried adjusting that (as well as other features) but had
> a series of issues using Buildroot's current version of BerkeleyDB.
> Naturally, I tried taking the time in upgrading to RPM5's most recent
> version but there were a series of issues trying to get things to work
> as well. While I can't recall all the code-related issues, one major
> annoyance was that RPM5's most recent releases are distributed via
> srpm ("src.rpm") files. It got complicated trying to get Buildroot to
> download a source-RPM file to extract, especially on systems which
> didn't have an existing RPM tool suite.
> 
> I also plan to re-submit patches in the future to enable RPM host tool
> packages. This is to help generate compatible RPM packages and manage
> database generating during the build phase and post-build
> modifications. While I cannot remember the specific issues I've
> experienced, I recall having some host-related issues with building
> and distributing an RPM5-generated tool suite.
> 
> Really, I don't mind if Buildroot supports having either RPM variant.
> I don't mind re-submitting patches which move the existing Buildroot
> rpm package under the name rpm5 and provide a new rpm4 (or use the
> existing Buildroot rpm package) for rpm.org's variant (if anyone
> uses/is-dependent-on RPM5). From my own experience, I believe rpm.org
> variant is an overall improved experience under Buildroot than RPM5.

Thanks for this explanation. I don't think packaging both rpm4 and rpm5
makes sense, so let's switch the rpm package to this more active/useful
upstream project, as you propose.

Can you include the summary you made in the commit log (avoiding first
person speech however) ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
