From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 12 Sep 2012 08:13:02 +0300
Subject: [Buildroot] [RFC] Add board support for Raspberry Pi device.
In-Reply-To: <1347402977-17837-1-git-send-email-marek.belisko@open-nandra.com>
References: <1347402977-17837-1-git-send-email-marek.belisko@open-nandra.com>
Message-ID: <20120912051301.GA15924@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Marek,

On Wed, Sep 12, 2012 at 12:36:17AM +0200, Marek Belisko wrote:
> Signed-off-by: Marek Belisko <marek.belisko@open-nandra.com>
> 
> Basic support:
> - boot binary blobs + VideoCore added in utils package (to avoid fetching 2 times
>   same repo which is quite big)
> - added post-build script to adjust password, add config, cmdline files
> - add actual kernel build 3.2.27 with cutdown config
> - using external toolchain
> - some parts was overtaken from commits from: https://github.com/nezticle/RaspberryPi-BuildRoot.git
> 
> ---
>  board/raspberrypi/config.txt                   |   41 ++
>  board/raspberrypi/linux-3.2.27_defconfig       |  546 ++++++++++++++++++++++++

Please use 'make savedefconfig' to generate the defconfig file. This makes it 
much smaller and easier to read.

>  board/raspberrypi/post-build.sh                |   23 +
>  configs/raspberrypi_defconfig                  |   19 +
>  package/Config.in                              |    1 +
>  package/raspberrypi-utils/Config.in            |   21 +
>  package/raspberrypi-utils/raspberrypi-utils.mk |   41 ++
>  7 files changed, 692 insertions(+)
>  create mode 100644 board/raspberrypi/config.txt
>  create mode 100644 board/raspberrypi/linux-3.2.27_defconfig
>  create mode 100755 board/raspberrypi/post-build.sh
>  create mode 100644 configs/raspberrypi_defconfig
>  create mode 100644 package/raspberrypi-utils/Config.in
>  create mode 100644 package/raspberrypi-utils/raspberrypi-utils.mk

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
