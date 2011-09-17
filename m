From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 17 Sep 2011 08:23:15 +0200
Subject: [Buildroot] [PATCH 7/7] support: move package/gnuconfig to
	support/gnuconfig
In-Reply-To: <2072e42d074f370769f62ccaacf34b84900da8e3.1314826483.git.thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Wed, 31 Aug 2011 23:35:06 +0200")
References: <cover.1314826483.git.thomas.petazzoni@free-electrons.com>
 <cover.1314826483.git.thomas.petazzoni@free-electrons.com>
 <2072e42d074f370769f62ccaacf34b84900da8e3.1314826483.git.thomas.petazzoni@free-electrons.com>
Message-ID: <878vpny9f0.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> The CONFIG_UPDATE macro is no longer defined in
 Thomas> package/gnuconfig/gnuconfig.mk, but instead in
 Thomas> package/Makefile.autotools.in. It it also changed a little bit to take
 Thomas> the directory of the package sources as argument, and the AUTOTARGETS
 Thomas> infrastructure is updated to use this macro.

 Thomas> +
 Thomas> +#
 Thomas> +# Utility function to upgrade config.sub and config.guess files
 Thomas> +#
 Thomas> +# argument 1 : directory into which config.guess and config.sub need
 Thomas> +# to be updated. Note that config.sub and config.guess are searched
 Thomas> +# recursively in this directory.
 Thomas> +#
 Thomas> +define CONFIG_UPDATE
 Thomas> +       echo $(1)
 Thomas> +	for file in config.guess config.sub; do \

I've dropped the echo with wrong indentation, otherwise it looks good -
Thanks.

-- 
Bye, Peter Korsgaard
