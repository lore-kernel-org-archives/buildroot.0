From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 16 Jan 2016 00:21:08 +0100
Subject: [Buildroot] [PATCH] perf: remove tests from target
In-Reply-To: <1452847655-15415-1-git-send-email-patrickdepinguin@gmail.com>
References: <1452847655-15415-1-git-send-email-patrickdepinguin@gmail.com>
Message-ID: <56997EE4.4080800@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 15-01-16 09:47, Thomas De Schampheleire wrote:
> From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> 
> The perf tool installed test files in
>     output/target/usr/libexec/perf-core/tests/
> which amounted to about 30+K.
> 
> Since they are not needed for normal perf operation, remove them.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout

> ---
>  linux/linux-tool-perf.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/linux/linux-tool-perf.mk b/linux/linux-tool-perf.mk
> index 0bd0ed1..07c3514 100644
> --- a/linux/linux-tool-perf.mk
> +++ b/linux/linux-tool-perf.mk
> @@ -84,4 +84,5 @@ define PERF_INSTALL_TARGET_CMDS
>  	$(TARGET_MAKE_ENV) $(MAKE1) $(PERF_MAKE_FLAGS) \
>  		-C $(@D)/tools/perf O=$(@D)/tools/perf/ install
>  	$(RM) -rf $(TARGET_DIR)/usr/libexec/perf-core/scripts/
> +	$(RM) -rf $(TARGET_DIR)/usr/libexec/perf-core/tests/
>  endef
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
