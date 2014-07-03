From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 3 Jul 2014 20:18:00 +0200
Subject: [Buildroot] [v2 1/3] pkg-perl: add $(2)_CONV_ENV
In-Reply-To: <1404406406-9209-1-git-send-email-francois.perrad@gadz.org>
References: <1404406406-9209-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <20140703201800.6aa9b79f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Francois Perrad,

On Thu,  3 Jul 2014 18:53:24 +0200, Francois Perrad wrote:
> in some case $(2)_CONV_OPT is not enough

In title and commit log: s/CONV/CONF/. Also please try to write more
detailed commit messages, such as:

"""
pkg-perl: add support for $(2)_CONF_ENV

This commit adds support for specifying additional variables to be
passed in the perl Makefile.PL or perl Build.PL executions for packages
based on the perl-package infrastructure.
"""

> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  docs/manual/adding-packages-perl.txt | 4 ++++
>  package/pkg-perl.mk                  | 4 ++++
>  2 files changed, 8 insertions(+)
> 
> diff --git a/docs/manual/adding-packages-perl.txt b/docs/manual/adding-packages-perl.txt
> index 4062646..5046618 100644
> --- a/docs/manual/adding-packages-perl.txt
> +++ b/docs/manual/adding-packages-perl.txt
> @@ -100,6 +100,10 @@ A few additional variables, specific to the Perl/CPAN infrastructure,
>  can also be defined. Many of them are only useful in very specific
>  cases, typical packages will therefore only use a few of them.
>  
> +* +PERL_FOO_ENV_OPT+/+HOST_PERL_FOO_ENV_OPT+, to specify additional

The name of the options is incorrect here, it should be
PERL_FOO_CONF_ENV and HOST_PERL_FOO_CONV_ENV.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
