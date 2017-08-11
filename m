From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 11 Aug 2017 12:42:10 +0200
Subject: [Buildroot] [PATCH v1] gst1-validate: disable buliding
 documentation using sphinx
In-Reply-To: <20170810212702.12221-1-ps.report@gmx.net>
References: <20170810212702.12221-1-ps.report@gmx.net>
Message-ID: <a2d4c688-435e-64da-4491-47e0aa4a4b5e@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 10-08-17 23:27, Peter Seiderer wrote:
> Fix build failure in case (a non functional) sphinx documentation
> system is installed on the host (reported [1] and fix tested [2]
> by grunpferd at netscape.net).
> 
> Fixes:
> 
>   sphinx-build -b html -d ./doctrees   . ./html
>   Error: Source directory doesn't contain a conf.py file.
> 
> [1] http://lists.busybox.net/pipermail/buildroot/2017-August/200021.html
> [2] http://lists.busybox.net/pipermail/buildroot/2017-August/200033.html
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  package/gstreamer1/gst1-validate/gst1-validate.mk | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/gstreamer1/gst1-validate/gst1-validate.mk b/package/gstreamer1/gst1-validate/gst1-validate.mk
> index c5e3ec6fc9..c6e2ac9e15 100644
> --- a/package/gstreamer1/gst1-validate/gst1-validate.mk
> +++ b/package/gstreamer1/gst1-validate/gst1-validate.mk
> @@ -18,4 +18,8 @@ GST1_VALIDATE_DEPENDENCIES = \
>  	python \
>  	$(if $(BR2_PACKAGE_CAIRO),cairo)
>  
> +# disabling building documentation in case sphinx
> +# framework installed on host
> +GST1_VALIDATE_CONF_ENV = ac_cv_prog_enable_sphinx_doc=no

GST1_VALIDATE_CONF_OPTS += --disable-sphinx-doc
should work as well, no?

 Ross, could you test that?

 Regards,
 Arnout

> +
>  $(eval $(autotools-package))
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
