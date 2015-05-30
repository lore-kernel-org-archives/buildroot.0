From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 30 May 2015 23:04:44 +0200
Subject: [Buildroot] [PATCH 1/1] package/php: Disable jit in bundled
 pcre library
In-Reply-To: <1433017886-26362-1-git-send-email-bernd.kuhls@t-online.de>
References: <1433017886-26362-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150530230444.7000c5a1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sat, 30 May 2015 22:31:26 +0200, Bernd Kuhls wrote:

> +ifeq ($(BR2_arcle)$(BR2_bfin)$(BR2_microblazeel)$(BR2_nios2)$(BR2_sh)$(BR2_xtensa),y)

BR2_arc instead of BR2_arcle probably. Ditto for BR2_microblaze.

Generally, we prefer to use a list of the supported architectures
instead of the list of unsupported ones, so that if we add a new
architecture to Buildroot, we don't have to take care of exclude it in
gazillions of places.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
