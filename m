From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 11 Mar 2015 21:47:42 +0100
Subject: [Buildroot] [PATCH 1/1] package/softether: Fix iconv-related
 compile error
In-Reply-To: <1426105728-7827-1-git-send-email-bernd.kuhls@t-online.de>
References: <1426105728-7827-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150311214742.21ce3993@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Wed, 11 Mar 2015 21:28:48 +0100, Bernd Kuhls wrote:

> -ifeq ($(BR2_ENABLE_LOCALE),)
> +ifneq ($(BR2_ENABLE_LOCALE)$(BR2_PACKAGE_LIBICONV),)

Just make this:

ifeq ($(BR2_PACKAGE_LIBICONV),y)

the softether Config.in file has:

	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE

so if there's no locale support, we're sure libiconv is selected in the
configuration.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
