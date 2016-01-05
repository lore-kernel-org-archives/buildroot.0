From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 5 Jan 2016 01:07:03 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/sp-oops-extract: consolidate
 use of stdint types
In-Reply-To: <1451939038-32365-1-git-send-email-rdkehn@yahoo.com>
References: <1451939038-32365-1-git-send-email-rdkehn@yahoo.com>
Message-ID: <568B0927.5050705@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04-01-16 21:23, Doug Kehn wrote:
> Change u_int*_t to uint*_t for compatibility with a larger number of C
> libraries.
> 
> Fixes:
> http://autobuild.buildroot.net/results/c649822aa129d56e5462a4887b13811340564453/
> 
> This patch has also been submitted upstream (ptxdist at pengutronix.de).
> 
> Cc: Luca Ceresoli <luca@lucaceresoli.net>
> Signed-off-by: Doug Kehn <rdkehn@yahoo.com>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


 Regards,
 Arnout

> ---
> Changes v1 -> v2
>   - add auto-build link (suggested by Luca)
> 
>  package/sp-oops-extract/0002-stdint-cleanup.patch | 33 +++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
>  create mode 100644 package/sp-oops-extract/0002-stdint-cleanup.patch
> 
> diff --git a/package/sp-oops-extract/0002-stdint-cleanup.patch b/package/sp-oops-extract/0002-stdint-cleanup.patch
> new file mode 100644
> index 0000000..255fe8a
> --- /dev/null
> +++ b/package/sp-oops-extract/0002-stdint-cleanup.patch
> @@ -0,0 +1,33 @@
> +consolidate use of stdint types
> +
> +Change u_int*_t to uint*_t for compatibility with a larger number of C
> +libraries.
> +
> +Signed-off-by: Doug Kehn <rdkehn@yahoo.com>
> +
> +Index: sp-oops-extract-0.0.7-1/src/oopslog.c
> +===================================================================
> +--- sp-oops-extract-0.0.7-1.orig/src/oopslog.c
> ++++ sp-oops-extract-0.0.7-1/src/oopslog.c
> +@@ -64,8 +64,8 @@ static int try_to_check_for_bad_blocks(v
> + 
> + int main(const int argc, const char *argv[])
> + {
> +-	u_int32_t *count, maxcount = 0xffffffff;
> +-	u_int32_t *magic_ptr, magic_value = 0x5d005d00;
> ++	uint32_t *count, maxcount = 0xffffffff;
> ++	uint32_t *magic_ptr, magic_value = 0x5d005d00;
> + 	
> + 	unsigned char *charbuf;
> + 	unsigned long size;
> +@@ -137,8 +137,8 @@ int main(const int argc, const char *arg
> + 		errx(-1, "%s is something weird", device);
> + 
> + 	charbuf = buf;	
> +-	count = (u_int32_t *) buf;
> +-	magic_ptr = (u_int32_t *) (buf + sizeof(u_int32_t));
> ++	count = (uint32_t *) buf;
> ++	magic_ptr = (uint32_t *) (buf + sizeof(uint32_t));
> + 
> + 	for (i = 0; i < (size / OOPS_PAGE_SIZE); i++) {
> + 		pread(fd, buf, OOPS_PAGE_SIZE, i * OOPS_PAGE_SIZE);
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
