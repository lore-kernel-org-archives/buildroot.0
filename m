From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 23 Oct 2019 17:56:05 +0200
Subject: [Buildroot] [PATCH 1/1] package/dbus-python: fix build with
 python 3.8
In-Reply-To: <20191023131057.707-1-grzegorz@blach.pl>
References: <20191023131057.707-1-grzegorz@blach.pl>
Message-ID: <20191023175605.7e9202a6@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 23 Oct 2019 13:10:57 +0000
Grzegorz Blach <grzegorz@blach.pl> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/b30/b308eeb5c5d95ab9f1dbfc19f9183f2ba3ba0ce3/
>  - http://autobuild.buildroot.org/results/0dd/0dd9203f859b97ee5a3b6358644c26f8ab784ed8/
>    and many similar failures.
> 
> Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>

Thanks for the investigation. However, as was investigated on kmod and
libselinux, it is most likely not the correct solution. Since Python
3.8, Python extensions are not supposed to link with libpython. --embed
is only for the cases where you *embed* a Python interpreter in your
application/library, not when you implement a Python extension.

See the recent libselinux thread on this.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
