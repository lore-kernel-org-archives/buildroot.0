From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 18 Oct 2011 10:32:56 +0200
Subject: [Buildroot] [PATCH 1/9] Allow timezone to be set in
	configuration
In-Reply-To: <20111017220130.30ce6f38@skate>
References: <1318603921-22899-1-git-send-email-will_wagner@carallon.com>
 <201110151151.43592.arnout@mind.be> <20111017220130.30ce6f38@skate>
Message-ID: <201110181032.56682.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


 [In a private e-mail, Will indicated to me that he doesn't really have time to work on these patches, so if anyone feels like picking them up...]

On Monday 17 October 2011 22:01:30, Thomas Petazzoni wrote:
> >  Perhaps even move it out of the SKELETON_DEFAULT condition.
> 
> Agreed.
> 
> However, it would be good to mention in the config option help text
> that this only works with uClibc. I don't ask to do it in this patch
> (because it's a lot more work), but it would be great to make this
> works for glibc as well (where it's not /etc/TZ, but /etc/timezone,
> with a different syntax).

 Actually, /etc/timezone can contain something like MST7MDT too.  It's just more descriptive to put America/Denver.

 And AFAIK, /etc/timezone is not even used by glibc, only the environment variable TZ or /etc/localtime.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  31BB CF53 8660 6F88 345D  54CC A836 5879 20D7 CF43
