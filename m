From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Aug 2014 13:08:02 +0200
Subject: [Buildroot] [PATCH v5] bluez5_utils: new package
In-Reply-To: <1396256280-23284-1-git-send-email-marcin@bis.org.pl>
References: <532F69C8.5060202@trzebnica.net>
 <1396256280-23284-1-git-send-email-marcin@bis.org.pl>
Message-ID: <20140802130802.26bd0121@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Marcin Bis,

On Mon, 31 Mar 2014 10:58:00 +0200, Marcin Bis wrote:
> This patch adds Bluez 5.x.
> API is not backwards compatible with BlueZ 4.x
> 
> BlueZ utils will use systemd and/or udev if enabled.
> Contains a hook for installing GATT support tool, wchich is always
> build but not installed by default.
> 
> Signed-off-by: Marcin Bis <marcin@bis.org.pl>
> ---
>  package/Config.in                    |    1 +
>  package/bluez5_utils/Config.in       |   54 ++++++++++++++++++++++++++++++++++
>  package/bluez5_utils/bluez5_utils.mk |   54 ++++++++++++++++++++++++++++++++++
>  3 files changed, 109 insertions(+)
>  create mode 100644 package/bluez5_utils/Config.in
>  create mode 100644 package/bluez5_utils/bluez5_utils.mk

I've applied your patch, after making a number of changes:

    [Thomas:
     - Add dependency on 3.4 kernel headers
     - Add options for OBEX support and client support, to make the
       libical and readline dependencies optional.
     - Rewrap Config.in help text.
     - Adapt indentation in .mk file.
     - Bump to version 5.21.
     - Use BR2_PACKAGE_HAS_UDEV instead of BR2_PACKAGE_UDEV.]

It would be great if you could test the latest master and confirm that
it works for you.

Thanks a lot for this contribution!

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
