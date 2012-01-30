From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Mon, 30 Jan 2012 10:19:12 +0100
Subject: [Buildroot] Buildroot Developer Day, Friday 3rd February,
	Brussels
In-Reply-To: <201201271133.20517.arnout@mind.be>
References: <20120124000812.6d043023@skate>
 <CAAXf6LW6aCs-G_FD=pXNGsBrV3133donzNxsuNV_7O=9JMCs4Q@mail.gmail.com>
 <201201271133.20517.arnout@mind.be>
Message-ID: <CAAXf6LU_=sZ4fw_mJ=FL1JZjpc5+Fqf=K=wWQCbHtGLkyZVaBA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jan 27, 2012 at 11:33 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On Wednesday 25 January 2012 12:03:12 Thomas De Schampheleire wrote:
>> On Tue, Jan 24, 2012 at 12:08 AM, Thomas Petazzoni
>> <thomas.petazzoni@free-electrons.com> wrote:
> [snip]
>> > So far, no agenda has been defined for this meeting. It would be great
>> > to discuss a list of topics to be discussed at this developer day.
>> >
>>
>> Some topics we could discuss:
>>
> [snip]
>> - future directions for buildroot
>> -- deprecate customize package
>> -- ...
>
> ?I have a list of 21 ideas for things that I'd like to change in buildroot.
> Any interest in me going over that list? ?The most important ones are:
>
> ?-- support for overlays (cfr. openembedded)
> ?-- support for image-in-image (e.g. cpio+kernel on an ext3+grub on an MBR partition)
> ?-- shared infrastructure for xxx-yyyconfig
> ?-- shared infrastructure for non-autotools builds
>
> ?Also we should make a decision on the host-tools menu that was posted on
> the list before.

Another thing that came to mind recently: if you want to use the same
buildroot sources for two projects (instead of forking them), then you
may end up with conflicts on package versions. For example, the first
project may use a certain kernel version, which causes certain
packages like iproute2 to need a certain version, while the other
project uses a different kernel version and thus a different version
of some packages.
Or maybe independent from the kernel, for some reason a project may
need different package versions.
For most packages, the version to be used is hardcoded in the .mk
file. For others, like gdb, there is a choice of versions via the
.config file. I understand we cannot supply such gdb-like
configuration for all packages as that would be way overkill. However,
another mechanism could be used, e.g. like the source directory
override feature (but then: version override).

And another one: In november I started a discussion on package
patching: http://lists.busybox.net/pipermail/buildroot/2011-November/047505.html
I think we were almost to a conclusion, but it seems I forgot to keep
the thread active and it dried out. So maybe it's worth taking this up
again to reach a conclusion.

Best regards,
Thomas
