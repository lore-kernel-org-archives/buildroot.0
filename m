From: Matthew Weber <matthew.weber@collins.com>
Date: Fri, 5 Feb 2021 12:53:09 -0600
Subject: [Buildroot] [PATCH v10 1/4] package/llvm: bump to version 11.0.0
In-Reply-To: <CANQCQpaZPMTnquYfUhsvfguLd3MkpvGgJ-U+gz3azrrz7sGSkQ@mail.gmail.com>
References: <20210205184343.57068-1-matthew.weber@rockwellcollins.com>
 <CANQCQpaZPMTnquYfUhsvfguLd3MkpvGgJ-U+gz3azrrz7sGSkQ@mail.gmail.com>
Message-ID: <CANQCQpZV1bd=COVcHKrxw6GbQqea_kVgEx6n_j=fFKKpe5W_UQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Feb 5, 2021 at 12:52 PM Matthew Weber
<matthew.weber@rockwellcollins.com> wrote:
>
> Romain,
>
>
> On Fri, Feb 5, 2021 at 12:43 PM Matt Weber
> <matthew.weber@rockwellcollins.com> wrote:
> >
> > Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> > ---
> >  package/llvm/llvm.hash | 2 +-
> >  package/llvm/llvm.mk   | 2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/package/llvm/llvm.hash b/package/llvm/llvm.hash
> > index 6bf2755777..055219a94c 100644
> > --- a/package/llvm/llvm.hash
> > +++ b/package/llvm/llvm.hash
> > @@ -1,3 +1,3 @@
> >  # locally calculated
> > -sha256 00a1ee1f389f81e9979f3a640a01c431b3021de0d42278f6508391a2f0b81c9a llvm-9.0.1.src.tar.xz
> > +sha256 913f68c898dfb4a03b397c5e11c6a2f39d0f22ed7665c9cefa87a34423a72469 llvm-11.0.0.src.tar.xz
> >  sha256 8d85c1057d742e597985c7d4e6320b015a9139385cff4cbae06ffc0ebe89afee LICENSE.TXT
> > diff --git a/package/llvm/llvm.mk b/package/llvm/llvm.mk
> > index 7d60fe7f8c..069312bb3f 100644
> > --- a/package/llvm/llvm.mk
> > +++ b/package/llvm/llvm.mk
> > @@ -5,7 +5,7 @@
> >  ################################################################################
> >
> >  # LLVM, Clang and lld should be version bumped together
> > -LLVM_VERSION = 9.0.1
> > +LLVM_VERSION = 11.0.0
>
> I'm not sure if the bump to 10.x would have had a similar behavior but
> I enabled mesa32 llvmpipe and got a build failure related to the
> config wrapper not being present.
> https://paste.ack.tf/9858ff
>

I should have included this as well.

> find . -name llvm-config
./build/llvm-11.0.0/test/tools/llvm-config
./build/llvm-11.0.0/utils/gn/secondary/llvm/tools/llvm-config
./build/llvm-11.0.0/buildroot-build/bin/llvm-config
./build/llvm-11.0.0/buildroot-build/tools/llvm-config
./build/llvm-11.0.0/tools/llvm-config
./build/host-llvm-11.0.0/test/tools/llvm-config
./build/host-llvm-11.0.0/utils/gn/secondary/llvm/tools/llvm-config
./build/host-llvm-11.0.0/buildroot-build/bin/llvm-config
./build/host-llvm-11.0.0/buildroot-build/tools/llvm-config
./build/host-llvm-11.0.0/tools/llvm-config
./target/usr/bin/llvm-config
./host/aarch64-buildroot-linux-gnu/sysroot/usr/bin/llvm-config
./host/bin/llvm-config


-Matt
