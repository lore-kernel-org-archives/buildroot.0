From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 14 Feb 2015 16:35:32 +0100
Subject: [Buildroot] [PATCH 04/10] kconfig infra: remove all install
 stamp files
In-Reply-To: <d969027979b213270ff962a659a1d0ef0f3b40a7.1422972638.git.yann.morin.1998@free.fr>
References: <cover.1422972638.git.yann.morin.1998@free.fr>
 <d969027979b213270ff962a659a1d0ef0f3b40a7.1422972638.git.yann.morin.1998@free.fr>
Message-ID: <20150214163532.73131887@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Tue,  3 Feb 2015 15:21:44 +0100, Yann E. MORIN wrote:

>  	rm -f $$($(2)_DIR)/.stamp_{kconfig_fixup_done,configured,built}
> -	rm -f $$($(2)_DIR)/.stamp_{target,staging}_installed
> +	rm -f $$($(2)_DIR)/.stamp_{target,staging,images}_installed

Maybe this could reuse the $(1)-clean-for-reconfigure target in order
to avoid duplicating this code removing the stamp files, no?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
