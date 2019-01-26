From: Vivien Didelot <vivien.didelot@gmail.com>
Date: Sat, 26 Jan 2019 11:59:20 -0500
Subject: [Buildroot] [PATCH] initramfs: drop comment against multiple
 formats
In-Reply-To: <87womrspw4.fsf@dell.be.48ers.dk>
References: <20190126001901.3090-1-vivien.didelot@gmail.com>
 <87womrspw4.fsf@dell.be.48ers.dk>
Message-ID: <20190126115920.GB18695@t480s.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Sat, 26 Jan 2019 10:56:59 +0100, Peter Korsgaard <peter@korsgaard.com> wrote:
> >>>>> "Vivien" == Vivien Didelot <vivien.didelot@gmail.com> writes:
> 
>  > This patch removes an old comment against having multiple filesystem
>  > formats which doesn't bring any value.
> 
>  > It is also wrong per-se: one may want to use Buildroot to prepare a
>  > custom distribution containing a kernel+initramfs and a persistent
>  > default rootfs to pivot to.
> 
> Yes, but in that case the final persistent rootfs would contain
> different files than the initramfs, right?

Not necessarily. You can prepare one rootfs base containing an init logic
which detects the initrd and eventually formats a partition, extracts a
persistent version, pivots root etc.

The persistent storage can evolve from there by the mean of a package manager
or whatever the board is meant to do with the persistent storage.

> E.G. I handle such a use case by two different defconfigs, one building
> the Linux kernel + initramfs and another for the final persistent
> rootfs.

My point is that it is actually possible to do so, and Buildroot allows that,
so this message has currently no value. So I suggest either we prevent one
to have a built-in initramfs enabled as well as other rootfs formats (which
seems to be a subjective limitation to me) or we get rid of this message
and let the user generate all formats she wants.


Best,

	Vivien
