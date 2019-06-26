From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Wed, 26 Jun 2019 16:06:32 +0200
Subject: [Buildroot] [PATCH 1/4] package/qt5/qt5base: disable predefined
 -Og optimization
In-Reply-To: <20190622205401.5d2b4c25@windsurf>
References: <20190618084535.75870-1-giulio.benetti@micronovasrl.com>
 <20190618084535.75870-2-giulio.benetti@micronovasrl.com>
 <20190622205401.5d2b4c25@windsurf>
Message-ID: <26bac2f5-2052-3813-e870-c70d468909e4@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

Il 22/06/2019 20:54, Thomas Petazzoni ha scritto:
> On Tue, 18 Jun 2019 10:45:32 +0200
> Giulio Benetti <giulio.benetti@micronovasrl.com> wrote:
> 
>> Starting from Qt5 5.9.0 -optimize-debug is enabled by default causing
>> -Og flag to be appended to CFLAGS and consequently override
>> TARGET_CFLAGS. We don't want this so let's pass -no-optimize-debug to
>> QT5BASE_CONFIGURE_OPTS if QT5_VERSION_LATEST=y.
>>
>> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
> 
> In fact, optimize-debug is only enabled for debug builds, so I adjusted
> the commit log and comment and applied. It would be good to check if
> optimize-size is automatically enabled (or not) for release builds, and
> see if we should -no-optimize-size as well.

Fortunately you've pointed me this, in fact qt5 in release mode doesn't 
build according to TARGET_OPTIMIZATION.
I've just sent a patch for that:
https://patchwork.ozlabs.org/patch/1122817/

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
