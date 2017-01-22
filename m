From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Jan 2017 17:34:27 +1100
Subject: [Buildroot] [PATCH 1/3] pkg-perl: add PREFER_INSTALLER variable
In-Reply-To: <20170121115118.17938-1-francois.perrad@gadz.org>
References: <20170121115118.17938-1-francois.perrad@gadz.org>
Message-ID: <20170122173427.32f9f737@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 21 Jan 2017 12:51:16 +0100, Francois Perrad wrote:

> +* +PERL_FOO_PREFER_INSTALLER+/+HOST_PERL_FOO_PREFER_INSTALLER+, with the
> +  value 'EUMM', the use of +Makefile.PL+ is prefered at +Build.pl+.

Should be "Build.PL" (i.e PL in capital letters).

> +  By default, 'MB'.

Is it possible to find values that are less cryptic than EUMM and MB ?
Either a boolean style:

<pkg>_USES_MODULE_BUILD = YES/NO

or:

<pkg>_BUILD_TYPE = Module-Build / ExtUtils-MakeMaker

Or are EUMM/MB values already used in the Perl community?

> +# equivalent at $CPAN::Config{prefer_installer}

I don't understand what this sentence means.

> +# legal values are MB and EUMM: if a module comes
> +# with both a Makefile.PL and a Build.PL, use the
> +# former (EUMM) or the latter (MB); if the module
> +# comes with only one of the two, that one will be
> +# used no matter the setting
> +$(2)_PREFER_INSTALLER ?= MB

If we keep this name, it should be:

<pkg>_PREFERRED_INSTALLER

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
