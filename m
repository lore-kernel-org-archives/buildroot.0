From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 01 Jun 2008 23:20:27 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/package/database
In-Reply-To: <20080601211729.6B2CC3C5C0@busybox.net> (antab@uclibc.org's
	message of "Sun\, 1 Jun 2008 14\:17\:29 -0700 \(PDT\)")
References: <20080601211729.6B2CC3C5C0@busybox.net>
Message-ID: <873anwj1ic.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "antab" == antab  <antab@uclibc.org> writes:

 antab> Author: antab
 antab> Date: 2008-06-01 14:17:28 -0700 (Sun, 01 Jun 2008)
 antab> New Revision: 22170

 antab> Log:
 antab> Change to menuconfig and make it right.

Unfortunately not :/

 antab> Modified:
 antab>    trunk/buildroot/package/database/Config.in


 antab> Changeset:
 antab> Modified: trunk/buildroot/package/database/Config.in
 antab> ===================================================================
 antab> --- trunk/buildroot/package/database/Config.in	2008-06-01 21:01:14 UTC (rev 22169)
 antab> +++ trunk/buildroot/package/database/Config.in	2008-06-01 21:17:28 UTC (rev 22170)
 antab> @@ -1,5 +1,5 @@
 antab> -menuconfig "Database"
 antab> +menuconfig BR2_DATABASE_SUPPORT
 antab> +	bool "Database"
 antab> +	default n
 
You're still missing the if BR2_DATABASE_SUPPORT / endif around the
source line(s).

Again, please have a look at package/editors/Config.in.

 antab>  source "package/database/mysql_client/Config.in"
 antab> -
 antab> -endmenu

-- 
Bye, Peter Korsgaard
