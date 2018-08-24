From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 24 Aug 2018 21:58:14 +0200
Subject: [Buildroot] [PATCH v2 2/2] sunxi-mali-mainline-driver: bump
 version and add support for building on arm64(aarch64).
In-Reply-To: <ac85c090-d43d-8415-5333-f8daf24e70a1@micronovasrl.com>
References: <20180822000648.23314-1-giulio.benetti@micronovasrl.com>
 <20180822000648.23314-3-giulio.benetti@micronovasrl.com>
 <20180822132959.39640475@windsurf>
 <58c7d88b-dc45-5426-a328-89a58dc005b2@micronovasrl.com>
 <20180822212633.0a8a625e@windsurf>
 <ac85c090-d43d-8415-5333-f8daf24e70a1@micronovasrl.com>
Message-ID: <20180824215814.5366a812@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 24 Aug 2018 21:10:56 +0200, Giulio Benetti wrote:

> I'm getting problems with whitespaces in pdf filename.
> I couldn't find in Buildroot Documentation if it's allowed or not having 
> filenames containing spaces.
> I've tried using:
> 'EULA for Mali 400MP _AW.pdf'
> "EULA for Mali 400MP _AW.pdf"
> etc.
> but with no luck.
> 
> If it's not possible to have whitespaces, should I workaround it in 
> package changing filename before legal-info recipe?
> Like:
> EULA for Mali 400MP _AW.pdf
> becoming:
> EULA_for_Mali_400MP_AW.pdf
> ?

Yes, I think it makes sense to have a POST_PATCH_HOOKS that renames the
file so that it doesn't have spaces.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
