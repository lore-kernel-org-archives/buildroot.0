From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 24 Jul 2011 22:39:40 +0200
Subject: [Buildroot] [PATCH 3/3] disko-demos: new package
In-Reply-To: <98bbd6aa00cc55c26b47e07333f98464df89bae0.1311138690.git.thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Wed, 20 Jul 2011 07:11:54 +0200")
References: <cover.1311138690.git.thomas.petazzoni@free-electrons.com>
 <cover.1311138690.git.thomas.petazzoni@free-electrons.com>
 <98bbd6aa00cc55c26b47e07333f98464df89bae0.1311138690.git.thomas.petazzoni@free-electrons.com>
Message-ID: <8762mrwgz7.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Thanks, a few comments:

 Thomas> --- /dev/null
 Thomas> +++ b/package/multimedia/disko-demos/disko-demos-1.8.0-fix-install-paths.patch
 Thomas> @@ -0,0 +1,61 @@
 Thomas> +Allow proper configuration of /etc directory
 Thomas> +
 Thomas> +The disko-demos SConstruct build script forced to install
 Thomas> +configuration files into <prefix>/etc, which means /usr/etc. This
 Thomas> +patch adds a sysconfdir argument, which allows to specify a different
 Thomas> +directory for configuration files.
 Thomas> +
 Thomas> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Has this been sent upstream?

 Thomas> +++ b/package/multimedia/disko-demos/disko-demos.mk
 Thomas> @@ -0,0 +1,27 @@
 Thomas> +

Please drop this empty line.

 Thomas> +DISKO_DEMOS_VERSION = 1.8.0
 Thomas> +DISKO_DEMOS_SOURCE = disko-demos_$(DISKO_DEMOS_VERSION).tar.gz
 Thomas> +DISKO_DEMOS_SITE = http://www.diskohq.com/repository/sources/
 Thomas> +
 Thomas> +DISKO_DEMOS_DEPENDENCIES = disko
 Thomas> +
 Thomas> +DISKO_DEMOS_SCONS_ENV = 	 \
 Thomas> +	$(TARGET_CONFIGURE_OPTS)

No LD=$(TARGET_CC) like for disko?

-- 
Bye, Peter Korsgaard
