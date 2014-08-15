From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 15 Aug 2014 18:16:05 +0200
Subject: [Buildroot] Understanding a sysroot issue with 2014.08-rc1
In-Reply-To: <CALo-6+hcfoU04dwydZvdLr7sh6bMQEUzNsAjJqUv7e5_jr=Ezg@mail.gmail.com>
References: <CALo-6+hcfoU04dwydZvdLr7sh6bMQEUzNsAjJqUv7e5_jr=Ezg@mail.gmail.com>
Message-ID: <CAAXf6LU410JEE=zbmWtfKJK61AY=G-n8xVk97ssYzsD4iZLTUA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Charles,

On Fri, Aug 15, 2014 at 5:31 PM, Charles Krinke
<charles.krinke@gmail.com> wrote:
> Gentlemen:
>
> I am trying to work with the latest buildroot-2014.08-rc1 with a currently
> used external toolchain. I am currently using buildroot-2013.08 which is
> working fine with the Linaro 2013.04 external toolchain. My project is an
> ARM AM3517 based project using Qt5.
>
> In trying to use this same external toolchain with buildroot-2014.08, I get
> caught up in
>
> Incorrect selection of kernel headers: expected 2.6.x, got 3.2.x
>
> I can see what is happening is that buildroot is looking at the version of
> the headers on the development Linux PC, which are 3.2 and
> check-kernel-headers.sh is looking in /usr/include/linux/version.h.

Small clarification on top of Yann's answer:

Buildroot is not checking the headers of the development PC, but
rather the kernel headers that come with the toolchain. The kernel
running on the development PC is not relevant here.

Best regards,
Thomas
