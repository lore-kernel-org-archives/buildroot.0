From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Jun 2016 17:31:14 +0200
Subject: [Buildroot] [PATCH 1/1] efivar: force shared libgcc for Nios II
In-Reply-To: <20160628111817.1237-1-nunes.erico@gmail.com>
References: <20160628111817.1237-1-nunes.erico@gmail.com>
Message-ID: <20160628173114.216a3d58@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 28 Jun 2016 13:18:17 +0200, Erico Nunes wrote:

> -# Explicitly linking with shared libgcc is required on MicroBlaze,
> +# Explicitly linking with shared libgcc is required on MicroBlaze and Nios II,
>  # otherwise it fails due to FDE encoding in static libgcc.
> -ifeq ($(BR2_microblaze),y)
> +ifeq ($(filter y,$(BR2_microblaze) $(BR2_nios2)),y)

ifeq ($(BR2_microblaze)$(BR2_nios2),y)

is enough.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
