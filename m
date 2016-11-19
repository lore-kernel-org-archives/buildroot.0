From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 19 Nov 2016 13:45:05 +0100
Subject: [Buildroot] [PATCH v2 15/15] reproducible: improve help text
In-Reply-To: <1479460224-6119-16-git-send-email-jezz@sysmic.org>
References: <1479460224-6119-1-git-send-email-jezz@sysmic.org>
 <1479460224-6119-16-git-send-email-jezz@sysmic.org>
Message-ID: <4959b483-f93c-50f3-2180-332679a973dd@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 18-11-16 10:10, J?r?me Pouiller wrote:
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
> ---
>  Config.in | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Config.in b/Config.in
> index 5cf0c4d..2a81202 100644
> --- a/Config.in
> +++ b/Config.in
> @@ -707,6 +707,11 @@ config BR2_REPRODUCIBLE
>  	  this allows to generate exactly identical binaries from one
>  	  build to the other, including on different machines.
>  
> +	  Some restrictions are known on current implementation:
> +	    - Build paths ($OUTDIR and $TOPDIR) have to be the sames for all
> +	      builds
> +	    - Use of lzop is incompatible

 I don't think it makes sense to document the lzop part. For example, I doubt
any of the filesystems except for tar and maybe squashfs are reproducible at the
moment (they probably put things in filesystem order). The lzop thing is really
a small aspect compared to that.

 So I think we should just document the restriction that it has to be the same
output directory:

	  The current implementation is restricted to builds with the same
	  output directory. Many (absolute) paths are recorded in intermediary
	  files, and it is very likely that some of these paths leak into the
	  target rootfs. If you build with the same O=... path, however, the
	  result is identical.

(I'm not 100% satisfied with this explanation but it's a start.)

 Regards,
 Arnout

> +
>  	  This is labeled as an experimental feature, as not all
>  	  packages behave properly to ensure reproducibility.
>  
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
