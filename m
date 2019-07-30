From: Petr Vorel <petr.vorel@gmail.com>
Date: Tue, 30 Jul 2019 23:42:58 +0200
Subject: [Buildroot] [RFC PATCH v3 1/2] makedevs: only warn when xattr
 support disabled
In-Reply-To: <20190730205754.GH3194@scaer>
References: <20190730203147.21113-1-petr.vorel@gmail.com>
 <20190730205754.GH3194@scaer>
Message-ID: <20190730214257.GC8530@dell5510>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann, others,

> Why do you want to exit in failure?

> When makedevs exits in error, then whole fakeroot script aborts even
> before attempting to generate the image.

> I can see two problems with that:

>   - first, when iputils is enabled, then the build will by default fail,
>     as xattr support is by default disabled,

>   - I can very well see a scenario where xattr, and thus capabilities,
>     are not desired. For example, if I need iputils, but will only ever
>     call clockdiff as root, then I don't care about its capabilities.

> So, I think it is nice that we warn that xattrs are dropped, but we
> should not fail the build.
Good point, I've sent v4 with this change.
Thanks for your review!

Regards to xattr support by default disabled, could you please have a look at
other my patch, which set default according to xattr support of used rootfs?
https://patchwork.ozlabs.org/project/buildroot/list/?series=120582

NOTE to reviewers: I've cleaned up previous versions in patchwork (set superseded)

Kind regards,
Petr
