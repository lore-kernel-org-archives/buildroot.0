From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Jan 2017 14:26:33 +0100
Subject: [Buildroot] [PATCH 1/1] package/fbterm: Fix building against
 libiconv
In-Reply-To: <20170128174916.11214-1-bernd.kuhls@t-online.de>
References: <20170128174916.11214-1-bernd.kuhls@t-online.de>
Message-ID: <20170129142633.4ba3c0b4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 28 Jan 2017 18:49:16 +0100, Bernd Kuhls wrote:
> Fixes
> http://autobuild.buildroot.net/results/d5d/d5d9705eea16f07848a313d9c83f491569734c5d/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/fbterm/0004-iconv.patch | 41 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
>  create mode 100644 package/fbterm/0004-iconv.patch

Applied to master, thanks. However, this means that fbterm links
against libiconv when available, no? So perhaps we should have:

ifeq ($(BR2_PACKAGE_LIBICONV),y)
FBTERM_DEPENDENCIES += libiconv
endif

in fbterm.mk ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
