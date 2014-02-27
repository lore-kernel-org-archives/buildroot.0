From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 27 Feb 2014 07:40:22 +0100
Subject: [Buildroot] [PATCH 05/24] luajit: refactor without
	shared-lib.patch
In-Reply-To: <1393227301-14874-6-git-send-email-francois.perrad@gadz.org>
References: <1393227301-14874-1-git-send-email-francois.perrad@gadz.org>
 <1393227301-14874-6-git-send-email-francois.perrad@gadz.org>
Message-ID: <530EDDD6.5020204@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/24/14 08:34, Francois Perrad wrote:
> the variable BUILDMODE does the job
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout

> ---
>  package/luajit/luajit-02-shared-lib.patch |   17 -----------------
>  package/luajit/luajit.mk                  |    1 +
>  2 files changed, 1 insertion(+), 17 deletions(-)
>  delete mode 100644 package/luajit/luajit-02-shared-lib.patch
> 
> diff --git a/package/luajit/luajit-02-shared-lib.patch b/package/luajit/luajit-02-shared-lib.patch
> deleted file mode 100644
> index 361e5c2..0000000
> --- a/package/luajit/luajit-02-shared-lib.patch
> +++ /dev/null
> @@ -1,17 +0,0 @@
> -Compile the luajit binary dynamically against the luajit library
> -
> -Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> -
> -Index: b/src/Makefile
> -===================================================================
> ---- a/src/Makefile
> -+++ b/src/Makefile
> -@@ -669,7 +669,7 @@
> - 
> - $(LUAJIT_T): $(TARGET_O) $(LUAJIT_O) $(TARGET_DEP)
> - 	$(E) "LINK      $@"
> --	$(Q)$(TARGET_LD) $(TARGET_ALDFLAGS) -o $@ $(LUAJIT_O) $(TARGET_O) $(TARGET_ALIBS)
> -+	$(Q)$(TARGET_LD) $(TARGET_ALDFLAGS) -o $@ $(LUAJIT_O) -lluajit -L. $(TARGET_ALIBS)
> - 	$(Q)$(TARGET_STRIP) $@
> - 	$(E) "OK        Successfully built LuaJIT"
> - 
> diff --git a/package/luajit/luajit.mk b/package/luajit/luajit.mk
> index 186b3fd..01fbb78 100644
> --- a/package/luajit/luajit.mk
> +++ b/package/luajit/luajit.mk
> @@ -44,6 +44,7 @@ define LUAJIT_BUILD_CMDS
>  		HOST_CFLAGS="$(HOST_CFLAGS)" \
>  		HOST_LDFLAGS="$(HOST_LDFLAGS)" \
>  		$(LUAJIT_NO_LARGEFILE) \
> +		BUILDMODE=dynamic \
>  		-C $(@D) amalg
>  endef
>  
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
