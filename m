From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 12 Feb 2013 07:32:15 +0100
Subject: [Buildroot] [RFC] Removing CLEAN_CMDS and
	UNINSTALL_(STAGING|TARGET)_CMDS
In-Reply-To: <1360363083-28747-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1360363083-28747-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <5119E1EF.3070507@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/02/13 23:37, Thomas Petazzoni wrote:
> This is an RFC patch set to discuss whether or not we should keep the
> <pkg>_CLEAN_CMDS, <pkg>_UNINSTALL_TARGET_CMDS and
> <pkg>_UNINSTALL_STAGING_CMDS. It is a topic that has been discussed at
> various times in the past months/years.
>
> A lot of packages don't implement them, we generally don't ask for
> them to be implemented when reviewing packages, and the uninstall
> commands are generally never updated when a package version is bumped,
> which means that they are probably bitrotting pretty quickly. We also
> have no automated way of testing these commands.
>
> That said, it is true that the <pkg>-clean target might be useful for
> some use cases. However, is <pkg>-uninstall really useful, considering
> that it doesn't take into account the removal of the reverse
> dependencies?
>
> Again, this patch set is not meant to be applied as is, it is here to
> get the discussion started. Sending the patches with it is simply a
> way to ensure that the discussion is considered seriously:-)

  I think I'm the biggest proponent of the idea, so
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
to the series.

  That said, I wouldn't oppose to keeping the CLEAN around for one more 
release, until the out-of-tree build has settled in.

  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
