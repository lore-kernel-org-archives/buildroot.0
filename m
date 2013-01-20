From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 20 Jan 2013 22:41:10 +0100
Subject: [Buildroot] [PATCH v3 1/5] sg3_utils: new package
In-Reply-To: <1358546927-25707-2-git-send-email-marek.belisko@open-nandra.com>
 (Marek Belisko's message of "Fri, 18 Jan 2013 23:08:43 +0100")
References: <1358546927-25707-1-git-send-email-marek.belisko@open-nandra.com>
 <1358546927-25707-2-git-send-email-marek.belisko@open-nandra.com>
Message-ID: <87k3r7bki1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Marek" == Marek Belisko <marek.belisko@open-nandra.com> writes:

 Marek> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Marek> Signed-off-by: Marek Belisko <marek.belisko@open-nandra.com>
 Marek> ---
 Marek> +++ b/package/sg3_utils/Config.in
 Marek> @@ -0,0 +1,16 @@
 Marek> +config BR2_PACKAGE_SG3_UTILS
 Marek> +	bool "sgutils"

It imho makes more sense to call it sg3-utils, as that's what upstream
and E.G. Debian calls it, so I renamed the user visible name.

 Marek> +++ b/package/sg3_utils/sg3_utils.mk
 Marek> @@ -0,0 +1,39 @@
 Marek> +#############################################################
 Marek> +#
 Marek> +# sg3_utils
 Marek> +#
 Marek> +#############################################################
 Marek> +SG3_UTILS_VERSION = 1.34
 Marek> +SG3_UTILS_SITE    = http://sg.danny.cz/sg/p/
 Marek> +SG3_UTILS_LICENSE = BSD-3c
 Marek> +# utils progs are GPLv2+ licenced
 Marek> +ifneq ($(BR2_PACKAGE_SG3_UTILS_PROGS),)

I prefer positive logic, so I inverted this check.

Committed with those modifications, thanks.

-- 
Bye, Peter Korsgaard
