From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 25 Jul 2012 00:20:12 +0200
Subject: [Buildroot] [PATCH v5 1/2] usb_modeswitch: update to 1.2.3
In-Reply-To: <CAC78GpdpNkFPe+MwdO5tS_6FmpL_yB9m-eXwRUqtCFAM4_X4vA@mail.gmail.com>
References: <1332034235-17423-1-git-send-email-jwoltz@gmail.com>
 <1332034235-17423-2-git-send-email-jwoltz@gmail.com>
 <20120715231223.5a77873f@skate>
 <CAC78GpdpNkFPe+MwdO5tS_6FmpL_yB9m-eXwRUqtCFAM4_X4vA@mail.gmail.com>
Message-ID: <500F1F9C.9080105@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/21/12 20:01, J.C. Woltz wrote:
> Thomas,
>
> I used TARGET_MAKE_ENV for the reason you specified. Arnout (or others) told me to use it.

  I checked the first versions of the patch and I _think_ I meant to
say that TARGET_MAKE_ENV should not be removed, not that
TARGET_CONFIGURE_OPTS should be removed.


> Also since this is an old thread, I was assuming my patch would not be accepted at this point. I just gave up hope and
> kept my other packages to myself.

  I can imagine that when you create 5 versions of a patch, and after that
it just dies, you give up...  Care to create a 6th version, which reinstates
TARGET_CONFIGURE_OPTS, like so:

	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)

  Regards,
  Arnout

[snip]
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
