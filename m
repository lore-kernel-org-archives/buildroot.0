From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 5 Jan 2015 21:15:29 -0600
Subject: [Buildroot] [PATCH 00/29] SELinux Buildroot Additions
In-Reply-To: <CANQCQpYzQyMBd8eKvJ8NtB59JpUvSfost6J+5k1gvKKqxNU+eQ@mail.gmail.com>
References: <1418702062-61039-1-git-send-email-matthew.weber@rockwellcollins.com>
 <20150101224717.2a063a90@free-electrons.com>
 <CANQCQpYzQyMBd8eKvJ8NtB59JpUvSfost6J+5k1gvKKqxNU+eQ@mail.gmail.com>
Message-ID: <CANQCQpaUT_e3UY9-fcghHOMeVDB=X1TJ8iNi1BqV21oUn+VPeA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,

On Fri, Jan 2, 2015 at 2:59 PM, Matthew Weber
<matthew.weber@rockwellcollins.com> wrote:
> Thomas,
>
> On Jan 1, 2015 3:47 PM, "Thomas Petazzoni"
> <thomas.petazzoni@free-electrons.com> wrote:
>>
>> Dear Matt Weber,
>>
>> On Mon, 15 Dec 2014 21:53:52 -0600, Matt Weber wrote:
>>
>> > ### What's in this patchset?
>> >
>> > This patchset adds the required userspace tools, libraries, example
>> > QEMU target, existing package modifications, and initial policy
>> > to Buildroot.
>>
<snip>
>>
>> Finally, I have found what appears to be the new Git repository for the
>> SELinux development at https://github.com/SELinuxProject/selinux. And
>> it seems that now all components are in a single Git repository. Are
>> they still doing separate tarballs for each component? I have the
>> feeling that packaging separately checkpolicy, libselinux, libsemanage,
>> libsepol, policycoreutils and sepolgen is maybe not the way to go.
>>
>> Can you clarify this before I spend more time merging more of your
>> patches?
>
> Definitely.  In general we errored on the side of using older stable libs
> when we pulled our selinux config together.  (Didn't realize the possible
> change in how the libs/tools were organized) I'll take a look at pulling
> things to the latest and see how that impacts how those packages are built.
> I know that there were cross compile issues with a couple of the packages
> that we worked around so I'll see how things look porting wise.
>
> Thank you for the review and pulling this in.  I'll spend some time Monday
> figuring out if we should merge these patches or update to match the new
> repo layout.
>

It looks like they have set things up to support backwards
compatibility with separate releases for the different packages,
however I'd rather refactor the patchset to use the new approach.
This would allow us to closely track the development and make it much
easier to update as things would be a single package with a single
version to bump.  I did notice that since they converted it from an
autotools based build to static Makefiles, it looks like we may have
lost some of the capability to turn off features.  So I guess worst
case we also would have some patching needed to add back in that
capability.

I'll can get started on rev2 of the patchset using the single package
approach. Would it work to revert the initial 3 packages that were
added and I will plan to pull in any updates that were made as part of
those initial commits (I believe libsemanage had a misc patch)?


Thanks,
Matt
