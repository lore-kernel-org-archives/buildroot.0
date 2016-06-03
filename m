From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Jun 2016 19:52:53 +0200
Subject: [Buildroot] [PATCH v2 2/2] qt5connectivity: add bluez5_utils
 option for QtBluetooth submodule
In-Reply-To: <1461066234-21504-2-git-send-email-corjon.j@ecagroup.com>
References: <1459763762-31640-2-git-send-email-corjon.j@ecagroup.com>
 <1461066234-21504-1-git-send-email-corjon.j@ecagroup.com>
 <1461066234-21504-2-git-send-email-corjon.j@ecagroup.com>
Message-ID: <20160603195253.2bd6177b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 19 Apr 2016 13:43:54 +0200, Julien Corjon wrote:
>  ifeq ($(BR2_PACKAGE_QT5DECLARATIVE_QUICK),y)
> -ifeq ($(BR2_PACKAGE_BLUEZ_UTILS),y)
> +ifneq (,$(filter y,$(BR2_PACKAGE_BLUEZ_UTILS) $(BR2_PACKAGE_BLUEZ5_UTILS)))

I've changed that to:

ifneq ($(BR2_PACKAGE_BLUEZ_UTILS)$(BR2_PACKAGE_BLUEZ5_UTILS),)

which I believe is simpler.

And then I've applied.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
