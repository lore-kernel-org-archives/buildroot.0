From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 01 Jun 2008 21:52:47 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/package/database:
	mysql_client
In-Reply-To: <20080601192845.BA4293C84C@busybox.net> (antab@uclibc.org's
	message of "Sun\, 1 Jun 2008 12\:28\:45 -0700 \(PDT\)")
References: <20080601192845.BA4293C84C@busybox.net>
Message-ID: <87lk1pj5kg.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "antab" == antab  <antab@uclibc.org> writes:

Hi,

 antab> Author: antab
 antab> Date: 2008-06-01 12:28:44 -0700 (Sun, 01 Jun 2008)
 antab> New Revision: 22166

 antab> Log:
 antab> Cosmetic fixes


 antab> Modified:
 antab>    trunk/buildroot/package/database/Config.in
 antab>    trunk/buildroot/package/database/mysql_client/Config.in


 antab> Changeset:
 antab> Modified: trunk/buildroot/package/database/Config.in
 antab> ===================================================================
 antab> --- trunk/buildroot/package/database/Config.in	2008-06-01 18:08:48 UTC (rev 22165)
 antab> +++ trunk/buildroot/package/database/Config.in	2008-06-01 19:28:44 UTC (rev 22166)
 antab> @@ -1,4 +1,4 @@
 antab> -menu "Database"
 antab> +menuconfig "Database"

That's not enough - And it even doesn't work:

package/Config.in:1: missing end statement for this entry
package/database/Config.in:1: invalid statement
package/database/Config.in:5: unexpected end statement

Please have a look at E.G. package/editors/Config.in and do some
minimal testing before committing.

 antab> @@ -2,4 +2,4 @@
 antab>  	bool "MySQL 5.1 client"

What about this one? ^

 antab>  	default n
 antab>  	help
 antab> -	  MySQL 5.1 client
 antab> +	  MySQL client

-- 
Bye, Peter Korsgaard
