From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 16 Jul 2014 20:35:36 +0200
Subject: [Buildroot] Open bug overview: help wanted!
In-Reply-To: <20140716093105.79a705aa@free-electrons.com>
References: <CAAXf6LU8ZkC4uk5qkq8HGN-zfL=MwAKJP4E=1sDNRDMSJwUutw@mail.gmail.com>
 <20140716093105.79a705aa@free-electrons.com>
Message-ID: <CAAXf6LXpUuW6Nm7F69kGXvM9UVpbEhUQGO+QfnbEkRnYEB4NtA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Wed, Jul 16, 2014 at 9:31 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Thomas De Schampheleire,
>
> On Sat, 12 Jul 2014 20:50:42 +0200, Thomas De Schampheleire wrote:
>
>> https://bugs.busybox.net/show_bug.cgi?id=7208 critical
>> unassigned at buildroot.uclibc.org Glibc C++ aplications crash if they
>> use exceptions.
>> This problem is caused by a patch adding musl support. How to proceed?
>
> A solution was suggested by Rich Felker in the bug report. My plan is
> to work on implementing this solution, but I was hoping to fix bug
> #7250 first, which also affects the toolchain.

Ok, thanks.

>
>> https://bugs.busybox.net/show_bug.cgi?id=7124 major
>> thomas.petazzoni at free-electrons.com Use BR toolchain externally
>> results a non-bootable root filesystem
>> ThomasP: you assigned this bug to yourself, have you been able to
>> reproduce/analyze this already?
>
> Not yet.
>
>> https://bugs.busybox.net/show_bug.cgi?id=7250 minor
>> thomas.petazzoni at free-electrons.com Cannot build with -std=c++11
>> ThomasP attached a patch to the bug report, and the submitter
>> confirmed it to work. So I guess this patch can be submitted to the
>> list now?
>
> The patch I submitted was only for gcc 4.8.x, but I've since then
> written patches for gcc 4.7, 4.8 and 4.9, I only lack the same patch
> for the ARC special version. I'll work on this, but probably not this
> week, since I'm taking care of merging patches this week.

Sure, thanks.

>
>> https://bugs.busybox.net/show_bug.cgi?id=6944 minor
>> unassigned at buildroot.uclibc.org building toolchain for sh4 fails
>> ThomasP: you discussed this patch with the submitter, but there is no
>> final conclusion yet. How to proceed?
>
> I don't know. I don't know SuperH stuff, and it builds a multilib
> toolchain by default, causing some issues. Needs investigation/thoughts
> to see what could be the solution. Problem is that I don't personally
> care much about SuperH, and we don't have a lot of contributors/users
> using this architecture, so it reduces quite a bit the incentive to
> work on such issues.

Understood.
Should we consider deprecating this SuperH support or is that too drastic?

>
>> https://bugs.busybox.net/show_bug.cgi?id=4790 normal jacmet at uclibc.org
>> Running udhcpc on a system with NFS root kills NFS
>> We discussed this patch in the context of the last release cycle. I
>> believe the end conclusion is that we shouldn't try to be too smart
>> with respect to the init scripts/configuration files and instead
>> document the gotchas in the manual. Any takers?
>
> I agree with the solution.
>
>> 6878 minor abrodkin at synopsys.com dmraid: disabled on ARC
>> 7088 minor sonic.zhang at analog.com elfutils on Blackfin doesn't build
>> 6872 minor unassigned at buildroot.uclibc.org gpsd: disabled on microblaze
>
> These ones are mainly here to remind the respective architecture
> maintainers that they should do something about these packages: we have
> temporarily solve the situation by excluding those packages using
> "depends on !<problematic architecture>", but ultimately there's no
> technical reason for those packages to be disabled on those
> architectures. So to not forget, I submitted those bug reports instead.
> Here the intent is to distinguish packages that for some technical
> reason do not support a given architecture (such as webkit, or jamvm,
> that really do have some architecture-specific code) from packages
> currently broken on a given architecture, but which could potentially
> work.
>
> That being said, while I'm pretty sure the dmraid issue on ARC will be
> solved at some point, I have less hopes for the elfutils on Blackfin
> and gpsd on Microblaze issues, since we don't receive much help to
> maintain those two architectures in Buildroot...
>
>> 7136 normal thomas.petazzoni at free-electrons.com ecryptfs-utils needs
>> gettext to run when glibc/eglibc is used
>
> Patches already sent. People were a little bit worried about the
> consequences of the patches, but I don't think there's any other
> solution, so I'd appreciate some review on the patches.
>
>> 7142 normal thomas.petazzoni at free-electrons.com ecryptfs needs getent to run
>
> Yeah, I remember this issue, it was debugged on IRC, and the bug report
> is a reminder to do some work to fix it properly.
>

Thanks for your feedback on all these.

Best regards,
Thomas
