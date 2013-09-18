From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 18 Sep 2013 09:00:59 +0200
Subject: [Buildroot] [PATCH 1/1] package: udev is now provided by
 systemd or eudev.
In-Reply-To: <20130917204539.7c788c2b@skate>
References: <1378476068-25300-1-git-send-email-eric.le.bihan.dev@free.fr>
 <20130917071737.4af20d60@skate> <20130917125352.GB13723@pc-eric>
 <20130917204539.7c788c2b@skate>
Message-ID: <52394FAB.30109@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 17/09/13 20:45, Thomas Petazzoni wrote:
>> >The user can configure
>> >the extras for eudev in the appropriate "Target packages" section.
> Right.

  Perhaps it makes more sense to include the extra config for eudev and 
systemd to the system menu? I think it's a bit strange to have to 
navigate to a completely different, hard to find menu to enable systemd's 
journal gateway...

  You can easily do this by moving the
source "package/systemd/systemd.mk"
line from package/Config.in to system/Config.in.

  But first check if it looks good, of course.

  Regards,
  Arnout
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
