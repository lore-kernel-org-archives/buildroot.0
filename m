From: Andrew Donnellan <andrew.donnellan@au1.ibm.com>
Date: Wed, 14 Feb 2018 14:56:56 +1100
Subject: [Buildroot] patchwork.ozlabs.org down, and e-mails not recorded
In-Reply-To: <20180213231930.26ab0efb@windsurf.lan>
References: <20180105214340.6f0cc1f7@windsurf>
 <ced2aeb2-82f6-c836-dd5a-e65c6b49c81a@au1.ibm.com>
 <20180108091044.1141f540@windsurf> <20180205224500.1a34e02a@windsurf>
 <981ecf77-767e-3c90-243f-67251d956c21@au1.ibm.com>
 <20180213231930.26ab0efb@windsurf.lan>
Message-ID: <16c3e28e-8da0-75f0-1f9a-c1ed86741fc3@au1.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 14/02/18 09:19, Thomas Petazzoni wrote:
> Patches 1/3 and 2/3 in this series have been recorded, but not Patch
> 3/3.
> 
> This is really getting annoying for the Buildroot project, and we may
> potentially "miss" contributions because of this: we entirely rely on
> patchwork as our TODO-list, so if a patch is missing in patchwork, we
> will forget about it. When only a few patches within a series are
> missing, we obviously notice. But for single patches, when they are not
> recorded, we simply miss them entirely.
> 
> Can we do something about this ? We're really happy otherwise by the
> patchwork instance at ozlabs.org, and we would hate having to run our
> own instance :-/

We've done some digging...

https://patchwork.ozlabs.org/patch/872845/
https://patchwork.ozlabs.org/patch/872846/

These are the other two patches in the series, and yet patchwork has 
assigned them two different series, so evidently something screwy is 
happening there.

sfr took a look at the mail logs for us, it looks like:

- all 3 emails were received and processed by our SMTP system
- patch 2 was received first, and patches 1 and 3 were received during 
the same second a couple of seconds later

Patch 3 has not hit the database at all, it's possible we've hit some 
race condition somewhere that prevented it from being saved at the same 
time as patch 1, or perhaps we ran into something completely 
different... we're going to add some extra logging to see if we can 
capture more info next time this happens.

Many apologies for the inconvenience!


Andrew

-- 
Andrew Donnellan              OzLabs, ADL Canberra
andrew.donnellan at au1.ibm.com  IBM Australia Limited
