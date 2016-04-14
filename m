From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 14 Apr 2016 22:54:57 +0200
Subject: [Buildroot] [PATCH] Reset LD and AR environment variables
In-Reply-To: <1460645912-8568-1-git-send-email-nicolas.dichtel@6wind.com>
References: <1460645912-8568-1-git-send-email-nicolas.dichtel@6wind.com>
Message-ID: <571003A1.3020801@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/14/16 16:58, Nicolas Dichtel wrote:
> The goal is to fix the compilation of perf (from linux) when LD or AR
> variables are inherited from the environment.
> After the linux upstream commits 5ef7bbb09f7b ("perf tools: Allow to
> specify custom linker command") and 3c71ba3f80bb ("perf tools: Really allow
> to specify custom CC, AR or LD") CC, AR, and LD variables are not overridden
> if they are inherited.
>
> In case of a cross compilation, it results in an inconsistent state: CC is
> overridden but not LD and AR.
>
> Linux-patch: http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=5ef7bbb09f7b
> Linux-patch: http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=3c71ba3f80bb
> Signed-off-by: Nicolas Dichtel <nicolas.dichtel@6wind.com>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

  Regards,
  Arnout

> ---
>   Makefile | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/Makefile b/Makefile
> index ea8b1e4e51c8..55735ea735ae 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -343,6 +343,8 @@ ifeq ($(BR2_HAVE_DOT_CONFIG),y)
>   unexport CROSS_COMPILE
>   unexport ARCH
>   unexport CC
> +unexport LD
> +unexport AR
>   unexport CXX
>   unexport CPP
>   unexport RANLIB
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
