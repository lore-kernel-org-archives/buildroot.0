From: Charles Krinke <charles.krinke@gmail.com>
Date: Mon, 21 Feb 2011 12:46:19 -0800
Subject: [Buildroot] Moving from 2.6.36.1 to 2.6.35.11 (or perhaps
	2.6.35.9)
In-Reply-To: <87pqqndvdc.fsf@macbook.be.48ers.dk>
References: <AANLkTikMqQa2b8VALCFzCvhzhLGokgjjeu5jwWgbspv1@mail.gmail.com>
	<87pqqndvdc.fsf@macbook.be.48ers.dk>
Message-ID: <AANLkTikoELeQFaxuesMcVL=7VGAd4rwzWH36PfXd1U0X@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks, Peter & Bjorn.

I was able to build a number of different kernel versions yesterday such as
2.6.30.1, 2.6.30.9, 2.6.31.1, 2.6.31.9, 2.6.32.1, 2.6.32.9, ... 2.6.35.1,
2.6.35.9 so all looks good. At this point, I will work with 2.6.35.9 for a
while and see what happens next.

Charles

On Sat, Feb 19, 2011 at 11:21 PM, Peter Korsgaard <jacmet@uclibc.org> wrote:

> >>>>> "Charles" == Charles Krinke <charles.krinke@gmail.com> writes:
>
> Hi,
>
>  Charles> My group desires to use the 2.6.35.11 kernel as it is listed
>  Charles> as a longterm stable kernel instead of the 2.6.36.1 buildroot
>  Charles> currently supports <sigh>.
>
> Ok.
>
>  Charles> In looking at at buildroot, it appears that changine
>  Charles> buildroot-2010.11/.config BR2_DEFAULT_KERNEL_HEADERS *and*
>  Charles> linux/Config.in (3 places) would do it to change to an
>  Charles> arbitrary kernel version.
>
>  Charles> Is this the correct procedure to change these two files? I can
>  Charles> make it work with 2.6.35.9, but it seems that
>  Charles> kernel.org/pub/linux/kernel/v2.6/ contains up to 2.6.35.9 but
>  Charles> not 2.6.35.10 or 2.6.35.11 so 2.6.35.9 works but 2.6.35.11
>  Charles> fails.
>
> The problem is that the long term kernels is a concept that didn't exist
> back when 2010.11 was released. Since 2011.02-rc1 we now automatically
> handle the long term support kernels for 2.6.35 for the kernel headers.
>
> Notice that it isn't strictly required to use the exact same kernel
> headers version as the kernel, so you could keep your kernel headers at
> 2.6.35.9 without any likely issue.
>
> For the kernel you can simply choose 'custom tarball' and provide the
> long term URL.
>
> --
> Bye, Peter Korsgaard
>



-- 
Charles Krinke
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110221/35f17286/attachment.html>
