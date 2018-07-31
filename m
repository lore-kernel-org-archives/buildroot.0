From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 31 Jul 2018 22:57:20 +0200
Subject: [Buildroot] [PATCH v8 3/5] gstreamer1 packages: explicitly
 disable introspection
In-Reply-To: <20180729191921.11216-4-aduskett@gmail.com>
References: <20180729191921.11216-1-aduskett@gmail.com>
 <20180729191921.11216-4-aduskett@gmail.com>
Message-ID: <20180731225720.7c643b20@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 29 Jul 2018 15:19:19 -0400, Adam Duskett wrote:
> To get GStreamer ready for introspection, we must first explicitly
> disable gstreamer1, plugins base and plugins bad from using introspection.
> If not, adding the gobject-introspection will result in these packages
> failing to build because setting the _GIR_EXTRA_LIBS_PATH variable is required.
> 
> The other gstreamer1 packages do not require setting the _GIR_EXTRA_LIBS_PATH
> variable.
> 
> Signed-off-by: Adam Duskett <aduskett@gmail.com>
> ---
> Changes v1 -> v4:
>   - Add patch to series.
>   - Change TARGET_MAKE_ENV += GIR_EXTRA_LIBS_PATH to
>     PACKAGE_GIR_EXTRA_LIBS_PATH.

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
