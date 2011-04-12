From: =?UTF-8?Q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>
Date: Tue, 12 Apr 2011 19:54:50 +0200
Subject: [Buildroot] which templates are used?
In-Reply-To: <1302590524.4891.196.camel@esp-patben-lin.espdx1.local>
References: <4DA36046.2040606@michaelburghart.de>
	<4DA369FA.8050505@michaelburghart.de>
	<BANLkTime4xLnnmc31J-SUBj0mLgoAxFCnA@mail.gmail.com>
	<1302590524.4891.196.camel@esp-patben-lin.espdx1.local>
Message-ID: <BANLkTikrryS7pGCbme43-5sY_w-+QDWwQQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12 April 2011 08:42, Patryk Benderz <Patryk.Benderz@esp.pl> wrote:
> [cut]
>> Buildroot has a quirk: the rootfs skeleton is copied to the target dir
>> only once(!). If you change any files in ./fs/skeleton (or your custom
>> path) you have to do "make clean" and start over (or hack the
>> Makefile, around line 420...).
> It's not a quirk. I always thought its designed like that.

Yes, it's most likely intended.

But why not always copy skeleton to target dir? I think it would be
more user friendly. If you remove stuff from skeleton you will get out
of sync with target dir, but without a package manager that
out-of-sync problem is inevitable (unless doing full "make clean &&
make".. painfully slow for small skeleton changes). And there *is*
currently an out-of-sync problem in that changes to ./fs/skeleton is
not copied to target dir. And that is confusing.

I think it is more common to *change* skeleton files than to remove,
so I would definitely like to see always-copy-skeleton functionality
in Buildroot.

> You should
> work and modify files in directory buildroot/output/target, shouldn't
> you?

If you meant "you should not modify files in buildroot/output/target"
then yes. That directory is the output of builds and "make clean" will
destroy it.

Best regards,
Bj?rn Forsman
