From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Tue, 28 May 2019 00:19:46 +0200
Subject: [Buildroot] [PATCH v2 1/4] package/brotli: work aroung gcc bug
 68485
In-Reply-To: <55387552-88a0-ffab-ca89-f93cf3694dd5@micronovasrl.com>
References: <2e2b06bc-ee6a-7d38-5c14-a79dd51685dd@micronovasrl.com>
 <20190527213826.114001-1-giulio.benetti@micronovasrl.com>
 <20190527213826.114001-2-giulio.benetti@micronovasrl.com>
 <55b75809-666e-299a-50b2-2916651f65cc@mind.be>
 <55387552-88a0-ffab-ca89-f93cf3694dd5@micronovasrl.com>
Message-ID: <2d736d8f-10a5-5a9d-1e4b-b30ebe4a508e@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,

Il 28/05/2019 00:17, Giulio Benetti ha scritto:
> Il 28/05/2019 00:11, Arnout Vandecappelle ha scritto:
>>
>>
>> On 27/05/2019 23:38, Giulio Benetti wrote:
>>> With Microblaze Gcc version <= 9.x the build fails due to gcc bug 68485:
>>> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=68485. The bug show up when
>>> building brotli with optimization but not when building with -O0. To
>>> work aroung this, if BR2_TOOLCHAIN_HAS_GCC_BUG_68458=y, we force using
>>> -O0.
>>>
>>> Fixes:
>>>
>>>     http://autobuild.buildroot.net/results/d86/d86251974a0a348a64d9a1d1fd7d02dd4aff0792/
>>>
>>> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
>>
>>    Applied to master, thanks.
>>
>>    The rest of the series should go to next, actually. In fact, I should also have
>> applied flare-engine to next :-(

Need also this patch, otherwise build is broken:
https://patchwork.ozlabs.org/patch/1105947/

I've forgot to resend it!

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
