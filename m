From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 20 Aug 2018 19:02:26 +0300
Subject: [Buildroot] uboot-tools autobuilder failure
In-Reply-To: <CANQCQpYFZMAwUs=moym1oc4GCjH6C8AHbDpOueL0r3+c3==BJw@mail.gmail.com>
References: <CANQCQpYFZMAwUs=moym1oc4GCjH6C8AHbDpOueL0r3+c3==BJw@mail.gmail.com>
Message-ID: <20180820160226.gr4enwblhv3g5ds2@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Matt,

On Mon, Aug 20, 2018 at 10:57:54AM -0500, Matthew Weber wrote:
> Hollis, I don't have a machine old enough to debug this failure.
> What's weird is the target uboot-tools is being built with a GCC6/7
> which should support -std=gnu11, however we get a cc1: error:
> unrecognized command line option "-std=gnu11".
> 
> http://autobuild.buildroot.net/?reason=uboot-tools-2018.07

These failures should be fixed in master by commit 03a808a099 (uboot-tools: 
force host CFLAGS).

The failing command runs the host toolchain (HOSTCC) to build the fixdep tool 
that runs on the host as part of the build.

baruch

> Would you mind running a
> https://git.busybox.net/buildroot-test/tree/utils/br-reproduce-build
> on one of those build hashes and when it fails drop into the output
> folder and run a make V=1?  Then paste that back here?

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
