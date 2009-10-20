From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 20 Oct 2009 14:51:17 +0200
Subject: [Buildroot] [PATCH] samba: updated the samba package to version
	3.3.8
In-Reply-To: <1255887312-27054-1-git-send-email-s.neumann@raumfeld.com> (Sven
	Neumann's message of "Sun\, 18 Oct 2009 19\:35\:12 +0200")
References: <20091018172314.DE9757778B@busybox.osuosl.org>
	<1255887312-27054-1-git-send-email-s.neumann@raumfeld.com>
Message-ID: <87fx9eteii.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sven" == Sven Neumann <s.neumann@raumfeld.com> writes:

Hi,

 Sven> From: rvpaasen <rvpaasen@t3i.nl>
 Sven> Update the samba package to the new makefile format and also update
 Sven> it to samba version 3.3.8 (latest 3.3.x version). Based on the
 Sven> patch from bug 665, but with uclibc dependency and call to
 Sven> autogen.sh removed.

Thanks, committed with a few minor fixes.

 Sven> +config BR2_PACKAGE_SAMBA_AVAHI
 Sven> +	bool "support avahi"
 Sven> +	default y
 Sven> +	depends on BR2_PACKAGE_SAMBA
 Sven> +	depends on BR2_PACKAGE_AVAHI
 Sven> +	help
 Sven> +	  Include support for avahi
 Sven> +
 Sven> +comment "support avhai - disabled (requires avahi)"
 Sven> +	depends on !BR2_PACKAGE_AVAHI

typo -> s/avhai/avahi/

 Sven> +	$(if $(BR2_PACKAGE_SAMBA_RPCCLIENT),readline,) \

'if' supports a 3 parameter form as well, so you can get rid of the last
comma - E.G.:

$(if $(BR2_PACKAGE_SAMBA_RPCCLIENT),readline)

Which is imho more readable.

 Sven> +SAMBA_CONF_OPT = \
 Sven> +	--localstatedir=/var \
 Sven> +	--with-piddir=/var/run \
 Sven> +	--with-lockdir=/var/lock \
 Sven> +	--with-logfilebase=/var/log \
 Sven> +	--with-configdir=/etc/samba \
 Sven> +	--with-privatedir=/etc/samba \
 Sven> +	\
 Sven> +	--disable-cups \

Long term we should probably enable cups support if enabled similar to
avahi/gamin.

-- 
Bye, Peter Korsgaard
