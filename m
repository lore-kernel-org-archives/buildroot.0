From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 11 Oct 2018 16:31:13 +0200
Subject: [Buildroot] meson for host package with executables doesn't
 work.
In-Reply-To: <CAFr9PXkRORYwg4JF=moZp-e2bhrXLQAamhy-ygzi0ahq8dtgDg@mail.gmail.com>
References: <CAFr9PXm1Y=HHy4znDBVdxpd2ndHKdu+_unfgSGHkJFotSZ9HKA@mail.gmail.com>
 <20181011120126.4bb50328@windsurf>
 <CAFr9PXkRORYwg4JF=moZp-e2bhrXLQAamhy-ygzi0ahq8dtgDg@mail.gmail.com>
Message-ID: <20181011163113.57ef1244@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 11 Oct 2018 20:42:30 +0900, Daniel Palmer wrote:

> Looking through the history in git it looks like this was broken by
> commit a03f46ca6e9f43028003aedc92f1a1204ae7480f that bumped the
> version of meson and removed a patch that stops meson from stripping
> the RPATH on host executables. I guess because there are no packages
> in-tree that used it (I couldn't find host-meson-package in any
> packages) no one noticed.

Indeed, it could very well be due to this. Could you check if re-adding
this patch makes things work again ? If it does, please submit a patch
re-adding the patch :-)

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
