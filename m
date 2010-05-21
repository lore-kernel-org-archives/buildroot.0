From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 21 May 2010 21:56:05 +0200
Subject: [Buildroot] [PATCH 02/19] Make all package using gettext rely
	on BR2_NEEDS_GETTEXT
In-Reply-To: <542fbe8520c981f9c96705a57e4263f34f2ab2e6.1274428595.git.thomas.petazzoni@free-electrons.com>
	(Thomas Petazzoni's message of "Fri, 21 May 2010 10:08:22 +0200")
References: <cover.1274428595.git.thomas.petazzoni@free-electrons.com>
	<cover.1274428595.git.thomas.petazzoni@free-electrons.com>
	<542fbe8520c981f9c96705a57e4263f34f2ab2e6.1274428595.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87mxvtt4fe.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> --- a/package/libglib2/Config.in
 Thomas> +++ b/package/libglib2/Config.in
 Thomas> @@ -1,7 +1,7 @@
 Thomas>  config BR2_PACKAGE_LIBGLIB2
 Thomas>  	bool "libglib2"
 Thomas> -	select BR2_PACKAGE_GETTEXT
 Thomas> -	select BR2_PACKAGE_LIBINTL
 Thomas> +	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
 Thomas> +	select BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT

I unfortunately now get the following error when building with an
internal toolchain and locales NOT enabled:

checking libintl.h usability... no
checking libintl.h presence... no
checking for libintl.h... no
configure: error: 
*** You must have either have gettext support in your C library, or use the
*** GNU gettext library. (http://www.gnu.org/software/gettext/gettext.html

make: *** [/tmp/br/build/libglib2-2.22.5/.stamp_configured] Error 1

Seems like we need to make libglib2 depend on locale support?

-- 
Bye, Peter Korsgaard
