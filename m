From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 08 May 2009 11:48:19 +0200
Subject: [Buildroot] [GIT PULL] avr32 updates
In-Reply-To: <d6cda7730905080217u3ade15c6r401cb5832d5d1609@mail.gmail.com>
	("Thiago A. =?utf-8?Q?Corr=C3=AAa=22's?= message of "Fri\, 8 May 2009
	06\:17\:27 -0300")
References: <d6cda7730905072152p4cce227cx2919291711edaf4d@mail.gmail.com>
	<877i0scbjf.fsf@macbook.be.48ers.dk>
	<d6cda7730905080059o7fa58ba6w3bf66241b0c90bc2@mail.gmail.com>
	<87hbzwatgw.fsf@macbook.be.48ers.dk>
	<d6cda7730905080217u3ade15c6r401cb5832d5d1609@mail.gmail.com>
Message-ID: <87ab5oapss.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thiago" == Thiago A Corr?a <thiago.correa@gmail.com> writes:

Hi,

 Thiago> Ok, after an hour of wrestling with git and it's man pages, I
 Thiago> think I got it right :) I was even able to split the kernel
 Thiago> update commit.

Heh, was git rebase -i that bad?

 >> ?Thiago> Something is wrong in the kernel headers in previous versions.
 >> ?Thiago> Something in byteorder.h prevended it from building earlier.
 >> 
 >> But the Linux.advanced stuff doesn't have anything to do with kernel
 >> headers, right?

 Thiago> Unfortunally, it doesn't look like it. Even if I select
 Thiago> 2.6.29 for the linux headers (toolchain), the build
 Thiago> fails. Unless I actually update the kernel on the target, it
 Thiago> fails to build for avr32. According to the avr32-linux
 Thiago> mailling list, there was a byteorder.h restructuring a while
 Thiago> back, so I guess some versions of the headers are not what
 Thiago> iptables expects.

I still don't get it - I've never used the Linux.advanced stuff, but
it's just used to build a kernel for the target and doesn't have
anything to do with the rootfs, right? How can it then influence the
iptables build?

 >> Ok. git am is easy - Simply save the mail and run git am -s <file>

 Thiago> A bit easier said than done *smile*.

 Thiago> I do all of my buildroot development over ssh.

And? Do you mean that your desktop machine is running Windows?

 Thiago> Anyway, what happens if I apply a patch and then you apply it
 Thiago> a while later before pulling from my tree? I guess we will
 Thiago> conflict right?

No, if none of us modify the patch then the git sha1 id will be the
same and the commit just ignored (if one of us modifies it you will
most likely get a merge conflict that you'll have to resolve when you
rebase your changes against me).

 Thiago> my git pull-request: (thanks for the tip)

pulled and pushed.

-- 
Bye, Peter Korsgaard
