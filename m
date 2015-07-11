From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 12 Jul 2015 00:29:20 +0200
Subject: [Buildroot] [PATCH 2/7] docs/manual: document
	<PKG>_STRIP_COMPONENTS
In-Reply-To: <1436624110-20428-2-git-send-email-luca@lucaceresoli.net>
References: <1436624110-20428-1-git-send-email-luca@lucaceresoli.net>
 <1436624110-20428-2-git-send-email-luca@lucaceresoli.net>
Message-ID: <55A198C0.9000402@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/11/15 16:15, Luca Ceresoli wrote:
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> Cc: Arnout Vandecappelle <arnout@mind.be>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Although perhaps I shouldn't be doing this at this hour :-)

 Regards,
 Arnout

> ---
>  docs/manual/adding-packages-generic.txt | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
> index bc07667a01c8..4c12b42da862 100644
> --- a/docs/manual/adding-packages-generic.txt
> +++ b/docs/manual/adding-packages-generic.txt
> @@ -303,6 +303,15 @@ information is (assuming the package name is +libfoo+) :
>       the package source code. Buildroot copies the contents of the
>       source directory into the package's build directory.
>  
> +* +LIBFOO_STRIP_COMPONENTS+ is the number of leading components
> +  (directories) that tar must strip from file names on extraction.
> +  The tarball for most packages has one leading component named
> +  "<pkg-name>-<pkg-version>", thus Buildroot passes
> +  --strip-components=1 to tar to remove it.
> +  For non-standard packages that don't have this component, or
> +  that have more than one leading component to strip, set this
> +  variable with the value to be passed to tar. Default: 1.
> +
>  * +LIBFOO_DEPENDENCIES+ lists the dependencies (in terms of package
>    name) that are required for the current target package to
>    compile. These dependencies are guaranteed to be compiled and
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
