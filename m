From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Wed, 11 Sep 2019 17:44:10 +0300
Subject: [Buildroot] Notifications of defconfig and runtime test failures
In-Reply-To: <CAOMZO5DaMfqJL85kkcR-UJ7XsYXuiyytgt9puv4T4T+spWztPw@mail.gmail.com>
References: <20190907061322.CC0778821B@hemlock.osuosl.org>
 <20190907082044.3c46f9e0@windsurf>
 <CAOMZO5DaMfqJL85kkcR-UJ7XsYXuiyytgt9puv4T4T+spWztPw@mail.gmail.com>
Message-ID: <20190911144410.r4o4vivdiganwn54@bars>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Hi Thomas,
> 
> On Sat, Sep 7, 2019 at 3:20 AM Thomas Petazzoni
> <thomas.petazzoni@bootlin.com> wrote:
> 
> > >                             warp7 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/289126413
> 
> warp7_defconfig already selects BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y,
> so I thought this should provide the openssl headers.
> 
> Any ideas as to why this is failing?

Hello Fabio,

New wpa_supplicant v2.9 enables WPA3 support by default, which depends
on openssl. In this case we need target openssl, not the host one.

I have already posted patches to fix latest build failures related
to wpa_supplicant. See patchwork:

https://patchwork.ozlabs.org/project/buildroot/list/?series=129824

Any feedback is welcome.

Regards,
Sergey
