From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Sat, 15 Sep 2018 15:17:44 +0200
Subject: [Buildroot] [PATCH] gpm: fix major() build failure due to glibc
 2.28
In-Reply-To: <20180915125856.82310-1-giulio.benetti@micronovasrl.com>
References: <20180915125856.82310-1-giulio.benetti@micronovasrl.com>
Message-ID: <940fe387-84f1-632a-0c24-6ca507f7e593@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Il 15/09/2018 14:58, Giulio Benetti ha scritto:
> glibc 2.28 no longer includes <sys/sysmacros.h> from <sys/types.h>,
> and therefore <sys/sysmacros.h> must be included explicitly when major()
> is used.
> 
> This commit adds a patch to directly include <sys/sysmacros.h> into
> open_console.c file where major() macro is used.

An upstream commit already exists.
I'm going to submit v2 with that.

Sorry

Best regards
-- 
Giulio Benetti
CTO

MICRONOVA SRL
Sede: Via A. Niedda 3 - 35010 Vigonza (PD)
Tel. 049/8931563 - Fax 049/8931346
Cod.Fiscale - P.IVA 02663420285
Capitale Sociale ? 26.000 i.v.
Iscritta al Reg. Imprese di Padova N. 02663420285
Numero R.E.A. 258642
