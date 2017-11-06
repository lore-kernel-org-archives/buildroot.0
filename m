From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 6 Nov 2017 21:59:34 +0200
Subject: [Buildroot] [PATCH v2 1/1] turbovnc: new package
In-Reply-To: <5A005FF1.5000204@petroprogram.com>
References: <1509367204-12966-1-git-send-email-stefan.froberg@petroprogram.com>
 <20171101060657.tzjnt4ceb25irb3o@sapphire.tkos.co.il>
 <20171101105305.1cd82e60@windsurf>
 <59FB8C69.7050108@petroprogram.com>
 <20171102222811.4d501282@windsurf>
 <5A005FF1.5000204@petroprogram.com>
Message-ID: <20171106195934.tw433kt5ojiupxrg@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Stefan,

On Mon, Nov 06, 2017 at 03:13:21PM +0200, Stefan Fr?berg wrote:
> 1. TurboVNC really does depend of turbo-jpeg, that's one of the reasons it's
> so fast. So for now I have made it "depends on BR2_PACKAGE_JPEG_TURBO" so 
> that turbovnc package will only appear to menu only if jpeg-turbo has been 
> also selected. Is that okay?

I don't think so.

The manual (?17.2.3) says you should "use a select type of dependency for 
dependencies on libraries", and conversely "use a depends on type of 
dependency when the user really needs to be aware of the dependency". In this 
case there is nothing obvious about having to enable turbo-jpeg for turbovnc, 
IMO.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
