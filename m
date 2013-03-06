From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 06 Mar 2013 08:52:36 +0100
Subject: [Buildroot] What to do about systemd/udev/eudev?
In-Reply-To: <20130305195514.14ba14fd@skate>
References: <1362312574-17701-1-git-send-email-olivier.schonken@gmail.com>
 <20130303195436.49654719@skate> <948441.33302.bm@smtp138.mail.ir2.yahoo.com>
 <51359378.3010307@mind.be> <20130305195514.14ba14fd@skate>
Message-ID: <5136F5C4.6070300@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/05/13 19:55, Thomas Petazzoni wrote:
> Dear Arnout Vandecappelle,
>
> On Tue, 05 Mar 2013 07:40:56 +0100, Arnout Vandecappelle wrote:
>
>>    And this is exactly what Olivier Schonken's patch does, right? For
>> systemd init systems, systemd's udev is used; for other init systems, the
>> old udev 17 is used.
>
> udev 17 ? I guess you mean 182, right?
>
> Sure that's what Olivier Schonken's patch does. But how compatible are
> the libudev from the modern udev bundled with systemd, and the old udev?
>
> Also, Olivier's patch doesn't update all the packages that depend on
> udev so that they can either depend on the old udev, or systemd.

  Yes, that's what Olivier's patch does: packages that depend on udev 
will use the old udev, not the systemd udev.

  Hm, just now I realized that that means that you get two udevs when 
using systemd... OK, so this is not really the way to go :-(

  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
