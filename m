From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 7 Aug 2015 14:11:58 +0200
Subject: [Buildroot] Analysis of build results for 2015-08-06
In-Reply-To: <20150807063016.A3C35101631@stock.ovh.net>
References: <20150807063016.A3C35101631@stock.ovh.net>
Message-ID: <20150807141158.67812ad2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

Alexey, Will, Gustavo, see below.

Classification of failures by reason:

misc:			10
fixed:			9
sparc:			9
arc:			8
musl:			8
download:		1
aarch64:		1

So, we really need to make progress on SPARC, ARC and musl issues. See
below for a more detailed analysis.

On Fri,  7 Aug 2015 08:30:15 +0200 (CEST), Thomas Petazzoni wrote:

>          arm |                    audit-2.4.3 | NOK | http://autobuild.buildroot.net/results/4b9f9285137a91f9523a5a34f168b223ad39551b/

Now fixed by:

	http://git.buildroot.net/buildroot/commit/?id=e43875916a6810b4ff8c65e27840f9da15b86c7a

>        sparc |                    bdwgc-7.4.2 | NOK | http://autobuild.buildroot.net/results/a1932b7e50bb4b69fe95a53e999e808c14e50488/
>        sparc |              bluez5_utils-5.27 | NOK | http://autobuild.buildroot.net/results/5b78301f4825a6169cb03fd0d7a800562a63467a/

SPARC issues.

>          arc |                   boost-1.58.0 | NOK | http://autobuild.buildroot.net/results/dc6da3894ed29da827f62394a8ab270f95e06425/

Still the infamous "error: '__NR_eventfd' was not declared in this
scope".

Alexey?

>        sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/97bf2b607a52ba68257ab86ce822356b36d2a37f/
>        sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/96b979818d49dabd4901e5e14becde6556d685e3/
>        sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/001cd5c0d2a6000cf5f0fcc919e7c3f1e1857d5a/
>        sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/85db02fd54410c09ef1593dd4d0e61bb0af806de/

SPARC/atomic issues.

>       x86_64 | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/065f02d78d0e2729a518b0d34f4c01b505787308/
>       x86_64 | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/dab3f7ba27f8d2ea3c5bf9eeefe4052084136a12/

musl problem.

>       x86_64 |                  cdrkit-1.1.11 | NOK | http://autobuild.buildroot.net/results/d2781e70b04a207e2e9397d888032294c7285034/

musl problem.

>          arm |                  clapack-3.2.1 | NOK | http://autobuild.buildroot.net/results/f5880b6bc1f913ededc3a7b15d8020214be07ac9/

musl problem.

>          arm |               drbd-utils-8.9.1 | NOK | http://autobuild.buildroot.net/results/6290a3a098fd466a172750ec4cad04fe32efd3e8/

Most likely a musl problem.

>          arm |              ebtables-2.0.10-4 | NOK | http://autobuild.buildroot.net/results/3b107a258c838809669b56d4e10c97eb9cd0489d/

musl problem.

>       x86_64 |                 elfutils-0.161 | NOK | http://autobuild.buildroot.net/results/7432ccd0d060a70bc35f0ac21ec92ae0071592ae/

musl problem.

>          arm |                  empty-0.6.19b | NOK | http://autobuild.buildroot.net/results/3660448bea4b1ca33ae2a559372efb5f35c39f70/

Some patches are pending for that, I need to review them.

>       x86_64 |              expect-2014-05-02 | NOK | http://autobuild.buildroot.net/results/b726941f881bbab96b7d22bb561d0e731291ebe3/

Download problem.

>         i686 | filemq-482797b8aa30fcc9ea13... | NOK | http://autobuild.buildroot.net/results/e0907c5453dfb1df546c07869faf00ec51b49181/

Should be fixed by the series from Yann. I'll test the series and push.

>          arm |                  gnupg2-2.0.28 | NOK | http://autobuild.buildroot.net/results/58114510c73c9bfe1d40108c94e198c278ff6895/

musl problem.

>          arm |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/1bf73dd4c28d6607e8c24d3abf259b8032712a02/

Fixed by:

	http://git.buildroot.net/buildroot/commit/?id=49593aba5a56c9c297c31c12fc4dc3de5679e7b1

>        sparc |                  haveged-1.9.1 | NOK | http://autobuild.buildroot.net/results/5b8bbc30f347140309ab2f81e1fe50f517356a3e/

SPARC problem.

>      aarch64 |        host-erlang-rebar-2.5.1 | TIM | http://autobuild.buildroot.net/results/268563098bd1cb91734607a00657194f8c35cf55/

The usual host-erlang-rebar timeout.

>      powerpc |            libcec-libcec-3.0.1 | NOK | http://autobuild.buildroot.net/results/747a42509cdba11f4a707b092f7f5d0ad231f044/
>         bfin |            libcec-libcec-3.0.1 | NOK | http://autobuild.buildroot.net/results/e8e64841c15a5e81b01030192849673891203b50/

Fixed by:

	http://git.buildroot.net/buildroot/commit/?id=712bb469da4966fa03a251f3fe8bdc18a89569ed

>      aarch64 |                  libepoxy-v1.2 | NOK | http://autobuild.buildroot.net/results/212333c85b320b6f4b88e14a3643992b6936dce7/

I guess it could be fixed by http://patchwork.ozlabs.org/patch/502831/,
but I asked the patch to be split, since it combines a version bump and
a fix.

>      aarch64 |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/bcfbba81206de987c6a344f77e2088b9203e96e0/

Compiler problem:

	internal compiler error: in simplify_const_unary_operation, at simplify-rtx.c:1539

This is with the Linaro AArch64 toolchain, with -g enabled.

