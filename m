From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Wed, 23 Nov 2011 16:14:19 +0100
Subject: [Buildroot] running 'make ctng-menuconfig' after make clean
 doesn't work
In-Reply-To: <CABkKHSYPHr7MAXH8B-yQe3LwHzaWBzdc1F_nSZW0hyXOE+rTbA@mail.gmail.com>
References: <CABkKHSYPHr7MAXH8B-yQe3LwHzaWBzdc1F_nSZW0hyXOE+rTbA@mail.gmail.com>
Message-ID: <CAAXf6LWdoVvpaCg1r9SGsHvgf+3_LtmYyJviXrHRfE=KRoA5CQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Wed, Nov 23, 2011 at 3:27 PM, Aleksander Dutkowski
<adutkowski@gmail.com> wrote:
> hi,
>
> If I choose crosstool-ng, make my rootfs, then 'make clean', and then
> 'make ctng-menuconfig' it crashes:
>
> http://wklej.org/id/633176/
>
> after make distclean it works fine. I have got this problem under
> buildroot 2011-08, in few hour I'll test if 2011.11-rc2 provides the
> same problem

Can you check what the error is in
/buildroot/buildroot-2011.08-cs/output/build/host-gawk-3.1.8/config.log
?

There is currently a known problem that in the scenario:
make clean
make ctng-menuconfig

you should actually run:
make clean
make dependencies
make ctng-menuconfig

but I'm not sure if that is the problem in your case.

Best regards,
Thomas
