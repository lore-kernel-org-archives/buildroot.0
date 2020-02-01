From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 1 Feb 2020 17:15:52 +0100
Subject: [Buildroot] [PATCH 1/1] package/kodi: use github helper for
 KODI_EXTRA_DOWNLOADS
In-Reply-To: <20200201141459.1762745-1-bernd.kuhls@t-online.de>
References: <20200201141459.1762745-1-bernd.kuhls@t-online.de>
Message-ID: <20200201171552.3f3e6bff@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat,  1 Feb 2020 15:14:59 +0100
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/kodi/kodi.hash | 12 ++++--------
>  package/kodi/kodi.mk   | 29 ++++++++++++-----------------
>  2 files changed, 16 insertions(+), 25 deletions(-)
> 
> diff --git a/package/kodi/kodi.hash b/package/kodi/kodi.hash
> index cc248e537e..578befec1b 100644
> --- a/package/kodi/kodi.hash
> +++ b/package/kodi/kodi.hash
> @@ -1,11 +1,7 @@
>  # Locally computed
>  sha256 108979df8b41ab4168f5cdc0233f46e38767eda5921f4ccae16584e98d0d6b29  kodi-18.5-Leia.tar.gz
> +sha256 e11e7594af35f36ab2711252c3d6bb106908f26605498aef4a9be2d7bc001db2  kodi-ffmpeg-4.0.4-Leia-18.4.tar.gz
> +sha256 38816f8373e243bc5950449b4f3b18938c4e1c59348e3411e23f31db4072e40d  kodi-libdvdcss-1.4.2-Leia-Beta-5.tar.gz
> +sha256 071e414e61b795f2ff9015b21a85fc009dde967f27780d23092643916538a57a  kodi-libdvdnav-6.0.0-Leia-Alpha-3.tar.gz
> +sha256 a30b6aa0aad0f2c505bc77948af2d5531a80b6e68112addb4c123fca24d5d3bf  kodi-libdvdread-6.0.0-Leia-Alpha-3.tar.gz
>  sha256 9d2396ef3e091d3b82bc84143e070700412984e8589513570f54e0675d1e8851  LICENSE.md
> -# Locally computed - ffmpeg
> -sha256 e11e7594af35f36ab2711252c3d6bb106908f26605498aef4a9be2d7bc001db2  4.0.4-Leia-18.4.tar.gz

Hum, if I'm correct, removing this hash is not related to the change in
this commit.

Also, it would be good to have a better commit log, to explain why you
do this change. I assume it mainly gives nicer file names in
$(KODI_DL_DIR), and that's of course a good point.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
