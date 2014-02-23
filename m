From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 23 Feb 2014 11:00:21 +0100
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20140223073009.3676E101056@stock.ovh.net>
References: <20140223073009.3676E101056@stock.ovh.net>
Message-ID: <20140223110021.16b6b976@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

On Sun, 23 Feb 2014 08:30:09 +0100 (CET), Thomas Petazzoni wrote:

>       bfin |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/051645bb07daab81241a378a8cc426d617b98a64/
>       bfin |              alsa-utils-1.0.26 | NOK | http://autobuild.buildroot.net/results/03885497b519c17338e8f53194ea1b425fbab4d8/

This is being taken care of by Thomas De Schampheleire.

>       bfin |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/93a97f90345d193b52035b2dc7559a306e11098e/
>       bfin |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/3ee23ac4cbfd02555185689486dea5b103b05294/

I'll try to have a look today at these.

>       bfin |               e2fsprogs-1.42.9 | NOK | http://autobuild.buildroot.net/results/ee2c1568d16ac040011dd4d6d8b543ff9e9e2622/

Ditto.

>      avr32 |               gst1-libav-1.2.2 | NOK | http://autobuild.buildroot.net/results/d727c0f61b84acee08d2262691e07f9839235f54/

Don't know. Any idea?

>      avr32 |              iputils-s20121011 | NOK | http://autobuild.buildroot.net/results/4a5ba3987ceaadc385a8e77acf8aa0c598811b22/
>      avr32 |              iputils-s20121011 | NOK | http://autobuild.buildroot.net/results/a96ae6bca11375ed872da48bbae4e923e0fba4e5/
>      avr32 |              iputils-s20121011 | NOK | http://autobuild.buildroot.net/results/d6768cc732353f1d53ed1ae3e9c8102abb9db0fa/

Fixed by
http://git.buildroot.net/buildroot/commit/?id=50c33ad125e84f6df485b85ef10c9dd6b73ae7ea.

>       bfin |            libcec-libcec-2.1.1 | NOK | http://autobuild.buildroot.net/results/670ce46627daaa4ae9ecdb8ffb6f97d0574354d4/

Fixed by
http://git.buildroot.net/buildroot/commit/?id=ff6000507ae32006f1da8c3510bc3d48fbe7ccae

>   mips64el |         ltp-testsuite-20130904 | NOK | http://autobuild.buildroot.net/results/f9b3780c712ba7e3cbb871dcfd5123340be688b3/

Cannot work in master, it needs the version bump in next. Should we
disable ltp-testsuite build on mips64el in master?

>     x86_64 | lua-ev-458165bdfe0c6eadc788... | NOK | http://autobuild.buildroot.net/results/41c8bb9cf91a86908a150dae27726136cb56f5b7/

Samuel, Fran?ois, you discussed this problem recently. Can you come up
with a patch that solves it?

>      nios2 |                 minidlna-1.1.1 | NOK | http://autobuild.buildroot.net/results/2e6fa6e4891b5cc4c75943130158aa24fa77f26e/

configure: error: Could not find libavformat - part of ffmpeg
make: *** [/home/test/test/3/output/build/minidlna-1.1.1/.stamp_configured] Error 1

Ezequiel?

>        arm |                   opencv-2.4.2 | NOK | http://autobuild.buildroot.net/results/71e4c8118871ec220f1b1a420eae4cfd74ac148f/

smooth.cpp:525:1: internal compiler error: in vect_transform_stmt, at tree-vect-stmts.c:5468

This is with a fairly old Crosstool-NG toolchain. We should ignore
this, I believe.

> microblaze |                  pixman-0.30.0 | NOK | http://autobuild.buildroot.net/results/8064092cdbac85fbf4322429d29d5d11dc51860f/

Fixed by
http://git.buildroot.net/buildroot/commit/?id=a9baea4345625f6f00fc59395faec83e08346015.

>     mipsel |                  rt-tests-0.83 | NOK | http://autobuild.buildroot.net/results/074265602bec4aba6c82d1aee389045e8ad33d4b/

Ryan Barnett has sent a patch to fix this. Peter, can you commit
http://patchwork.ozlabs.org/patch/323254/ and
http://patchwork.ozlabs.org/patch/323255/.

>   mips64el |                   sawman-1.6.3 | NOK | http://autobuild.buildroot.net/results/19bfe0d39e457fd260b73928331721f57555fc84/
>   mips64el |                   sawman-1.6.3 | NOK | http://autobuild.buildroot.net/results/1dffadaed95ad328e464ec08440d5a28de6e8b47/

Fixed by
http://git.buildroot.net/buildroot/commit/?id=0a2850104bd1b3e9e7011e8dd7767eff158b835e.

>       bfin |                     sdl-1.2.15 | NOK | http://autobuild.buildroot.net/results/9c893390fb4ca5630f03387adc918c8a3d80c912/
>      nios2 |                     sdl-1.2.15 | NOK | http://autobuild.buildroot.net/results/543b4135c7996133f32e82d72d6f2969622f8617/

Both fixed by http://patchwork.ozlabs.org/patch/323145/. Peter can you
commit this patch?

>    aarch64 |                      vlc-2.1.2 | NOK | http://autobuild.buildroot.net/results/64c4f405c7bd72e5e9dc8fc0823677b79e476e8e/
>     x86_64 |                      vlc-2.1.2 | NOK | http://autobuild.buildroot.net/results/8726be7b5432dbab0b0ca5a0c0e5152a66c45171/
>     x86_64 |                      vlc-2.1.2 | NOK | http://autobuild.buildroot.net/results/b319c6722395a99f98790e6c4582dc872d7ef0d9/

Weird problems :)

>    powerpc |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/3ce992a663ddf1030a987bb778f8275a8e5fdef0/

To be investigated.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
