From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 10 Jan 2014 07:04:55 +0100
Subject: [Buildroot] [PATCH] libnfc-llcp: rename to libllcp and bump
	version
In-Reply-To: <1389287265-1498-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1389287265-1498-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <52CF8D87.20000@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/01/14 18:07, Vicente Olivert Riera wrote:
> This package has been renamed upstream to libllcp.

  This is not sufficient reason to rename the package in buildroot as 
well. Renaming makes it difficult for people to follow buildroot upstream 
with their configurations.

  Also, if any existing symbol is removed (or renamed), entries have to 
be added to Config.in.legacy. This makes is slightly easier for users to 
maintain buildroot configurations, but it's still annoying so renaming of 
symbols should be done with care.

  It _is_ an option to still rename it in the menu. I'm not entirely sure 
what should be done with the alphabetical ordering in that case - 
probably follow the visible name, not the internal name.

  Regards,
  Arnout

> Also, the current
> package we have in Buildroot fails to compile due to a version bump of
> it's main dependence, libnfc. A version bump is required because this
> package has been adapted upstream to work with libnfc-1.7.0-rc6.
>
> Signed-off-by: Vicente Olivert Riera<Vincent.Riera@imgtec.com>
> ---
>   package/Config.in                          |    2 +-
>   package/{libnfc-llcp => libllcp}/Config.in |    6 +++---
>   package/libllcp/libllcp.mk                 |   15 +++++++++++++++
>   package/libnfc-llcp/libnfc-llcp.mk         |   15 ---------------
>   4 files changed, 19 insertions(+), 19 deletions(-)
>   rename package/{libnfc-llcp => libllcp}/Config.in (56%)
>   create mode 100644 package/libllcp/libllcp.mk
>   delete mode 100644 package/libnfc-llcp/libnfc-llcp.mk


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
