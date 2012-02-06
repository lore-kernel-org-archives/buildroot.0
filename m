From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 06 Feb 2012 22:06:18 +0100
Subject: [Buildroot] [PATCH] New package: gpio9260
In-Reply-To: <1328559215-12206-1-git-send-email-jwoltz@gmail.com>
 (J. C. Woltz's message of "Mon, 6 Feb 2012 15:13:35 -0500")
References: <1328559215-12206-1-git-send-email-jwoltz@gmail.com>
Message-ID: <87ehu7vfhx.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "J" == J C Woltz <jwoltz@gmail.com> writes:

 J> From: "J.C. Woltz" <jwoltz@gmail.com>
 J> gpio9260 is an utility used to read and set gpio states on
 J> the at91sam9260 and at91sam9g20 CPUs

What's the advantage of using this compared to normal /sys/class/gpio
sysfs access?

 J> index 0000000..b9adb41
 J> --- /dev/null
 J> +++ b/package/gpio9260/gpio9260.mk
 J> @@ -0,0 +1,23 @@
 J> +#############################################################
 J> +#
 J> +# gpio9260
 J> +#
 J> +#############################################################
 J> +GPIO9260_VERSION = 1.0
 J> +GPIO9260_SOURCE = gpio9260-$(GPIO9260_VERSION).tar.gz
 J> +GPIO9260_SITE = https://www.jcwoltz.com/e10
 J> +GPIO9260_INSTALL_STAGING = YES

It's just a program (no headers/libraries), so why install into staging?

-- 
Bye, Peter Korsgaard
