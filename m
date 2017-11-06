From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Nov 2017 23:38:21 +0100
Subject: [Buildroot] [PATCH v2 1/1] turbovnc: new package
In-Reply-To: <2241958e-38c2-6075-1d08-a129e1124251@mind.be>
References: <1509367204-12966-1-git-send-email-stefan.froberg@petroprogram.com>
 <20171101060657.tzjnt4ceb25irb3o@sapphire.tkos.co.il>
 <20171101105305.1cd82e60@windsurf>
 <59FB8C69.7050108@petroprogram.com>
 <20171102222811.4d501282@windsurf>
 <5A005FF1.5000204@petroprogram.com>
 <2241958e-38c2-6075-1d08-a129e1124251@mind.be>
Message-ID: <20171106233821.2a5aed3b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 6 Nov 2017 23:19:00 +0100, Arnout Vandecappelle wrote:

> > 1. TurboVNC really does depend of turbo-jpeg, that's one of the reasons it's so
> > fast.
> > So for now I have made it "depends on BR2_PACKAGE_JPEG_TURBO" so that turbovnc
> > package will only appear to menu only if jpeg-turbo has been also selected.
> > Is that okay?  
> 
>  Yes, there is no other way. However, please do add a comment (separately from
> the toolchain comments) that it needs jpeg-turbo.

I still would like to challenge why it needs jpeg-turbo. libjpeg and
jpeg-turbo are supposed to be API compatible, so how can TurboVNC need
one rather than the other? I can understand that TurboVNC's performance
might be horrible with the regular libjpeg, but I don't get why it
wouldn't work.

Stefan?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
