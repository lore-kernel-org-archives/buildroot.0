From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 16 Oct 2016 12:06:52 +0200
Subject: [Buildroot] [PATCH 1/2] dependencies: check for MakeMaker Perl
 module
In-Reply-To: <1467845012-10531-1-git-send-email-romain.naour@gmail.com>
References: <1467845012-10531-1-git-send-email-romain.naour@gmail.com>
Message-ID: <3b4e74c5-2569-b00f-db9e-2a2c8cd4dfec@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07-07-16 00:43, Romain Naour wrote:
> ExtUtils::MakeMaker is one of the Perl Core modules usually packaged in
> Perl package for a Debian/Ubuntu based system.
> For a Fedora based system, each Perl Core modules have their own RPM
> package. So install only Perl package is not enough.
> 
> Fixes:
>>>> host-libxml-parser-perl 2.41 Configuring
> [...]
> perl `which perl` Makefile.PL
> Can't locate ExtUtils/MakeMaker.pm in @INC (you may need to install the ExtUtils::MakeMaker module)
> 
> Add a new Perl module check in dependency.sh.
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Fran?ois Perrad <francois.perrad@gadz.org>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout

> ---
>  support/dependencies/dependencies.sh | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
> index 3146401..5832cf3 100755
> --- a/support/dependencies/dependencies.sh
> +++ b/support/dependencies/dependencies.sh
> @@ -238,6 +238,7 @@ fi
>  
>  # Check that the Perl installation is complete enough for Buildroot.
>  required_perl_modules="Data::Dumper" # Needed to build host-autoconf
> +required_perl_modules="$required_perl_modules ExtUtils::MakeMaker" # Used by host-libxml-parser-perl
>  required_perl_modules="$required_perl_modules Thread::Queue" # Used by host-automake
>  
>  # This variable will keep the modules that are missing in your system.
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
