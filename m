From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Fri, 2 Jan 2015 14:59:17 -0600
Subject: [Buildroot] [PATCH 00/29] SELinux Buildroot Additions
In-Reply-To: <20150101224717.2a063a90@free-electrons.com>
References: <1418702062-61039-1-git-send-email-matthew.weber@rockwellcollins.com>
 <20150101224717.2a063a90@free-electrons.com>
Message-ID: <CANQCQpYzQyMBd8eKvJ8NtB59JpUvSfost6J+5k1gvKKqxNU+eQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Jan 1, 2015 3:47 PM, "Thomas Petazzoni" <
thomas.petazzoni@free-electrons.com> wrote:
>
> Dear Matt Weber,
>
> On Mon, 15 Dec 2014 21:53:52 -0600, Matt Weber wrote:
>
> > ### What's in this patchset?
> >
> > This patchset adds the required userspace tools, libraries, example
> > QEMU target, existing package modifications, and initial policy
> > to Buildroot.
>
> Thanks for this patch series. As you've seen, I've started integrating
> the first patches. However, the tarballs are not located where
> specified by your .mk file (the build worked in my
> case because I had the tarballs locally). And the selinuxproject.org
> site is down currently, so I can't fix anything. This is causing some
> build failures such as:
>
>
http://autobuild.buildroot.org/results/a95/a95412f8e78a64bbbf5a7981db35cdea0108e8b4/build-end.log
>
> If we can't find an upstream location with those tarballs quickly, then
> I'll disable those packages for now.
>

Oops, yeah i was working off a mirror.

Looks like a patch moving to the new repo was submitted earlier today.
I'll go through and retest with those locations. Plus see if any of the
other patches have the same issue.

> Also, it seems that Debian has libselinux 2.3, while your package is
> still using 2.1. Would it be possible to bump to 2.3 at some point?

Comment below.

>
> Finally, I have found what appears to be the new Git repository for the
> SELinux development at https://github.com/SELinuxProject/selinux. And
> it seems that now all components are in a single Git repository. Are
> they still doing separate tarballs for each component? I have the
> feeling that packaging separately checkpolicy, libselinux, libsemanage,
> libsepol, policycoreutils and sepolgen is maybe not the way to go.
>
> Can you clarify this before I spend more time merging more of your
> patches?

Definitely.  In general we errored on the side of using older stable libs
when we pulled our selinux config together.  (Didn't realize the possible
change in how the libs/tools were organized) I'll take a look at pulling
things to the latest and see how that impacts how those packages are
built.  I know that there were cross compile issues with a couple of the
packages that we worked around so I'll see how things look porting wise.

Thank you for the review and pulling this in.  I'll spend some time Monday
figuring out if we should merge these patches or update to match the new
repo layout.

Matt
>
> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150102/a4e82df2/attachment.html>
