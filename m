From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 6 Oct 2017 19:10:42 +0200
Subject: [Buildroot] [PATCH v2 5/6] .flake8: add config file for Python
	code style
In-Reply-To: <20171005214212.27613-5-ricardo.martincoski@gmail.com>
References: <20170929022713.2967-1-ricardo.martincoski@gmail.com>
 <20171005214212.27613-5-ricardo.martincoski@gmail.com>
Message-ID: <fdf33648-ab35-9b69-8f25-ee00ebc77e31@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 05-10-17 23:42, Ricardo Martincoski wrote:
> We recommend wrapping at 80 columns but we accept 132 columns when it
> makes more readable.
> 
> Follow up of discussion at this thread:
> http://lists.busybox.net/pipermail/buildroot/2017-October/203624.html

 Yann said somewhere in that thread that he prefers files that don't start with
a ., but if that really bothers him he should alias ls='ls -A' :-) So I applied
as is.

 Regards,
 Arnout

> 
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Cc: Peter Korsgaard <peter@korsgaard.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> ---
> Changes v1 -> v2:
>    - new patch
> 
> Following patch is replaced by this one:
> http://patchwork.ozlabs.org/patch/820324/
> 
> Number of warnings reported by flake8 for the test infra:
> before:  17
> after:    2
> ---
>  .flake8 | 2 ++
>  1 file changed, 2 insertions(+)
>  create mode 100644 .flake8
> 
> diff --git a/.flake8 b/.flake8
> new file mode 100644
> index 0000000000..afdb967930
> --- /dev/null
> +++ b/.flake8
> @@ -0,0 +1,2 @@
> +[flake8]
> +max-line-length=132
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
