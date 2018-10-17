From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Wed, 17 Oct 2018 14:39:02 +0200
Subject: [Buildroot] [PATCH v2] ffmpeg: fix static linking build failure
 when using libavutil
In-Reply-To: <20181017123718.22553-1-giulio.benetti@micronovasrl.com>
References: <2605f69d-abb2-f265-552c-18147119a509@micronovasrl.com>
 <20181017123718.22553-1-giulio.benetti@micronovasrl.com>
Message-ID: <70678949-7644-e4e6-93cd-15227cb4bb90@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Il 17/10/2018 14:37, Giulio Benetti ha scritto:
> If a package tries to static link with libavutil it fails due to the
> lack of libavutil private dependencies in libavutil.pc (-ldrm in this
> case).
> 
> Add patch to:
> - Check if libdrm is present.
> - Add it to Libs.private: in libavutil.pc if present.
> 
> Fixes:
> http://autobuild.buildroot.net/results/766/766de487f394490df8c712652ac364ebb4a3ab14/
> http://autobuild.buildroot.net/results/041/041e29dfddb2da3309ac7d34a576c60c5a75fe4d/
> http://autobuild.buildroot.net/results/780/78061b61cfe3f42554a475c048d54dacacfe11d5/
> http://autobuild.buildroot.net/results/275/275e4e0030d26c029085b408cfb272d5633969c6/
> http://autobuild.buildroot.net/results/515/5152dcca58944cf732d09fba6e6c9af8a9243c75/
> http://autobuild.buildroot.net/results/395/395be1a9cab824b82ef34c2ebd84d54243029b33/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
> ---

Forgotten the Changes field.
Sorry, I resend.

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
