From: =?UTF-8?Q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>
Date: Sun, 19 Dec 2010 21:39:19 +0100
Subject: [Buildroot] [PATCH 2/2] linux: fix linux-% shortcut targets
In-Reply-To: <87d3ox1pub.fsf@macbook.be.48ers.dk>
References: <1292783849-8766-1-git-send-email-bjorn.forsman@gmail.com>
	<1292783849-8766-2-git-send-email-bjorn.forsman@gmail.com>
	<87d3ox1pub.fsf@macbook.be.48ers.dk>
Message-ID: <AANLkTin2y_1s87StpK7tbEqy2pbjoUP3BPqmgF6Onj1F@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

2010/12/19 Peter Korsgaard <jacmet@uclibc.org>:
>>>>>> "Bj?rn" == Bj?rn Forsman <bjorn.forsman@gmail.com> writes:
>
> Hi,
>
> ?Bj?rn> linux-% shortcut targets (short for linux26-%) ignores the ouput
> ?Bj?rn> dir $(O) so that 'make O=output.arm linux-menuconfig' is
> ?Bj?rn> actually run in the default $(O) directory output/ and not in
> ?Bj?rn> output.arm/. Fix by passing on $(O).
>
> This is still not correct. You should only pass O= if it was given on
> the command line, otherwise BR will look in output/.config for the
> configuration for non-out-of-tree-builds. I've added EXTRAMAKEARGS in
> the toplevel makefile a while ago to handle it.
>
> Committed with that change.

Thanks for fixing and committing!

Best regards,
Bj?rn Forsman
