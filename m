From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Feb 2017 22:59:46 +0100
Subject: [Buildroot] [PATCH 3/6] support/test-pkg: report number and
 types of failures
In-Reply-To: <dcd8080c616142b0f7f761e3749c92306b2f6863.1486584734.git.yann.morin.1998@free.fr>
References: <cover.1486584734.git.yann.morin.1998@free.fr>
 <dcd8080c616142b0f7f761e3749c92306b2f6863.1486584734.git.yann.morin.1998@free.fr>
Message-ID: <20170209225946.54b9b744@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  8 Feb 2017 21:15:26 +0100, Yann E. MORIN wrote:

> +    if [ ${nb_dl} -ne 0 ]; then
> +        printf "%d configurations could not be downloaded\n" ${nb_dl}
> +    fi
> +    if [ ${nb_cfg} -ne 0 ]; then
> +        printf "%d configurations could not be applied\n" ${nb_cfg}
> +    fi
> +    if [ ${nb_skip} -ne 0 ]; then
> +        printf "%d configurations were skipped\n" ${nb_skip}
> +    fi
> +    if [ ${nb_clean} -ne 0 ]; then
> +        printf "%d configurations could not be dircleaned\n" ${nb_clean}
> +    fi
> +    if [ ${nb_build} -ne 0 ]; then
> +        printf "%d configurations would not build\n" ${nb_build}
> +    fi

This is really verbose and not very useful. Instead what would be much
more useful is just:

	successes = %d, failures = %d, skipped = %d

(possibly presented in a different way, my point is really that number
of successes, number of failures and numbers of skipped configurations
is really all what matters)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
