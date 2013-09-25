From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 25 Sep 2013 22:12:37 +0200
Subject: [Buildroot] [PATCH 0 of 9 v4] linux/uboot: add support for
 custom Mercurial repositories
In-Reply-To: <CAAXf6LU43Qj8CwnPcC2=w5d_cV5=+L=rXoaYmJgU4wHrG4YwdA@mail.gmail.com>
References: <patchbomb.1378152469@argentina> <20130919214908.35f7f8ca@skate>
 <CAAXf6LU43Qj8CwnPcC2=w5d_cV5=+L=rXoaYmJgU4wHrG4YwdA@mail.gmail.com>
Message-ID: <CAAXf6LWfZ-uut7m97tyaCWs_FjmR4rh9k876Vyaq65m87qQGhQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On Fri, Sep 20, 2013 at 11:22 AM, Thomas De Schampheleire
<patrickdepinguin+buildroot@gmail.com> wrote:
> Hi Thomas,
>
> Thanks for coming back to this...
>
> On Thu, Sep 19, 2013 at 9:49 PM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
>> Dear Thomas De Schampheleire,
>>
>> On Mon, 02 Sep 2013 22:07:49 +0200, Thomas De Schampheleire wrote:
>>
>>> This series adds support for custom Mercurial repositories in uboot and linux
>>> packages.
>>>
>>> This version is rebased with the 2013.08 master, there are only a few
>>> real changes.
>>
>> Since it seems we have issues deciding what to do with the
>> Config.in.legacy handling for string options, I was thinking: can't we
>> just avoid the problem altogether? Instead of having separate Config.in
>> options for each of Git, Mercurial, SVN and so on, what about just
>> adding an option "BR2_TARGET_LINUX_CUSTOM_REPO_METHOD" which allows the
>> user to select git, hg, svn or cvs, and keep the other option names
>> unchanged. I admit it's a bit funky to keep options such as
>> BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL to store the location of a
>> Mercurial repository, but well, since we can't make up your mind on the
>> Config.in.legacy stuff, maybe that's a way of at least getting your
>> feature merged.
>>
>> I'm just thinking of a way to move forward, not sure it's the right
>> solution.
>>
>
> Currently, both for Linux and Uboot, the choice between Git and Hg is
> done via the 'Version' choice (which provides the choice between a
> number of real versions, custom tarball, and git and hg). So there is
> already a choice and no real separate option for each version control
> system.
> What my patches did was avoid adding extra options for Mercurial, by
> re-using (and renaming) the git options to specify the URL and
> revision. Not renaming the git options is indeed possible, but pretty
> funky indeed. I'm not a big fan of this, to be honest.
>
> It's true that it seems difficult to reach a decision in the legacy
> questions. From the top of my head, the main questions are:
> 1. Do we want that legacy options are automatically propagated to
> their new options, when possible, or should the user do this?
> 2. Do we accept that the user needs to save-and-reopen menuconfig in
> case we opt for automatic propagation.
>
> I see three ways out:
> a. we reach a consensus
> b. a decision is taken by the maintainer, possibly without consensus
> c. we leave the current situation (for now)
>
> Note that my patchset does not _change_ the current situation. Rather,
> it merely documents how you should handle legacy options in this
> current situation, both to the user and the developer. The Mercurial
> support just follows the existing approach.
> This provides a good way forward in my opinion, if a and b turn out to
> be impossible: we accept the patchset as it is, knowing that it just
> follows the same route as we were going, and if we want to change
> something about the legacy handling we can do that later.
>
> Note also that regardless of how we proceed, I really want this to be
> part of 2013.11, because this series is already circulating for a long
> time.

ping?

Thanks,
Thomas
