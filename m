From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 19 Mar 2015 23:46:19 +0100
Subject: [Buildroot] [PATCH 1/5] Makefile: add media image generation
In-Reply-To: <1651296559.1406375.1426797068089.JavaMail.zimbra@savoirfairelinux.com>
References: <1426632719-4807-1-git-send-email-vivien.didelot@savoirfairelinux.com>
 <1426632719-4807-2-git-send-email-vivien.didelot@savoirfairelinux.com>
 <20150319000445.GD4578@free.fr> <20150319092741.31bddb93@free-electrons.com>
 <20150319084435.GA4367@free.fr> <20150319101922.5e68220b@free-electrons.com>
 <1090426526.1240918.1426786624329.JavaMail.zimbra@savoirfairelinux.com>
 <20150319182552.GD4367@free.fr>
 <1651296559.1406375.1426797068089.JavaMail.zimbra@savoirfairelinux.com>
Message-ID: <550B51BB.1030703@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 19/03/15 21:31, Vivien Didelot wrote:
> Hi Yann,
> 
> If I understand correctly, you are saying that genimage may not cover
> every use cases. And that is totally fine.
> 
> With this patchset, I didn't mean to implement in Buildroot the
> *ultimate* framework for media image generation, but simply provide an
> *optional* and convenient path to the user.

 I completely agree with this statement. And I think that was also the
conclusion from the genimages patch series: it's nice to have something that
allows you to generate an SD card image, but not at the cost of adding too much
complexity to buildroot.

 However...

[snip]
> If we want to add more tools in the future, this is very good. Similar
> to the actual "Init system" where you can choose between BusyBox,
> systemV, etc., you may want to use different composition tools for
> different projects.

 Here I disagree, I see no reason to support more than one image generation
system. It's not something that ends up on the target, it's just part of the
build process, so just an implementation detail. It would be like offering the
choice between fakeroot or fakeroot-ng...

 We _may_ choose to switch to a different media generation system in the future,
but that's a different story.


 Regards,
 Arnout

> 
> This might be prematurate for the moment, but we can imagine the
> following menu in the future:
> 
>     Media image generation  --->
>         [*] genimage
>         (board/raspberrypi/genimage.cfg) Path to genimage config files
>         [ ] genimages ;-)
>         [ ] wic
> 
> 
> We are using genimage for several projects and we didn't need much so
> far. Other people seem to share the same experience.
> 
> (*) genimage does have a "mountpoint" option for partitions btw, but I
> have not played with it yet.
> 
> Thanks,
> -v
[snip]


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
