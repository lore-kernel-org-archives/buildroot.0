From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Mon, 8 Apr 2019 09:43:53 +0200
Subject: [Buildroot] [PATCH] package/android-tools: fix static build
 failure due to missing -latomic
In-Reply-To: <20190408091820.2a7274a1@windsurf>
References: <20190404153904.69693-1-giulio.benetti@micronovasrl.com>
 <20190404224539.2d79cf30@windsurf>
 <699842f1-d9e3-dd02-4770-e8a10499194b@micronovasrl.com>
 <e6f8db91-43e0-fc56-d071-1804616b2d61@micronovasrl.com>
 <20190408091820.2a7274a1@windsurf>
Message-ID: <ae6a0d68-1cca-e9f5-9de1-7e2a56be2e7e@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Il 08/04/2019 09:18, Thomas Petazzoni ha scritto:
> Hello Giulio,
> 
> On Sun, 7 Apr 2019 23:55:38 +0200
> Giulio Benetti <giulio.benetti@micronovasrl.com> wrote:
> 
>>>> -LIBS+= -lc -lpthread -lz -lcrypto -lcrypt `pkg-config --libs glib-2.0 gio-2.0`
>>
>> In current version there is not glib-2.0 or gio-2.0, do I add them
>> anyway as follows?
> 
> Wow, I got confused about this. pkg-config is used for glib-2.0 and
> gio-2.0 in the upstream android-tools code, but we remove that in our
> 0002-Fix-adbd-for-non-Ubuntu-systems.patch patch.
> 
> So of course, don't re-add those pkg-config calls for glib-2.0 and gio-2.0.

Ok

> However, use pkg-config for OpenSSL. This will also allow you to drop
> patch 0005-fix-static-link-zlib.patch, which was needed for the same
> reason: pkg-config is not used to find OpenSSL.

Oh yes.
In this case, can I substitute "0005-fix-static-link-zlib.patch" with 
the new one I'm going to create? I mean "0005-...patch" ?

Thanks

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
