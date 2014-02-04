From: Samuel Martin <s.martin49@gmail.com>
Date: Tue, 4 Feb 2014 09:47:00 +0100
Subject: [Buildroot] [PATCH v6 3/5] udev: convert to virtual package.
In-Reply-To: <1389627907-7821-4-git-send-email-eric.le.bihan.dev@free.fr>
References: <1389627907-7821-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1389627907-7821-4-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <CAHXCMML7wqY_wJxKj=8xwiOb=KMPTFV2eqWnJBJuPozEG73-pA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Eric,


On Mon, Jan 13, 2014 at 4:45 PM, Eric Le Bihan <eric.le.bihan.dev@free.fr>wrote:

> This patch converts udev to a virtual package. For the moment, there is
> only
> one provider for the udev features: eudev.
>
> Packages meant to provide udev-like features must select the symbol
> BR2_PACKAGE_HAS_UDEV.
>
> Packages depending on BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV or
> BR2_PACKAGE_UDEV have been converted to use the new symbol.
>
> Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> ---
>  Config.in.legacy                                   |    8 ++++
>  docs/manual/adding-packages-directory.txt          |    3 +-
>  package/ccid/ccid.mk                               |    2 +-
>  package/eudev/Config.in                            |    1 +
>  package/gpsd/gpsd.mk                               |    2 +-
>  package/libatasmart/Config.in                      |    4 +-
>  package/libcec/libcec.mk                           |    2 +-
>  package/libdrm/libdrm.mk                           |    2 +-
>  package/libmbim/Config.in                          |    5 +-
>  package/modem-manager/Config.in                    |    6 +--
>  package/network-manager/Config.in                  |    8 ++--
>  package/ofono/ofono.mk                             |    2 +-
>  package/pcsc-lite/Config.in                        |    2 +-
>  package/pcsc-lite/pcsc-lite.mk                     |    2 +-
>  package/pulseaudio/pulseaudio.mk                   |    2 +-
>  package/systemd/Config.in                          |    6 +--
>  package/udev/Config.in                             |   49
> +-------------------
>  package/udev/udev.mk                               |   49
> ++++----------------
>  package/udisks/Config.in                           |    8 ++--
>  package/usbmount/Config.in                         |    4 +-
>  package/weston/Config.in                           |    4 +-
>  package/x11r7/xdriver_xf86-input-evdev/Config.in   |    4 +-
>  .../xserver_xorg-server/xserver_xorg-server.mk     |    2 +-
>  package/xenomai/xenomai.mk                         |    2 +-
>  system/Config.in                                   |   22 ++-------
>  25 files changed, 55 insertions(+), 146 deletions(-)
>

Due to recent patches merged in Buildroot, a couple of fixes (just symbols
updates,
no big deal) are needed after rebasing on top of Buildroot master,
especially in libusb and vlc.
Care to rebase and integrate these fixes in your next submission ;)

BTW, the review and tests Thomas and I did were done on the v7 branch from
your repository.

Regards,

-- 
Samuel
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140204/13676dac/attachment.html>
