From: =?ISO-8859-1?Q?Thiago_A=2E_Corr=EAa?= <thiago.correa@gmail.com>
Date: Fri, 8 May 2009 07:56:25 -0300
Subject: [Buildroot] [GIT PULL] avr32 updates
In-Reply-To: <87ab5oapss.fsf@macbook.be.48ers.dk>
References: <d6cda7730905072152p4cce227cx2919291711edaf4d@mail.gmail.com>
	<877i0scbjf.fsf@macbook.be.48ers.dk>
	<d6cda7730905080059o7fa58ba6w3bf66241b0c90bc2@mail.gmail.com>
	<87hbzwatgw.fsf@macbook.be.48ers.dk>
	<d6cda7730905080217u3ade15c6r401cb5832d5d1609@mail.gmail.com>
	<87ab5oapss.fsf@macbook.be.48ers.dk>
Message-ID: <d6cda7730905080356i3e2db098yc8d3cc66c41f6ac7@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, May 8, 2009 at 6:48 AM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Thiago" == Thiago A Corr?a <thiago.correa@gmail.com> writes:
> ?Thiago> Ok, after an hour of wrestling with git and it's man pages, I
> ?Thiago> think I got it right :) I was even able to split the kernel
> ?Thiago> update commit.
>
> Heh, was git rebase -i that bad?

Just adding the signoff was easy... commit --amend -s did the trick,
the problem was me trying to split the other commit. I somehow managed
to completely trash my local tree and had to clone it again from the
remote. I really miss svn revert... If I remove some file from the
local tree, I can't bring it back with git fetch, git checkout or git
reset.

> ?>> ?Thiago> Something is wrong in the kernel headers in previous versions.
> ?>> ?Thiago> Something in byteorder.h prevended it from building earlier.
> ?>>
> ?>> But the Linux.advanced stuff doesn't have anything to do with kernel
> ?>> headers, right?
>
> ?Thiago> Unfortunally, it doesn't look like it. Even if I select
> ?Thiago> 2.6.29 for the linux headers (toolchain), the build
> ?Thiago> fails. Unless I actually update the kernel on the target, it
> ?Thiago> fails to build for avr32. According to the avr32-linux
> ?Thiago> mailling list, there was a byteorder.h restructuring a while
> ?Thiago> back, so I guess some versions of the headers are not what
> ?Thiago> iptables expects.
>
> I still don't get it - I've never used the Linux.advanced stuff, but
> it's just used to build a kernel for the target and doesn't have
> anything to do with the rootfs, right? How can it then influence the
> iptables build?

Perhaps it's how it touches all the LINUX26* variables. I have no idea
either. I just tried to update and it worked. I might just be loosing
my mind and tested it wrong, could have forgot to run a toolchain with
2.6.29 and kernel 2.6.28 test and thought that I had. I've been awake
for 36 hours already and still have to study for German test tomorrow
(as second foreign language).

I will leave this building with toolchain kernel headers 2.26.9 and
advanced linux 2.26.7 and see if iptables fails to compile again.

> ?>> Ok. git am is easy - Simply save the mail and run git am -s <file>
>
> ?Thiago> A bit easier said than done *smile*.
> ?Thiago> I do all of my buildroot development over ssh.
>
> And? Do you mean that your desktop machine is running Windows?

Yes, my gentoo build environment runs inside vmware in a quad core.

> ?Thiago> Anyway, what happens if I apply a patch and then you apply it
> ?Thiago> a while later before pulling from my tree? I guess we will
> ?Thiago> conflict right?
>
> No, if none of us modify the patch then the git sha1 id will be the
> same and the commit just ignored (if one of us modifies it you will
> most likely get a merge conflict that you'll have to resolve when you
> rebase your changes against me).

Nice. Then I don't need to skip all patches :)

> ?Thiago> my git pull-request: (thanks for the tip)
>
> pulled and pushed.
>

Thanks.
