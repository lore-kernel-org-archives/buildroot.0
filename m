From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Fri, 24 Aug 2018 23:28:05 +0200
Subject: [Buildroot] [PATCH v2 2/2] sunxi-mali-mainline-driver: bump
 version and add support for building on arm64(aarch64).
In-Reply-To: <20180824211404.GR9365@scaer>
References: <20180822000648.23314-1-giulio.benetti@micronovasrl.com>
 <20180822000648.23314-3-giulio.benetti@micronovasrl.com>
 <20180822132959.39640475@windsurf>
 <58c7d88b-dc45-5426-a328-89a58dc005b2@micronovasrl.com>
 <20180822212633.0a8a625e@windsurf>
 <ac85c090-d43d-8415-5333-f8daf24e70a1@micronovasrl.com>
 <20180824211404.GR9365@scaer>
Message-ID: <8c7dfd8b-3e32-79c6-2d04-26435b710df4@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Il 24/08/2018 23:14, Yann E. MORIN ha scritto:
> Giulio, All,
> 
> On 2018-08-24 21:10 +0200, Giulio Benetti spake thusly:
> [--SNIP--]
>> I'm getting problems with whitespaces in pdf filename.
>> I couldn't find in Buildroot Documentation if it's allowed or not having
>> filenames containing spaces.
>> I've tried using:
>> 'EULA for Mali 400MP _AW.pdf'
>> "EULA for Mali 400MP _AW.pdf"
>> etc.
>> but with no luck.
> 
> Could you please also try with a \-escape:
> 
>      SUNXI_MALI_MAINLINE_LICENSE_FILES = EULA\ for\ Mali\ 400MP\ _AW.pdf
> 
> If that still fails, please try with two \\.
> 
> I would prefer if we were to be able to keep the original filenames in
> license files, in case something else in the package would reference
> them.
> 
>> If it's not possible to have whitespaces, should I workaround it in package
>> changing filename before legal-info recipe?
>> Like:
>> EULA for Mali 400MP _AW.pdf
>> becoming:
>> EULA_for_Mali_400MP_AW.pdf
>> ?
> 
> As Thomas already replied, yes. But I'd prefer if that were used as a
> last resort.

Just tried with both \ and \\ but nothing to do, it doesn't work.
It always tries to find 'EULA' or 'EULA\'

So do I proceed with renaming on POST_PATCH_HOOKS?

Thanks
Giulio
