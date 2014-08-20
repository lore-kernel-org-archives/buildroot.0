From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 20 Aug 2014 14:21:28 +0200
Subject: [Buildroot] [PATCH 5/6] intltool: refactor with host-perl
In-Reply-To: <1408471638-4551-5-git-send-email-francois.perrad@gadz.org>
References: <1408471638-4551-1-git-send-email-francois.perrad@gadz.org>
 <1408471638-4551-5-git-send-email-francois.perrad@gadz.org>
Message-ID: <20140820142128.62163ff9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Francois Perrad,

On Tue, 19 Aug 2014 20:07:17 +0200, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/intltool/intltool.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/intltool/intltool.mk b/package/intltool/intltool.mk
> index 5c2dca8..96333ae 100644
> --- a/package/intltool/intltool.mk
> +++ b/package/intltool/intltool.mk
> @@ -11,5 +11,7 @@ INTLTOOL_LICENSE_FILES = COPYING
>  
>  HOST_INTLTOOL_DEPENDENCIES = host-gettext host-perl-xml-parser
>  
> +HOST_INTLTOOL_CONF_ENV = PERL=$(PERL_RUN)

Doesn't this makes the assumption that host-perl has been built as a
dependency of host-intltool? If that's the case, then it's a problem I
would really like to avoid bringing host-perl as a dependency of builds
that don't have any Perl stuff on the target.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
