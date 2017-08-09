From: grunpferd at netscape.net <grunpferd@netscape.net>
Date: Wed, 9 Aug 2017 08:02:25 -0400
Subject: [Buildroot] Failing gst1-validate-1.12.2 build,
 documentation not necessary!
In-Reply-To: <trinity-adc229dc-8010-433a-83e5-915ef6083410-1502267868449@3capp-gmx-bs26>
Message-ID: <15dc6dfd7fa-50f8-9d22@webprd-a03.mail.aol.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


G'day Peter,


Gave your patch a test and works as expected.
Thanks muchly!


It does appear there was no sphinx documentation system installed with python


Did not realise there was even an option.


So this maybe a useful patch for those systems that do not have this utility available.


Not sure how rare a case this is, but it caught me out.


Thanking you,


Ross



> The problem seems you are one of the rare people who have a (non functional) sphinx documentation
> system installed on the build host....
> 
> Mind to try the following (untested) patch:
> 
> diff --git a/package/gstreamer1/gst1-validate/gst1-validate.mk b/package/gstreamer1/gst1-validate/gst1-validate.mk
> index be43df4f..5066c277 100644
> --- a/package/gstreamer1/gst1-validate/gst1-validate.mk
> +++ b/package/gstreamer1/gst1-validate/gst1-validate.mk
> @@ -18,4 +18,6 @@ GST1_VALIDATE_DEPENDENCIES = \
> python \
> $(if $(BR2_PACKAGE_CAIRO),cairo)
 > 
> +GST1_VALIDATE_CONF_ENV = ac_cv_prog_enable_sphinx_doc=no
> +
> $(eval $(autotools-package))



-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170809/bf0bf08f/attachment.html>
