From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 01 Oct 2013 19:21:30 +0200
Subject: [Buildroot] [PATCH 2 of 2] make clean: remove redundant removal
	of STAGING_DIR
In-Reply-To: <e4d1fd22ccc32a9c0ffc.1380539367@argentina>
References: <patchbomb.1380539365@argentina>
 <e4d1fd22ccc32a9c0ffc.1380539367@argentina>
Message-ID: <524B049A.2090206@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/30/13 13:09, Thomas De Schampheleire wrote:
> Since STAGING_DIR is defined as (package/Makefile.in):
>
> STAGING_SUBDIR = usr/$(GNU_TARGET_NAME)/sysroot
> STAGING_DIR    = $(HOST_DIR)/$(STAGING_SUBDIR)
>
> removing HOST_DIR will automatically remove STAGING_DIR. This patch updates
> 'make clean' based on this knowledge.
>
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

>
> ---
>   Makefile |  2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/Makefile b/Makefile
> --- a/Makefile
> +++ b/Makefile
> @@ -748,7 +748,7 @@ printvars:
>   		$(info $V=$($V) ($(value $V)))))
>
>   clean:
> -	rm -rf $(STAGING_DIR) $(TARGET_DIR) $(BINARIES_DIR) $(HOST_DIR) \
> +	rm -rf $(TARGET_DIR) $(BINARIES_DIR) $(HOST_DIR) \
>   		$(STAMP_DIR) $(BUILD_DIR) $(BASE_DIR)/staging \
>   		$(LEGAL_INFO_DIR)
>
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
