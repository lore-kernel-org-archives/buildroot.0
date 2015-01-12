From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 12 Jan 2015 09:32:30 -0600
Subject: [Buildroot] [PATCH v4 00/27] SELinux Buildroot Additions
In-Reply-To: <20150110165134.617b741c@free-electrons.com>
References: <1420816288-8750-1-git-send-email-matthew.weber@rockwellcollins.com>
 <20150110165134.617b741c@free-electrons.com>
Message-ID: <CANQCQpbw8HFugx=P+Vu3t+wwz3H_gVBTXGBAMOtgt_PG9755fQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Sat, Jan 10, 2015 at 9:51 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Matt Weber,
>
> On Fri,  9 Jan 2015 09:11:01 -0600, Matt Weber wrote:
>
>> ### What's SELinux?
>>
>> Security-Enhanced Linux (SELinux) is a Linux feature that provides
>> a variety of security policies, including U.S. Department of Defense
>> style mandatory access controls (MAC), through the use of Linux
>> Security Modules (LSM) in the Linux kernel. It is not a Linux
>> distribution, but rather a set of modifications that can be applied
>> to Unix-like operating systems, such as Linux and BSD.
>
> Thanks for your persistence with this major effort. I must say overall
> I am still a bit scared by the amount of patches needed in the various
> SELinux components to get them to behave properly in a
> cross-compilation environment, and I believe those changes should be
> submitted upstream.
>
> I made the exact same comment back when you submitted the first
> version in September 2013, but apparently no work has been done to
> improve upstream with regarding to cross-compilation. I'm certainly not
> asking for the entire work to be done. But the fact that within the 1.5
> years since you first submitted this patch series, you have apparently
> not worked with upstream to resolve those issues does not make me very
> comfortable. What tells me that this upstreaming work will start at
> some point?

We did get feedback and I'll elaborate more below.  In general the
packages required to provide SELinux support are tightly interwoven
version wise and internally we haven't jumped to the latest yet
because of the validation required to do so.  Most of the package
versions in this patchset are the last stable configuration still used
by the majority of other SELinux enabled Linux distributions.  There
are a few packages that we could definitely pull forward which will
improve the cross compiling capability, but at the cost of possibly
breaking functionality.  (I'm not advocating in any way for the cross
compilation patches that I've submitted, they just produce a stable
configuration that we're using.  So to move forward, we are reviewing
those and working back through our upstream email threads to see where
things ended up or if we should bump the package.)

Per your other email about patchworks, I'm curious to see if others
are interested in SELinux being merged.  If there is interest, I would
rather take feedback, a couple release cycles, some testing and get
the right configuration merged.

>
> Main examples:
>
>  - The Swig / setools patch. This patch is quite long, but fairly
>    trivial. Why hasn't it been submitted upstream?

Tresys released setools as a open source project but wasn't open to
feedback to resolve issues.  Plus they stopped updating setools3 when
they started setools4 (which is a major rework, still trying to figure
out impacts to updating to this.  the latest does fix cross
compilation though by changing to the setuptools for building....).

>
>  - Clearly, the thing that scares me the most if the replacement of the
>    audit header generation by a Python script. Can we get at least some
>    feedback from upstream on what approach they could accept? See also
>    what Yocto is doing to solve this problem:
>    http://git.yoctoproject.org/cgit/cgit.cgi/meta-selinux/tree/recipes-security/audit/audit/audit-for-cross-compiling.patch

Thanks, will take a look.

I do know that the newer versions have changed things. We have not yet
bumped to that version for testing though. I will bump and reassess
the impact.

I have found some of Clayton's notes and the email thread but the
maintainer never merged our work or confirmed a workaround.  I think
it might have been because of the pending updates.

>
> Can you give me your plans about upstreaming those cross-compilation
> changes?

Will do.  In advance, I apologize for the slow responses over the next
couple weeks.  Clayton is joining me next month and we will have more
time to make progress on cleanup and bumping of package versions.

Thanks,
Matt
