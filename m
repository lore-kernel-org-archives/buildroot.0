From: Andrey Yurovsky <yurovsky@gmail.com>
Date: Wed, 16 Aug 2017 13:47:55 -0700
Subject: [Buildroot] [PATCH] gcc: bump 7.x series to 7.2.0
In-Reply-To: <20170816203025.22554-1-thomas.petazzoni@free-electrons.com>
References: <20170816203025.22554-1-thomas.petazzoni@free-electrons.com>
Message-ID: <CAAkeqgUYofAKGse4wPHfA8SeViM9xEhXheUBbAiEZsiS-2se3g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Wed, Aug 16, 2017 at 1:30 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> I'm not sure whether we want this for master or next. I've built 71
> toolchains with GCC 7.2.0 for toolchains.free-electrons.com, the vast
> majority of them being then used to build and boot a Linux kernel +
> minimal userspace under Qemu.
>
> Unfortunately, the tag gcc-7_2_0-release has still not appeared in
> git://gcc.gnu.org/git/gcc.git, so it's hard to see the amount of
> changes between gcc 7.1.0 and gcc 7.2.0.

I suspect this fixes real issues I've seen, including inability to
build systemd due to a GCC7 bug
(https://bugs.busybox.net/show_bug.cgi?id=10136) and some other GCC7
issues I've seen internally. I'll rebuild with this applied and verify
and then comment on the systemd build bug.
