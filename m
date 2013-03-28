From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 28 Mar 2013 08:15:34 +0100
Subject: [Buildroot] [git commit] Makefile: simplify target skeleton
	copying
In-Reply-To: <20130326074214.D6DFF9B2CA@busybox.osuosl.org>
References: <20130326074214.D6DFF9B2CA@busybox.osuosl.org>
Message-ID: <5153EE16.8070207@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 26/03/13 08:33, Peter Korsgaard wrote:
> +	rsync -au --exclude=.empty --exclude=CVS --exclude=.svn --exclude='*~' \
> +		$(TARGET_SKELETON)/ $(TARGET_DIR)/

  Since TARGET_SKELETON can be configured to point to a git- or 
mercurial-controlled directory, I'd want to exclude those as well. How 
about the --cvs-exclude --include core that ThomasDS introduced?

  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
