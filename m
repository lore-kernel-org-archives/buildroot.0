From: Arnar Mar Sig <antab@valka.is>
Date: Sun, 1 Jun 2008 21:35:17 +0000
Subject: [Buildroot] svn commit: trunk/buildroot/package/database
In-Reply-To: <873anwj1ic.fsf@macbook.be.48ers.dk>
References: <20080601211729.6B2CC3C5C0@busybox.net>
	<873anwj1ic.fsf@macbook.be.48ers.dk>
Message-ID: <434478AB-3F5C-44AE-8DF0-CD9F6B16FA18@valka.is>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On Jun 1, 2008, at 9:20 PM, Peter Korsgaard wrote:

>>> Please don't add the version number to the help text.
> Arnar> Removed from the helptext, Keeping it in the menu text, There  
> are so
> Arnar> many changes between the 4.x - 5.x versions that one needs to  
> know the
> Arnar> major version number.
>
> The maybe simply call it MYSQL5 or 5.x ?
5.0 to 5.1 added a lot of new stuff, not sure if its ABI compatible,  
most systems i'm using have different packages for 5.0 and 5.1.

> antab> Author: antab
> antab> Date: 2008-06-01 14:17:28 -0700 (Sun, 01 Jun 2008)
> antab> New Revision: 22170
>
> antab> Log:
> antab> Change to menuconfig and make it right.
>
> Unfortunately not :/
>
> antab> Modified:
> antab>    trunk/buildroot/package/database/Config.in
>
>
> antab> Changeset:
> antab> Modified: trunk/buildroot/package/database/Config.in
> antab>  
> ===================================================================
> antab> --- trunk/buildroot/package/database/Config.in	2008-06-01  
> 21:01:14 UTC (rev 22169)
> antab> +++ trunk/buildroot/package/database/Config.in	2008-06-01  
> 21:17:28 UTC (rev 22170)
> antab> @@ -1,5 +1,5 @@
> antab> -menuconfig "Database"
> antab> +menuconfig BR2_DATABASE_SUPPORT
> antab> +	bool "Database"
> antab> +	default n
>
> You're still missing the if BR2_DATABASE_SUPPORT / endif around the
> source line(s).
Crap, the first time i was in a hurry and touch i had fixed it and  
tested, but damn, this day is not going well.

> Again, please have a look at package/editors/Config.in.
Sorry about that. Funny thing, i also created that file along time ago:P

>
> antab>  source "package/database/mysql_client/Config.in"
> antab> -
> antab> -endmenu
>
> -- 
> Bye, Peter Korsgaard
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot


Greets
	Arnar Mar Sig
	Valka ehf
