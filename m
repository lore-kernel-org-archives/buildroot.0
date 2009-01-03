From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 03 Jan 2009 22:12:32 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/target/linux
In-Reply-To: <1231011422.8886.105.camel@linux-yrgm.site> (Ulf Samuelsson's
	message of "Sat\, 03 Jan 2009 20\:37\:02 +0100")
References: <20090103010637.58207769FD@busybox.osuosl.org>
	<871vvk17mo.fsf@macbook.be.48ers.dk>
	<1231011422.8886.105.camel@linux-yrgm.site>
Message-ID: <87ocyoytz3.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:

 Ulf> l?r 2009-01-03 klockan 21:01 +0100 skrev Peter Korsgaard:
 >> >>>>> "ulf" == ulf  <ulf@uclibc.org> writes:
 >> 
 ulf> Author: ulf
 ulf> Date: 2009-01-03 01:06:36 +0000 (Sat, 03 Jan 2009)
 ulf> New Revision: 24663
 >> 
 ulf> Log:
 ulf> Update linux versions
 >> 
 ulf> Modified:
 ulf> trunk/buildroot/target/linux/Config.in.advanced
 ulf> trunk/buildroot/target/linux/Config.in.versions
 >> 
 >> What about my comments to r24465?

?

 ulf> -config BR2_LINUX_2_6_28
 ulf> -	bool "Linux 2.6.28"
 ulf> -	select BR2_KERNEL_BASE
 ulf> -	help
 ulf> -	  Linux 2.6.28
 ulf> -
 >> 
 >> Why the move?
 >> 

 Ulf> The idea is to have everything available with the latest
 Ulf> kernel available at the time of modification at the top.

We normally have versions listed in numerical order (E.G. see
uclibc/busybox/mm.)

 Ulf> If the svn is not updated for some reason, this should not block
 Ulf> people from using a new kernel.

But where to stop? Why not simply add a custom version as a string the
user can enter for such a situation?

 Ulf> Putting those kerbel versions at the bottom,
 Ulf> should indicate that they are special in
 Ulf> a way, and if someone selects a kernel,
 Ulf> not yet available, then they will eventually
 Ulf> figure out that it is not available.

I strongly prefer no invalid config options (if nothing else, then for
automatic make randconfig tests)

 ulf> config BR2_LINUX_2_6_29
 ulf> bool "Linux 2.6.29"
 ulf> select BR2_KERNEL_BASE
 >> 
 >> Time machine? ;)

 Ulf> No, anticipation of the future.

What about 2.6.30 or 2.6.50 then? Let's please only add existing
stuff.

 >> 
 ulf> Modified: trunk/buildroot/target/linux/Config.in.versions
 ulf> ===================================================================
 ulf> --- trunk/buildroot/target/linux/Config.in.versions	2009-01-03 01:06:16 UTC (rev 24662)
 ulf> +++ trunk/buildroot/target/linux/Config.in.versions	2009-01-03 01:06:36 UTC (rev 24663)
 ulf> @@ -5,11 +5,13 @@
 >> 
 ulf> config LINUX26_LATEST_RC_VERSION
 ulf> string
 ulf> -	default "2.6.28-rc9" if BR2_KERNEL_ADD_LATEST_RC_PATCH
 ulf> +	default "2.6.29-rc1" if BR2_KERNEL_ADD_LATEST_RC_PATCH
 ulf> +	help
 ulf> +	  Not really available as of 20090103
 >> 
 >> Why add it then? What happens if you select it?
 >> 

What happens if you set it to 2.6.28?

 ulf> config LINUX26_LATEST_GIT_VERSION
 ulf> string
 ulf> -	default "2.6.28-rc9-git1" if BR2_KERNEL_ADD_LATEST_SNAPSHOT
 ulf> +	default "2.6.28-git5" if BR2_KERNEL_ADD_LATEST_SNAPSHOT
 >> 
 >> Does it make sense to have an option for this? 
 >> That one changes almost every day.

 Ulf> It is easy to download a fairly late snapshot, but
 Ulf> if you need bleeding edge, the configuration system
 Ulf> also supports defining your own patch,
 Ulf> and you can select the absolute latest there.

Again, I think having a free form string / download url is cleaner,
more user friendly and less maitenance.

 >> 
 ulf> config BR2_KERNEL_CURRENT_VERSION
 ulf> string
 ulf> -	default "2.6.27.10"
 ulf> +	default "2.6.28"
 >> 
 ulf> +config BR2_KERNEL_LATEST_2_6_28
 ulf> +	string
 ulf> +	default "1"
 ulf> +	help
 ulf> +	  Not really available as of 20090103
 ulf> +
 >> 
 >> Huh?

 Ulf> There is no 2.6.28.x patch yet.
 Ulf> When it arrives, it will be '1'.

Why not make it .<version> and then just set it to "" now?

-- 
Bye, Peter Korsgaard
