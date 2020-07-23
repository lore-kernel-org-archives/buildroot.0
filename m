From: Adam Duskett <aduskett@gmail.com>
Date: Thu, 23 Jul 2020 09:54:33 -0700
Subject: [Buildroot] [PATCH 00/12] package/udisks: bump version to 2.9.0
In-Reply-To: <20200723163132.0c0c1688@windsurf.home>
References: <20200723010810.3237608-1-aduskett@gmail.com>
 <20200723163132.0c0c1688@windsurf.home>
Message-ID: <CAFSsvmq15vFiZxPuvnO2PHT2_RJxzr+dqJhktsUQDN1aq_HE5Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Jul 23, 2020 at 7:31 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> On Wed, 22 Jul 2020 18:07:58 -0700
> aduskett at gmail.com wrote:
>
> > After successfully compiling in Fedora 32, I loaded up CentOS7 with confidence.
> > Of course, my confidence was my undoing, and udisks immediately choked on
> > trying to build due to CentOS7 having an ancient pre-spidermonkey polkit.
> > After a few hours of fiddling around, I finally figured out what the issue
> > was, added host variants of spidermonkey and polkit, and then added
> > host-polkit as a dependency to udisks and everything compiled cleanly.
>
> Do you have more details about what it does with host-polkit? Indeed,
> having to build host-spidermonkey and host-polkit is quite a big hammer :-/
>
Yeah, udisks attempts to build it's org.freedesktop.UDisks2.policy file.
If the hosts polkit is too old, then a user will receive the error:
"/usr/bin/msgfmt: cannot locate ITS rules for org.freedesktop.UDisks2.policy.in"

Adam
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
