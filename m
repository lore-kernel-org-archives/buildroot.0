From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Fri, 6 Sep 2019 15:26:55 -0500
Subject: [Buildroot] [autobuild.buildroot.net] Your daily results for
 2019-09-05
In-Reply-To: <20190906061723.E1CF920072@dtulimr02.rockwellcollins.com>
References: <20190906061723.E1CF920072@dtulimr02.rockwellcollins.com>
Message-ID: <CANQCQpZT6mxyTbK9GFL+uytPVFoSDOjDgw=Fgr1tY4ZGmEt8ew@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Sep 6, 2019 at 1:17 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello,
>
> Recent build failures and runtime-tests failures
> ================================================
>
> This is the list of Buildroot build failures that occurred on
> 2019-09-05, and for which you are a registered architecture developer,
> package developer or defconfig developer. This list also include
> runtime tests failures. Please help us improving the quality of
> Buildroot by investigating those build failures and sending patches to
> fix them. Thanks!
>
> Results for the 'master' branch
> -------------------------------
>
> Build failures related to your packages:
>
>     arch     |             reason             |                                       url
> -------------+--------------------------------+---------------------------------------------------------------------------------
>    x86_64    |          gnutls-3.6.9          | http://autobuild.buildroot.net/results/2f6021200037e84666355bd66329f77b281bfec2
>    xtensa    |        iputils-20190709        | http://autobuild.buildroot.net/results/50b4d40197bae929f25a4a8a971f50ce315424f9
>     arm      |      uboot-tools-2019.07       | http://autobuild.buildroot.net/results/f77aa808ea632cc472dac7169b6cd5088871dbd2
>   aarch64    |       wpa_supplicant-2.9       | http://autobuild.buildroot.net/results/c93c1f78429d022fd0f7b6db91eb860cc3d4d95b
>   sparc64    |       wpa_supplicant-2.9       | http://autobuild.buildroot.net/results/3dd72a4791002b03028272cd295bb5e03499fed4
>   aarch64    |       wpa_supplicant-2.9       | http://autobuild.buildroot.net/results/561b473a4bb25840940fdaf42ca42dd8c8adb3fd
>   aarch64    |       wpa_supplicant-2.9       | http://autobuild.buildroot.net/results/d0e5ad004518f1aa2d55fd3e26a0c2a91e7314fc
>     i686     |       wpa_supplicant-2.9       | http://autobuild.buildroot.net/results/27ec30ef71b62bad15decf90d57c891b72dde169
>     arm      |       wpa_supplicant-2.9       | http://autobuild.buildroot.net/results/f55dd73e26c508d9422e265c281d4491de378d98
>     arc      |       wpa_supplicant-2.9       | http://autobuild.buildroot.net/results/4a4ffce461fb38f3ac81c8c0e0002c0c15dfe0c1
>     sh4      |       wpa_supplicant-2.9       | http://autobuild.buildroot.net/results/89e47eacf10d1011c3ee092287cb4055f26adf56
>     arm      |       wpa_supplicant-2.9       | http://autobuild.buildroot.net/results/ed43f2459cf9c073305e061d197cf1c5379b933f
>  powerpc64   |       wpa_supplicant-2.9       | http://autobuild.buildroot.net/results/2066570f84c8a3e30bed6def0e29b5195de3649d
>   riscv32    |       wpa_supplicant-2.9       | http://autobuild.buildroot.net/results/da2f5842e0f7e6f69ac983891c858096cdb1d331

These wpa_supplicant failures are related to a configuration option
mismatch where new features were added in some hostapd common files
(hostapd.c and ieee802_11_vht.c) and the wpa_supplicant build which
reaches into that source to build the service, can't find the objects
it would like to use at link time.  I've successfully built after
enabling the  "nl80211 support and AP mode" in the Buildroot
menuconfig options.  I'll have to dig a bit further to see if it is as
easy as adding the src/ap/dfs.o and src/ap/ieee802_11.o to the right
spot in wpa_supplicant/Makefile.  Maybe the non AP mode isn't
supported......

Matt
