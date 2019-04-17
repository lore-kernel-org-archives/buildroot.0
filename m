From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Wed, 17 Apr 2019 11:28:26 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2019-04-15
In-Reply-To: <20190416223115.1c314a13@windsurf>
References: <20190416060047.6838786EF6@hemlock.osuosl.org>
 <e6975dfa-1a60-c394-de64-2e11243181d2@micronovasrl.com>
 <20190416134438.246c63cf@windsurf>
 <f6c8d29f-eb44-6b16-a94b-a09186c47c2b@micronovasrl.com>
 <20190416223115.1c314a13@windsurf>
Message-ID: <7a114046-e2b0-3a59-16f4-cc7e51fbe805@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

Il 16/04/2019 22:31, Thomas Petazzoni ha scritto:
> Hello,
> 
> On Tue, 16 Apr 2019 17:18:54 +0200
> Giulio Benetti <giulio.benetti@micronovasrl.com> wrote:
> 
>> So, if I don't understand wrong, when BR2_SYSTEM_ENABLE_NLS is disabled
>> we want all packages not to produce translation files.
> 
> Ideally yes.
> 
>> Then if a package tries anyway to produce translation files we need to
>> fix it by checking BR2_SYSTEM_ENABLE_NLS(depends on
>> !BR2_SYSTEM_ENABLE_NLS etc.) in its Config.in file.
> 
> I guess you wanted to say "if a package tries anyway to produce
> translation files, we need to fix it by adding a depends on
> BR2_SYSTEM_ENABLE_NLS". If that's what you meant, then I believe the
> answer is no.
> 
> gettext-tiny provides some dummy implementation of the gettext tools,
> so we can use these if a package really wants to generate translation
> files despite BR2_SYSTEM_ENABLE_NLS being disabled. However, if there's
> a reasonable way to tell the package to not generate translation files,
> I'd say we should prefer that.

Thank you for the explanation.
I've rechecked the patch:
https://patchwork.ozlabs.org/patch/1074926/

and now it's all clear.

Thanks again
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

> Thomas
> 
