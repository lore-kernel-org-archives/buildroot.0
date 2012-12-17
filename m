From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 17 Dec 2012 07:55:19 +0100
Subject: [Buildroot] [PATCH] qwt: new package
In-Reply-To: <877goifgwv.fsf@dell.be.48ers.dk>
References: <1355094387-22886-1-git-send-email-s.martin49@gmail.com>
 <1355094387-22886-6-git-send-email-s.martin49@gmail.com>
 <877goifgwv.fsf@dell.be.48ers.dk>
Message-ID: <50CEC1D7.9050207@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 16/12/12 11:08, Peter Korsgaard wrote:
>   Samuel>  +define QWT_CLEAN_CMDS
>   Samuel>  +	-$(MAKE) -C $(@D) clean
>   Samuel>  +	-rm $(TARGET_DIR)/usr/lib/libqwt.so.*
>
> If we cannot clean completely (E.G. everything else installed into
> staging), then I prefer just not providing a clean target.

  Begging to differ: I think it does make sense to have clean commands
but no uninstall commands. Of course, the definition above should have
been split up into a clean and an uninstall.

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
