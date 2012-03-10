From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 10 Mar 2012 12:56:07 +0100
Subject: [Buildroot] [PATCH 10/13] Move the manual build infrastructure
	to docs/manual/manual.mk
In-Reply-To: <ec70344eaa4dc73d4d7fc0ccae8575b8562ef80d.1331148806.git.thomas.petazzoni@free-electrons.com>
References: <cover.1331148806.git.thomas.petazzoni@free-electrons.com>
 <ec70344eaa4dc73d4d7fc0ccae8575b8562ef80d.1331148806.git.thomas.petazzoni@free-electrons.com>
Message-ID: <201203101256.07634.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wednesday 07 March 2012 20:34:23 Thomas Petazzoni wrote:
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  Makefile              |   49 +------------------------------------------------
>  docs/manual/manual.mk |   48 ++++++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 49 insertions(+), 48 deletions(-)
>  create mode 100644 docs/manual/manual.mk

 Since this is generic documentation infrastructure, I'd rather put it in
docs/docs.mk.  Perhaps including a docs/manual/manual.mk containing the
last two lines:
+MANUAL_SOURCES = $(wildcard docs/manual/*.txt) $(wildcard docs/images/*)
+$(eval $(call GENDOC,manual))


 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
