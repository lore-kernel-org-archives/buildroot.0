From: D. Olsson <hi@senzilla.io>
Date: Sat, 05 Jun 2021 16:50:46 +0000
Subject: [Buildroot] [PATCHv4 02/16] core: enable 'NDEBUG' unless
 BR2_ENABLE_RUNTIME_DEBUG is set
In-Reply-To: <20210601203619.GD168928@scaer>
References: <20210601143422.25064-1-patrickdepinguin@gmail.com>
 <20210601143422.25064-3-patrickdepinguin@gmail.com>
 <20210601203619.GD168928@scaer>
Message-ID: <l4_Jp34pzaOlU4ZSREEHzPf9FzyRhw2n04eN-1Ew-olRuMHp0bGtAM8NTbPZm98yyYuqcbmTROjzfQqHEvggWQ_1Ja8oNE-gU38NVtPBLvQ=@senzilla.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, Yann, all,

> On 2021-06-01 16:34 +0200, Thomas De Schampheleire spake thusly:
> +ifeq ($(BR2_ENABLE_RUNTIME_DEBUG),)
> +TARGET_DEBUGGING += -DNDEBUG

This broke bitcoin builds. I haven't looked deeply into the
details, but it is my understanding that NDEBUG changes the
behaviour of assert() in a way that Bitcoin explicitly does
not support.

See: https://github.com/bitcoin/bitcoin/blob/707ba8692b0013f4824dc3c2ea6554ccad5d20c2/src/compat/assumptions.h#L13

I don't know if there is a workaround for this, but I have a
feeling that passing NDEBUG for all packages might not be a
good idea?


---
D. Olsson
PGP: 8204A8CD
