From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 22 Feb 2010 17:19:03 +0100
Subject: [Buildroot] [PATCH 17/38] libxml-parser-perl: new package
In-Reply-To: <fac4d6f24ebf9312fd1c7a714100c4e2a859e647.1266774432.git.thomas.petazzoni@free-electrons.com>
	(Thomas Petazzoni's message of "Sun, 21 Feb 2010 18:46:55 +0100")
References: <cover.1266774432.git.thomas.petazzoni@free-electrons.com>
	<cover.1266774432.git.thomas.petazzoni@free-electrons.com>
	<fac4d6f24ebf9312fd1c7a714100c4e2a859e647.1266774432.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87fx4ti6q0.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> This Perl module is needed to build intltool, which in turn is needed
 Thomas> to build several of our packages. We assume that Perl is installed on
 Thomas> the host.

 Thomas> Only the host variant of this package has been tested and is used.

 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Thomas> ---
 Thomas>  package/Config.in                                |    1 +
 Thomas>  package/libxml-parser-perl/Config.in             |    6 ++++
 Thomas>  package/libxml-parser-perl/libxml-parser-perl.mk |   32 ++++++++++++++++++++++
 Thomas>  3 files changed, 39 insertions(+), 0 deletions(-)
 Thomas>  create mode 100644 package/libxml-parser-perl/Config.in
 Thomas>  create mode 100644 package/libxml-parser-perl/libxml-parser-perl.mk

 Thomas> diff --git a/package/Config.in b/package/Config.in
 Thomas> index 5ddd63c..00f3401 100644
 Thomas> --- a/package/Config.in
 Thomas> +++ b/package/Config.in
 Thomas> @@ -412,6 +412,7 @@ source "package/ezxml/Config.in"
 Thomas>  source "package/libxml2/Config.in"
 Thomas>  source "package/libxslt/Config.in"
 Thomas>  source "package/xerces/Config.in"
 Thomas> +source "package/libxml-parser-perl/Config.in"
 Thomas>  endmenu
 
 Thomas>  # java support
 Thomas> diff --git a/package/libxml-parser-perl/Config.in b/package/libxml-parser-perl/Config.in
 Thomas> new file mode 100644
 Thomas> index 0000000..c96e9ee
 Thomas> --- /dev/null
 Thomas> +++ b/package/libxml-parser-perl/Config.in
 Thomas> @@ -0,0 +1,6 @@
 Thomas> +config BR2_PACKAGE_LIBXML_PARSER_PERL
 Thomas> +       bool "libxml-parser-perl"
 Thomas> +       help
 Thomas> +         The Perl XML::Parser module.
 Thomas> +
 Thomas> +	 http://www.cpan.org/modules/by-module/XML/
 Thomas> \ No newline at end of file

Missing newline.

It should presumably select EXPAT?

 Thomas> diff --git a/package/libxml-parser-perl/libxml-parser-perl.mk b/package/libxml-parser-perl/libxml-parser-perl.mk
 Thomas> new file mode 100644
 Thomas> index 0000000..08446d5
 Thomas> --- /dev/null
 Thomas> +++ b/package/libxml-parser-perl/libxml-parser-perl.mk
 Thomas> @@ -0,0 +1,32 @@
 Thomas> +#############################################################
 Thomas> +#
 Thomas> +# libxml-parser-perl
 Thomas> +#
 Thomas> +#############################################################
 Thomas> +LIBXML_PARSER_PERL_VERSION:=2.36
 Thomas> +LIBXML_PARSER_PERL_SOURCE:=XML-Parser-$(LIBXML_PARSER_PERL_VERSION).tar.gz
 Thomas> +LIBXML_PARSER_PERL_SITE:=http://www.cpan.org/modules/by-module/XML/
 Thomas> +
 Thomas> +HOST_LIBXML_PARSER_PERL_DEPENDENCIES = host-expat

And have a similar line for the TARGET.

-- 
Bye, Peter Korsgaard
