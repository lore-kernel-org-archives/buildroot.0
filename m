From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 9 Jun 2014 19:58:50 +0200
Subject: [Buildroot] [PATCH 1/1] package/tvheadend: Add optional
 dependency to libiconv
In-Reply-To: <1402313033-31085-1-git-send-email-bernd.kuhls@t-online.de>
References: <1402313033-31085-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20140609195850.2317401f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Mon,  9 Jun 2014 13:23:53 +0200, Bernd Kuhls wrote:

> BR2_TOOLCHAIN_BUILDROOT_LARGEFILE=y
> BR2_TOOLCHAIN_BUILDROOT_INET_IPV6=y
> BR2_PACKAGE_LIBICONV=y
> BR2_PACKAGE_TVHEADEND=y

You need libiconv because your toolchain does not have locale support.
Therefore, your Config.in should have something like:

	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE

see all the other examples in Buildroot.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
