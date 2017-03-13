From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 14 Mar 2017 00:04:46 +0100
Subject: [Buildroot] [PATCH v3 2/3] Export LINUX_DIR for post-build
 scripts
In-Reply-To: <1488202681-9744-2-git-send-email-abhimanyu.vishwakarma@imgtec.com>
References: <1488202681-9744-1-git-send-email-abhimanyu.vishwakarma@imgtec.com>
 <1488202681-9744-2-git-send-email-abhimanyu.vishwakarma@imgtec.com>
Message-ID: <3c746fc3-4be4-b3ce-b66e-96824ec8b986@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 27-02-17 14:38, Abhimanyu V wrote:
> From: Abhimanyu Vishwakarma <Abhimanyu.Vishwakarma@imgtec.com>
> 
> To build fitImage in post-build scripts, we need compressed
> kernel binary which is intermediate target, hence doesnt get
> copied to output/images folder.
> 
> Signed-off-by: Abhimanyu Vishwakarma <Abhimanyu.Vishwakarma@imgtec.com>
> Reviewed-by: Rahul Bedarkar <Rahul.Bedarkar@imgtec.com>
> ---
>  Makefile | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Makefile b/Makefile
> index 9663d15..5c8a934 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -464,6 +464,7 @@ export STAGING_DIR
>  export HOST_DIR
>  export BINARIES_DIR
>  export BASE_DIR
> +export LINUX_DIR

 I don't really like how we are exporting random variables. You never know if
some package is using it internally and gives it some different meaning.
Therefore, I'd prefer to add it to EXTRA_ENV, which also makes it available to
post-build scripts.

 Regards,
 Arnout

>  
>  ################################################################################
>  #
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
