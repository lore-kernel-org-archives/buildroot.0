From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Date: Mon, 20 Apr 2020 11:52:42 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Your daily results for
 2020-04-17
Message-ID: <0ed57aae-eade-1cce-b5c7-1cdfa19bb09c@trabucayre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear all,

On 18/04/2020 08:21, Thomas Petazzoni wrote:
> Hello,
> 
> Recent build failures and runtime-tests failures
> ================================================
> 
> This is the list of Buildroot build failures that occurred on
> 2020-04-17, and for which you are a registered architecture developer,
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
>      arch     |             reason             |                                       url
> -------------+--------------------------------+---------------------------------------------------------------------------------
[...]
>      arc      |        gr-osmosdr-0.2.0        | http://autobuild.buildroot.net/results/124fc9515440e6a3399387345d501283c5526dd5
>    riscv64    |        gr-osmosdr-0.2.0        | http://autobuild.buildroot.net/results/721eb4da402a85155c6bb4a334ed344c9fc34593
>      arm      |        gr-osmosdr-0.2.0        | http://autobuild.buildroot.net/results/91820e11fb987ad5800145d79a5e784e0ae11fb9
>      arm      |        gr-osmosdr-0.2.0        | http://autobuild.buildroot.net/results/9aa895562b6bd962ddf013d2ace30516c0f2faea
>     mipsel    |        gr-osmosdr-0.2.0        | http://autobuild.buildroot.net/results/a00a5f078da3b15e9769edd1b0ed48453bd63473
>     xtensa    |        gr-osmosdr-0.2.0        | http://autobuild.buildroot.net/results/b87b184a870ed664d7d3d0186f22c91cabb10556
>      arm      |        gr-osmosdr-0.2.0        | http://autobuild.buildroot.net/results/fcec6cae0c381aec07ab6e798856c4445b7e1b0b
>      mips     |        gr-osmosdr-0.2.0        | http://autobuild.buildroot.net/results/ea9a7dfd30395812bb48ef66e7b9c4174a425d10
[...]

I've done some cross test to fix these issue:
- without cmake in the host, cmake(3.15) is provided by buildroot: OK
- with cmake < 3.10, same: OK
- with cmake 3.13: KO
- with cmake 3.16: OK

I suspect a problem in FindBoost.cmake for cmake version < 3.13 (3.14)

What is the best way? Doing a workaround in gr-osmosdr or changing 
BR2_CMAKE_VERSION_MIN for 3.14 in
support/dependencies/check-host-cmake.mk

I suppose if this issue impact gr-osmosdr, some others packages may have 
the same problem.

Thank you
Gwen
