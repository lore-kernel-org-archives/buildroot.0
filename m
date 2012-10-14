From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 14 Oct 2012 23:00:21 +0200
Subject: [Buildroot] [PATCH] pkg-infra: rename <pkg>-rsync to
	<pkg>-extract
In-Reply-To: <20121014200139.525802ad@skate>
References: <50768116.4000506@relinux.de>
 <1350225704-5693-1-git-send-email-arnout@mind.be>
 <20121014200139.525802ad@skate>
Message-ID: <507B27E5.8060004@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 14/10/12 20:01, Thomas Petazzoni wrote:
> I think I would prefer to keep the 1:1 mapping between virtual target
> name and real target name, and only have aliases when it makes sense.
> I.e:
>
> $(1)-rsync:	$$($(2)_TARGET_RSYNC)
>
> # Possibly some comment here to explain what's going on
> $(1)-extract:	$(1)-rsync
> $(1)-patch:	$(1)-rsync
>
> Otherwise, I'm fine with fixing this problem using this approach, looks
> good to me.

  The reason that I choose to rename the -rsync target is that I'm hesitant
to add more targets - they slow down make.

  However, this would only be for the OVERRIDE packages, so it just adds a few
targets, not 1000.  So I'll take your suggestion and resend.

  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
