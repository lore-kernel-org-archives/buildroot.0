From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 06 Apr 2008 13:42:52 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/target/linux
In-Reply-To: <20080406101031.259663C3CA@busybox.net> (ulf@uclibc.org's message
	of "Sun\, 6 Apr 2008 03\:10\:31 -0700 \(PDT\)")
References: <20080406101031.259663C3CA@busybox.net>
Message-ID: <87zls78b0j.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "ulf" == ulf  <ulf@uclibc.org> writes:

 ulf> Author: ulf
 ulf> Date: 2008-04-06 03:10:30 -0700 (Sun, 06 Apr 2008)
 ulf> New Revision: 21651

 ulf> Log:
 ulf> Make xconfig the default for Atmel targets

 ulf> Modified:
 ulf>    trunk/buildroot/target/linux/Config.in.advanced


 ulf> Changeset:
 ulf> Modified: trunk/buildroot/target/linux/Config.in.advanced
 ulf> ===================================================================
 ulf> --- trunk/buildroot/target/linux/Config.in.advanced	2008-04-06 10:02:53 UTC (rev 21650)
 ulf> +++ trunk/buildroot/target/linux/Config.in.advanced	2008-04-06 10:10:30 UTC (rev 21651)
 ulf> @@ -445,6 +445,7 @@
 
 ulf>  choice
 ulf>  	prompt "Preferred config tool"
 ulf> +	default BR2_MAKE_XCONFIG IF BR2_TARGET_ATMEL
 ulf>  	default BR2_MAKE_MENUCONFIG

Why? Could we please stop having all this special casing of Atmel
stuff all over buildroot?

-- 
Bye, Peter Korsgaard
