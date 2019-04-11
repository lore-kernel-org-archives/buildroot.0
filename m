From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Thu, 11 Apr 2019 08:46:52 +0200
Subject: [Buildroot] [PATCH] package/android-tools: host-android-tools
 need pkg-conf
In-Reply-To: <20190411082528.3152fca9@windsurf.home>
References: <20190409131754.24516-1-giulio.benetti@micronovasrl.com>
 <20190411082218.2503be2d@windsurf.home>
 <20190411082528.3152fca9@windsurf.home>
Message-ID: <2b9c43a0-e095-dae0-1d3a-3b80d02d0773@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

Il 11/04/2019 08:25, Thomas Petazzoni ha scritto:
> On Thu, 11 Apr 2019 08:22:18 +0200
> Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:
> 
>> We don't typically re-use the target dependencies variable for the host
>> dependencies. So I changed this to = host-pkgconf and applied.
> 
> An illustration of why re-using $(ANDROID_TOOLS_DEPENDENCIES) doesn't
> do what you think it does:
> 
> $ cat foo.mk
> FOO_DEPENDENCIES = host-pkgconf
> HOST_FOO_DEPENDENCIES = $(FOO_DEPENDENCIES)
> 
> FOO_DEPENDENCIES += zlib
> HOST_FOO_DEPENDENCIES += host-zlib
> 
> all:
> 	@echo $(FOO_DEPENDENCIES)
> 	@echo $(HOST_FOO_DEPENDENCIES)
> $ make -f foo.mk
> host-pkgconf zlib
> host-pkgconf zlib host-zlib
> 
> See how HOST_FOO_DEPENDENCIES contains "zlib" ?
> 
> = assignments are evaluated at the time of use, not at the time of
> assignment (contrary to := assignments).

Aah, this is why, '=' vs ':='.
Thank you for the explanation.

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
