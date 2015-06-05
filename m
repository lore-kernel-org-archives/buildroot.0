From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 06 Jun 2015 00:44:45 +0200
Subject: [Buildroot] [PATCH 02/12] fs/iso9660: convert to the filesystem
 infrastructure
In-Reply-To: <1433430330-2166-3-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1433430330-2166-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1433430330-2166-3-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <5572265D.4060204@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/04/15 17:05, Thomas Petazzoni wrote:
> Now that we have <fs>_POST_GEN_HOOKS, there is nothing that prevents
> the iso9660 filesystem logic from using the common filesystem
> infrastructure.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 However, instead of doing the cleanup in a _POST_GEN_HOOK, I would skip the
cleanup completely. We normally don't clean up any build artefact, so why should
we do it here?


 Regards,
 Arnout


[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
