From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 25 Jan 2009 15:28:03 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package/ncftp
In-Reply-To: <20090125081836.3DB9676D28@busybox.osuosl.org> (ulf@uclibc.org's
	message of "Sun\, 25 Jan 2009 08\:18\:36 +0000 \(UTC\)")
References: <20090125081836.3DB9676D28@busybox.osuosl.org>
Message-ID: <87k58jfojw.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "ulf" == ulf  <ulf@uclibc.org> writes:

 ulf> Author: ulf
 ulf> Date: 2009-01-25 08:18:35 +0000 (Sun, 25 Jan 2009)
 ulf> New Revision: 25013

 ulf> Log:
 ulf> Part of NcFTP depends on ncurses, create dependencies, if needed

 ulf> Modified:
 ulf>    trunk/buildroot/package/ncftp/Config.in
 ulf>    trunk/buildroot/package/ncftp/ncftp.mk


 ulf> Changeset:
 ulf> Modified: trunk/buildroot/package/ncftp/Config.in
 ulf> ===================================================================
 ulf> --- trunk/buildroot/package/ncftp/Config.in	2009-01-25 08:16:53 UTC (rev 25012)
 ulf> +++ trunk/buildroot/package/ncftp/Config.in	2009-01-25 08:18:35 UTC (rev 25013)
 ulf> @@ -30,11 +30,13 @@
 ulf>  	depends on BR2_PACKAGE_NCFTP
 
 ulf>  config BR2_PACKAGE_NCFTP_SPOOLER
 ulf> -	bool "NcFTPSpooler - spooler - not working properly"
 ulf> +	bool "NcFTPSpooler - spooler"
 ulf>  	depends on BR2_PACKAGE_NCFTP
 ulf> +	depends on BR2_PACKAGE_NCURSES

Does this mean that the spooler thingy works?
 
 ulf> +ifeq ($(BR2_PACKAGE_NCURSES),y)
 ulf>  ifeq ($(BR2_PACKAGE_NCFTP_SPOOLER),y)
 ulf>  #Someone needs to figure out what to do...
 ulf>  NCFTP_TARGET_BINS+=
 ulf>  endif

Aparently not. So why did you change the Config.in text?

-- 
Bye, Peter Korsgaard
