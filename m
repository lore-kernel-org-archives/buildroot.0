From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Mar 2016 15:48:56 +0100
Subject: [Buildroot] [PATCH 06/16 v5] core/pkg-generic: add variable to
 store the package rawname-version
In-Reply-To: <4594d37230285f25d9925a47e0e4d752e492f14a.1457718289.git.yann.morin.1998@free.fr>
References: <cover.1457718289.git.yann.morin.1998@free.fr>
 <4594d37230285f25d9925a47e0e4d752e492f14a.1457718289.git.yann.morin.1998@free.fr>
Message-ID: <20160319154856.2830eabe@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Fri, 11 Mar 2016 18:49:19 +0100, Yann E. MORIN wrote:

>  $(2)_VERSION := $$(call sanitize,$$($(2)_DL_VERSION))
> +$(2)_RAWNAME_VERSION = $$($(2)_RAWNAME)-$$($(2)_VERSION)

Since we have:

$(2)_BASE_NAME  =  $(1)-$$($(2)_VERSION)

I would prefer this new variable to be declared right after this one,
and named $(2)_RAW_BASE_NAME or $(2)_RAWBASE_NAME.

Thanks

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
