From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 8 Feb 2012 23:10:48 +0100
Subject: [Buildroot] Ext4 rootfs option
In-Reply-To: <20120208222445.0dc487d7@skate>
References: <4F3220B8.9040604@renta.net> <20120208222445.0dc487d7@skate>
Message-ID: <201202082310.49254.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wednesday 08 February 2012 22:24:45 Thomas Petazzoni wrote:
> Hello,
> 
> Le Wed, 08 Feb 2012 17:14:00 +1000,
> Mark Constable <markc@renta.net> a ?crit :
> 
> > Is it worth my while to provide some (first time newbie) patches
> > for a ext4 rootfs?
> 
> Sure!
> 
> How do you generate ext4 images? You use genext2fs and then some other
> commands to enable ext4-specific features? Is there another utility?

 I currently use genext2fs, followed by  tune2fs to add the journal and 
e2fsck to fix the incorrect FS version  number.  But it's extremely 
inefficient, especially since genext2fs first builds the filesystem in 
memory before committing to the output image.  Not good when you want to
create a 500GB partition :-)

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
