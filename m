From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Nov 2017 21:05:31 +0100
Subject: [Buildroot] [PATCH v2 1/1] turbovnc: new package
In-Reply-To: <20171106195934.tw433kt5ojiupxrg@tarshish>
References: <1509367204-12966-1-git-send-email-stefan.froberg@petroprogram.com>
 <20171101060657.tzjnt4ceb25irb3o@sapphire.tkos.co.il>
 <20171101105305.1cd82e60@windsurf>
 <59FB8C69.7050108@petroprogram.com>
 <20171102222811.4d501282@windsurf>
 <5A005FF1.5000204@petroprogram.com>
 <20171106195934.tw433kt5ojiupxrg@tarshish>
Message-ID: <20171106210531.190000eb@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 6 Nov 2017 21:59:34 +0200, Baruch Siach wrote:

> On Mon, Nov 06, 2017 at 03:13:21PM +0200, Stefan Fr?berg wrote:
> > 1. TurboVNC really does depend of turbo-jpeg, that's one of the reasons it's
> > so fast. So for now I have made it "depends on BR2_PACKAGE_JPEG_TURBO" so 
> > that turbovnc package will only appear to menu only if jpeg-turbo has been 
> > also selected. Is that okay?  
> 
> I don't think so.
> 
> The manual (?17.2.3) says you should "use a select type of dependency for 
> dependencies on libraries", and conversely "use a depends on type of 
> dependency when the user really needs to be aware of the dependency". In this 
> case there is nothing obvious about having to enable turbo-jpeg for turbovnc, 
> IMO.

Yes, but Stefan cannot select jpeg-turbo, because it is part of a
choice, and you can't "select" one item of a choice. So this suggestion
from the manual doesn't apply in this specific case.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
