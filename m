From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 06 Nov 2012 20:36:41 +0100
Subject: [Buildroot] [PATCH] [v3] Allow to run severals post build
 scripts instead of only one
In-Reply-To: <21241_1352183937_5098B081_21241_18787_1_OF7B519B75.588186A9-ONC1257AAE.002464C5-C1257AAE.0024853E@sagemcom.com>
References: <3558_1351493584_508E27D0_3558_1558_1_1351493605-22269-1-git-send-email-philippe.reynes@sagemcom.com>
 <509059C3.4080109@mind.be>
 <21241_1352183937_5098B081_21241_18787_1_OF7B519B75.588186A9-ONC1257AAE.002464C5-C1257AAE.0024853E@sagemcom.com>
Message-ID: <509966C9.4000606@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/06/12 07:38, Philippe REYNES wrote:
> I've tried to remove this backslashes, and I've got an error when building:
>
>
> /bin/sh: -c: line 0: syntax error near unexpected token `('
> /bin/sh: -c: line 0: `echo ">>>    "Executing post-build script(s)""'
> make: *** [target-finalize] Error 1
>
> So those backslashes are usefull.

  Oh I see - it's because the quotes shouldn't be there...  But since we have
quotes in all MESSAGE calls at the moment, leave it as it is.

  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
