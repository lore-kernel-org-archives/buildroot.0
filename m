From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 17 May 2010 09:46:48 +0200
Subject: [Buildroot] [PATCH 2/8] Make all package using gettext rely on
	BR2_NEEDS_GETTEXT
In-Reply-To: <f61ebb7ce530c54fccc10e8c0b0314cd6dfe4787.1273836748.git.thomas.petazzoni@free-electrons.com>
	(Thomas Petazzoni's message of "Fri, 14 May 2010 13:37:25 +0200")
References: <cover.1273836748.git.thomas.petazzoni@free-electrons.com>
	<cover.1273836748.git.thomas.petazzoni@free-electrons.com>
	<f61ebb7ce530c54fccc10e8c0b0314cd6dfe4787.1273836748.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87iq6n0y3b.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 Thomas> diff --git a/package/avahi/Config.in b/package/avahi/Config.in
 Thomas> index 35b7c27..3386005 100644
 Thomas> --- a/package/avahi/Config.in
 Thomas> +++ b/package/avahi/Config.in
 Thomas> @@ -1,7 +1,7 @@
 Thomas>  config BR2_PACKAGE_AVAHI
 Thomas>  	bool "avahi"
 Thomas> -	select BR2_PACKAGE_GETTEXT if BR2_ENABLE_LOCALE
 Thomas> -	select BR2_PACKAGE_LIBINTL if BR2_ENABLE_LOCALE
 Thomas> +	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
 Thomas> +	select BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT

Hmm, I'm using avahi here with an internal toolchain without locale
support, and wouldn't want to add gettext/libintl.

-- 
Bye, Peter Korsgaard
