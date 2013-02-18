From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 18 Feb 2013 16:58:11 +0100
Subject: [Buildroot] multchoice menu with kconfig
In-Reply-To: <51224C88.4020108@petroprogram.com>
References: <5122315C.3070806@petroprogram.com> <512249D5.5020107@mind.be>
 <51224C88.4020108@petroprogram.com>
Message-ID: <51224F93.9060102@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 18/02/13 16:45, Stefan Fr?berg wrote:
> So that buildroot BR2_ENABLE_LOCALE_WHITELIST variable seems to do the
> exactly same thing as gentoo's ${LINGUAS} variable ?
> Just put the locales you want to keep and everything else is removed at
> the final step of finishing rootfs ?
>
> It would be perfect

  Yep. Check out the target-purgelocales goal in the top-level Makefile.

  It's not enabled by default, though. You need to have 
BR2_ENABLE_LOCALE_PURGE set.

  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
