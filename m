From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 1 May 2016 15:06:23 +0200
Subject: [Buildroot] [PATCH] toolchain-external: remove sourcery powerpc
 toolchains
In-Reply-To: <1461935936-9390-1-git-send-email-gustavo@zacarias.com.ar>
References: <1461935936-9390-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160501150623.5f119bcd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 29 Apr 2016 10:18:56 -0300, Gustavo Zacarias wrote:
> These are running long on the teeth - the bundled (e)glibc versions are
> very old with several security bugs, they don't work reliably with -Os
> and have several build failures related to internal compiler errors such
> as:
> 
> http://autobuild.buildroot.net/results/fe7/fe7bdba5faf199275aedea2918705b5d19d228bf/
> http://autobuild.buildroot.net/results/935/935ac42c30ed893939c06c077534f060aed80e9a/
> http://autobuild.buildroot.net/results/a47/a476af82c8fe4a279117314b278b08af9a08fe54/
> http://autobuild.buildroot.net/results/cae/cae720b5096be2672b4dc1311ae3fc4ed06a3b53/
> 
> The situation will not provide, and will in fact get worse with older kernel
> headers precluding modern package versions and the old gcc version doing as
> well so remove them.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/liquid-dsp/Config.in                       |  2 -
>  package/pixman/pixman.mk                           |  5 --
>  toolchain/toolchain-external/Config.in             | 54 ----------------------
>  .../toolchain-external/toolchain-external.hash     |  5 --
>  toolchain/toolchain-external/toolchain-external.mk |  6 ---
>  5 files changed, 72 deletions(-)

I've applied, after doing the following changes:

    [Thomas:
     - remove no longer needed comment in liquid-dsp Config.in file, as
       noticed by Romain Naour.
     - add Config.in.legacy options, as noticed by Romain Naour.]

Thanks Romain for the review of the patch!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
