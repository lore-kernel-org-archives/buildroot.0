From: =?utf-8?Q?Sh=C3=A9rab?= <Sebastien.Hinderer@ens-lyon.org>
Date: Mon, 12 Mar 2018 06:42:04 +0100
Subject: [Buildroot] Unable to build Buildroot
In-Reply-To: <20180311214546.GA11903@pema>
References: <20180309191151.GA11285@pema>
 <5aa46aaf74feb_16e6139a304805b4@ultri3.mail>
 <20180311214546.GA11903@pema>
Message-ID: <20180312054204.GA10530@pema>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear all,

So, I updated the buildroot submodule properly and removed brltty as an
external package.

I am now facing another compile problem, with qemu I think:

...
  CC      .../targetqga/channel-posix.o
  CC      .../targetqga/qapi-generated/qga-qapi-types.o
  CC      .../targetqga/qapi-generated/qga-qapi-visit.o
  CC      .../targetqga/qapi-generated/qga-qmp-marshal.o
  CC      .../targetutil/memfd.o
  CC      .../targetutil/path.o
util/memfd.c:40:12: error: static declaration of ?memfd_create? follows non-static declaration
 static int memfd_create(const char *name, unsigned int flags)
            ^~~~~~~~~~~~
In file included from /usr/include/x86_64-linux-gnu/bits/mman-linux.h:115:0,
                 from /usr/include/x86_64-linux-gnu/bits/mman.h:45,
                 from /usr/include/x86_64-linux-gnu/sys/mman.h:41,
                 from .../build/host-qemu-2.10.2/include/sysemu/os-posix.h:29,
                 from .../build/host-qemu-2.10.2/include/qemu/osdep.h:104,
                 from util/memfd.c:28:
/usr/include/x86_64-linux-gnu/bits/mman-shared.h:46:5: note: previous declaration of ?memfd_create? was here
 int memfd_create (const char *__name, unsigned int __flags) __THROW;
     ^~~~~~~~~~~~
.../build/host-qemu-2.10.2/rules.mak:66?: la recette pour la cible ??util/memfd.o?? a ?chou?e
make[3]: *** [util/memfd.o] Erreur 1

I tried to disable the host qemu in make menuconfig but that was not
possible.

I also discovered that the host qemu seems to be selected by emacs but I
don't understand what's the linkbetween the two (emacs is provided in
the br2-external tree).

Any hint?

Thanks,

Sh?rab.
