From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 20 Nov 2020 15:14:26 +0100
Subject: [Buildroot] [PATCH 4/4] utils/getdeveloperlib.py: use relative
 paths for files
In-Reply-To: <CAEyMn7ZG+LwAXv7HvGZSo3Sap72SGdh9ThnnuAV7-NTFK0pvMw@mail.gmail.com>
References: <20201119145354.1175043-1-thomas.petazzoni@bootlin.com>
 <20201119145354.1175043-4-thomas.petazzoni@bootlin.com>
 <CAEyMn7ZG+LwAXv7HvGZSo3Sap72SGdh9ThnnuAV7-NTFK0pvMw@mail.gmail.com>
Message-ID: <20201120151426.772f5ad5@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Heiko,

Thanks for the review and feedback!

On Fri, 20 Nov 2020 11:03:45 +0100
Heiko Thiery <heiko.thiery@gmail.com> wrote:

> I do as follows:
> 
> --- >8 ---  
> # mkdir b
> # cd b
> # make ../buildroot/ defconfig
> # ../buildroot/support/scripts/pkg-stats -c --json out.json
> make: *** Keine Regel, um ?show-info? zu erstellen.  Schluss.

The current folder must be a Builroot output directory:

$ mkdir foobar/
$ cd foobar/
$ make -C /path/to/buildroot O=$(pwd) blabla_defconfig
$ make pkg-stats
or
$ /path/to/buildroot/support/scripts/pkg-stats -c --json out.json

Or this should also work (but not tested)

$ cd /path/to/buildroot
$ make O=/output blabla_defconfig
$ make O=/output pkg-stats

In any case: "pkg-stats -c" runs "make show-info", so it needs to be
from a place where you can run Buildroot make targets.

Does this clarifies the situation ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
