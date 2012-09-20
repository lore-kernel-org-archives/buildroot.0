From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 20 Sep 2012 22:04:18 +0200
Subject: [Buildroot] [PATCH 06/13] cpanminus: new package v3
In-Reply-To: <1347107325-4163-6-git-send-email-francois.perrad@gadz.org>
References: <1347107325-4163-1-git-send-email-francois.perrad@gadz.org>
 <1347107325-4163-6-git-send-email-francois.perrad@gadz.org>
Message-ID: <20120920220418.65bb6b14@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Francois Perrad,

On Sat,  8 Sep 2012 14:28:38 +0200, Francois Perrad wrote:

> diff --git a/package/cpanminus/Config.in b/package/cpanminus/Config.in
> new file mode 100644
> index 0000000..d265c2e
> --- /dev/null
> +++ b/package/cpanminus/Config.in
> @@ -0,0 +1,28 @@
> +config BR2_PACKAGE_CPANMINUS
> +	bool "cpanminus"
> +	help
> +	  cpanminus is a script to get, unpack, build and install Perl modules
> +	  from CPAN.
> +
> +	  Why? It's dependency free, requires zero configuration, and stands
> +	  alone. When running, it requires only 10MB of RAM.
> +
> +	  http://github.com/miyagawa/cpanminus
> +
> +if BR2_PACKAGE_CPANMINUS
> +
> +config BR2_PACKAGE_CPANMINUS_MODULES
> +	string "Perl modules from CPAN"
> +	help
> +	  List of space-separated Perl modules to install from CPAN.
> +
> +	  Examples: Try::Tiny Dancer YAML Moo
> +
> +	  Install the listed modules and their dependencies.

Hum, do we really want a package which has configuration options that
allow to select a set of libraries/modules to be downloaded and
installed? It would be more natural to have those Perl modules properly
packaged into Buildroot, no? I suspect that they are all packaged
similarly, so a $(perl-package) infrastructure would work quite well.

This way, we still have the usual package infrastructure for licensing
report and things like this. I honestly don't know if we want packages
whose job is in turn to download/install a bunch of other things. It's
smart, but I'm not sure we want that.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