Will, are you aware of this issue?

>      powerpc |                libgtk3-3.14.13 | NOK | http://autobuild.buildroot.net/results/8d8d5246e1d61deb8efd08fda16e6009c3bf4010/

gdkwindow-wayland.c:50:34: error: redefinition of typedef 'GdkWaylandWindow'
../../gdk/wayland/gdkwaylandwindow.h:32:34: note: previous declaration of 'GdkWaylandWindow' was here
gdkwindow-wayland.c:51:39: error: redefinition of typedef 'GdkWaylandWindowClass'
../../gdk/wayland/gdkwaylandwindow.h:36:39: note: previous declaration of 'GdkWaylandWindowClass' was here
make[6]: *** [gdkwindow-wayland.lo] Error 1

Gustavo, can you have a look?

>          arm |                 libmbim-1.12.2 | NOK | http://autobuild.buildroot.net/results/9eeb35943e61fc710e88b8c05bbd499b978cf137/
>          arm |                 libmbim-1.12.2 | NOK | http://autobuild.buildroot.net/results/6be054a7df117bd3ce2788cc6ba0b9eac0f0a63b/

gudev missing.

>          arm |                  libpfm4-4.3.0 | NOK | http://autobuild.buildroot.net/results/efae782912face7c36417dfb1023228d6b137654/

Fixed by:

	http://git.buildroot.net/buildroot/commit/?id=305beebb74c75744fccb25963f9e35511b7804a2

>          arc |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/4155a17490e9edde97696a8ae6ed173ed4040148/
>          arc |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/1cc61e4f80cc69bcbaebc2d73447cd81303c7887/
>          arc |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/3728a5facc3f602f3f4affc14708f7a8ea729d05/
>          arc |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/b9d56fd2d52256d6b2164737aaee0914590d3d29/
>          arc |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/2575441fca57532d0fdfe704651b6dc9554b971d/
>          arc |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/16d37a155c6aec8d1c837ff164b12dc7c297b8a6/

ARC toolchain issue. Alexey, do you think we will have a solution for
2015.08, or should we mark libselinux as not available on ARC for the
moment?

>          sh4 |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/2128a3507e57e707ee5c726f1ccfddadb7b19112/
>          sh4 |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/b630e947f4d274b96e91455c2b8857e21af4627d/

Fixed by:

	http://git.buildroot.net/buildroot/commit/?id=38454e10589993e5c7877f2fd904ba07f5865357

>          arm |               lirc-tools-0.9.2 | NOK | http://autobuild.buildroot.net/results/87cf6312bef189e4f3a49983bfc662d69afa05b4/

Fixed by:

	http://git.buildroot.net/buildroot/commit/?id=b6289cb1db9a75dfe317b4d84fb246e4cfa8d4b9

>       x86_64 |                  lrzsz-0.12.20 | NOK | http://autobuild.buildroot.net/results/8106ab057f538d1408d736736fdbe50b99ae709d/

Fixed by:

	http://git.buildroot.net/buildroot/commit/?id=74e99ce3191b3b3f6a873c6673e582435cbb81ba

>          arm |  make[1]: *** [all] Terminated | TIM | http://autobuild.buildroot.net/results/0bca48cd3dda1cd9bf00996510e59d403d52b607/

host-erlang-rebar issue.

>         i686 |                  mesa3d-10.6.3 | NOK | http://autobuild.buildroot.net/results/367fec01a99ae5df6e2d2599fdcbde9860d4d3f9/

checking for LIBUDEV... no
configure: error: gbm requires --enable-dri
make: *** [/home/test/autobuild/instance-0/output/build/mesa3d-10.6.3/.stamp_configured] Error 1
make: Leaving directory `/home/test/autobuild/instance-0/buildroot'

There's a patch fixing that.

>        sparc |                     ofono-1.16 | NOK | http://autobuild.buildroot.net/results/1514b777a78ba51c9f60e0586edf96cce14829da/
>        sparc |               postgresql-9.4.4 | NOK | http://autobuild.buildroot.net/results/f374d3535cf91f139ce80703cd2d0a2be5d3b2b1/

SPARC issues.

>          arm |                protobuf-v2.5.0 | NOK | http://autobuild.buildroot.net/results/c2bf9c3b0e29ac7affc06b9f2ebb19efeb555d9d/

When testing for the thread library, it tries if "-shared -lpthread"
works, which obviously doesn't work in static linking environment. So I
believe the best solution is to simply make protobuf unavailable in
static linking scenarios.

>        sparc |                    systemd-221 | NOK | http://autobuild.buildroot.net/results/cf868dd1895dad04a32b1d3d8c4aa33817b2b150/

SPARC/atomic issue.

>       mipsel |                     vpnc-0.5.3 | NOK | http://autobuild.buildroot.net/results/b32846904431d4e56fb21f2b7645e8c6f90787ff/

Missing link against libintl.

>      aarch64 | x264-c8a773ebfca148ef04f5a6... | NOK | http://autobuild.buildroot.net/results/d8383d7e59394ac4f4c3880f818b668e3829d8b4/

Weird compilation problem. Gustavo, Bernd maybe?

>       xtensa |     xserver_xorg-server-1.17.2 | NOK | http://autobuild.buildroot.net/results/d47b9715dcffddd64cce93d3944b93f33fe80e0d/

The DRI issue.

>          arc |                   zeromq-4.1.2 | NOK | http://autobuild.buildroot.net/results/394d29dc19cec31f3b835d39cba7e981d0d1e7b9/

libsodium.so: undefined reference to `explicit_bzero'

Alexey, it seems to happen only on ARC. Can you comment?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
