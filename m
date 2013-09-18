From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 18 Sep 2013 18:06:13 +0200
Subject: [Buildroot] [PATCH 1/1] package: udev is now provided by
 systemd or eudev.
In-Reply-To: <20130918175838.32d9763a@skate>
References: <1378476068-25300-1-git-send-email-eric.le.bihan.dev@free.fr>
 <20130917071737.4af20d60@skate> <20130917125352.GB13723@pc-eric>
 <20130917204539.7c788c2b@skate> <52394FAB.30109@mind.be>
 <20130918175838.32d9763a@skate>
Message-ID: <5239CF75.2050807@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 18/09/13 17:58, Thomas Petazzoni wrote:
> Dear Arnout Vandecappelle,
>
> On Wed, 18 Sep 2013 09:00:59 +0200, Arnout Vandecappelle wrote:
>
>>    Perhaps it makes more sense to include the extra config for eudev and
>> systemd to the system menu? I think it's a bit strange to have to
>> navigate to a completely different, hard to find menu to enable systemd's
>> journal gateway...
>>
>>    You can easily do this by moving the
>> source "package/systemd/systemd.mk"
>> line from package/Config.in to system/Config.in.
>
> I already suggested that the selection of eudev vs. systemd should not
> be in Target Packages, and Eric already made a proposal to solve this.
> In fact, we don't need any new configuration option: when the systemd
> init system is selected, then systemd is used. When another init
> systemd is used, but the selected /dev management method is udev, then
> we use eudev.
>
> There's no need for more options. The only thing that Eric proposed is
> to re-order the Init System selection vs. the /dev management selection
> to make things a bit more logical.

  For systemd, journal compression and journal gateway still have to be 
selectable. IMHO it is not nice for the user to have to navigate to a 
completely unrelated place in order to enable those. So my suggestion is 
to include the Config.in that has these extra options immediately below 
the systemd selection in the system menu.

  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
