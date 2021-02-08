From: Matthew Weber <matthew.weber@collins.com>
Date: Mon, 8 Feb 2021 17:48:09 -0600
Subject: [Buildroot] [External] Re: [PATCH v10 1/4] package/llvm: bump
 to version 11.0.0
In-Reply-To: <700a6200-8311-656a-79c1-9d0eb8b6dc2c@gmail.com>
References: <20210205184343.57068-1-matthew.weber@rockwellcollins.com>
 <CANQCQpaZPMTnquYfUhsvfguLd3MkpvGgJ-U+gz3azrrz7sGSkQ@mail.gmail.com>
 <CANQCQpZV1bd=COVcHKrxw6GbQqea_kVgEx6n_j=fFKKpe5W_UQ@mail.gmail.com>
 <700a6200-8311-656a-79c1-9d0eb8b6dc2c@gmail.com>
Message-ID: <CANQCQpZsvbNi-LVMji47mV8fa6K-c6zeZ=LDEGgAL0Vs=A6y=Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain,

On Sun, Feb 7, 2021 at 8:36 AM Romain Naour <romain.naour@gmail.com> wrote:
>
> Le 05/02/2021 ? 19:53, Matthew Weber a ?crit :
> > On Fri, Feb 5, 2021 at 12:52 PM Matthew Weber
> > <matthew.weber@rockwellcollins.com> wrote:
> >>
> >> Romain,
> >>
> >>
> >> On Fri, Feb 5, 2021 at 12:43 PM Matt Weber
> >> <matthew.weber@rockwellcollins.com> wrote:
> >>>
> >>> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> >>> ---
> >>>  package/llvm/llvm.hash | 2 +-
> >>>  package/llvm/llvm.mk   | 2 +-
> >>>  2 files changed, 2 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git a/package/llvm/llvm.hash b/package/llvm/llvm.hash
> >>> index 6bf2755777..055219a94c 100644
> >>> --- a/package/llvm/llvm.hash
> >>> +++ b/package/llvm/llvm.hash
> >>> @@ -1,3 +1,3 @@
> >>>  # locally calculated
> >>> -sha256 00a1ee1f389f81e9979f3a640a01c431b3021de0d42278f6508391a2f0b81c9a llvm-9.0.1.src.tar.xz
> >>> +sha256 913f68c898dfb4a03b397c5e11c6a2f39d0f22ed7665c9cefa87a34423a72469 llvm-11.0.0.src.tar.xz
> >>>  sha256 8d85c1057d742e597985c7d4e6320b015a9139385cff4cbae06ffc0ebe89afee LICENSE.TXT
> >>> diff --git a/package/llvm/llvm.mk b/package/llvm/llvm.mk
> >>> index 7d60fe7f8c..069312bb3f 100644
> >>> --- a/package/llvm/llvm.mk
> >>> +++ b/package/llvm/llvm.mk
> >>> @@ -5,7 +5,7 @@
> >>>  ################################################################################
> >>>
> >>>  # LLVM, Clang and lld should be version bumped together
> >>> -LLVM_VERSION = 9.0.1
> >>> +LLVM_VERSION = 11.0.0
> >>
> >> I'm not sure if the bump to 10.x would have had a similar behavior but
> >> I enabled mesa32 llvmpipe and got a build failure related to the
> >> config wrapper not being present.
> >> https://urldefense.com/v3/__https://paste.ack.tf/9858ff__;!!MvWE!QoNoAWacp64SQYehF6CWitDX8KoF1Og3NFr2Zp6DLppPMYoC0FGByGQxwQXIKckXB5jt$
>
> Michael Opdenacker is also working on llvm/clang version bump, he had a similar
> issue with libclc build due to new Cmake build system (I guess):
>
> https://urldefense.com/v3/__http://lists.busybox.net/pipermail/buildroot/2021-January/thread.html__;!!MvWE!QoNoAWacp64SQYehF6CWitDX8KoF1Og3NFr2Zp6DLppPMYoC0FGByGQxwQXIKTT_TgEp$
>
> I didn't tested llvmpipe with the current mesa version (20.3.3) maybe you have
> to check with the current Buildroot master.
>

I went back and did a completely clean build (vs adding mesa3d on as a
new package to my compiler-rt testing) and llvmpipe built ok
(https://paste.ack.tf/a56ce8 ).....  So I'll switch gears to look at
the libclc but it looks like llvm version bump is generally working OK
(good to merge if we want to let auto-builders find the rest of the
issues).

-Matt
