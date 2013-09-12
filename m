From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 12 Sep 2013 10:45:06 +0200
Subject: [Buildroot] [PATCH 1/2] knock: new package
In-Reply-To: <1378653779-903-1-git-send-email-rommel@layer-7.net> (Michael
 Rommel's message of "Sun, 8 Sep 2013 17:22:58 +0200")
References: <1378653779-903-1-git-send-email-rommel@layer-7.net>
Message-ID: <87a9jiqvhp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Michael" == Michael Rommel <rommel@layer-7.net> writes:

 Michael> A port knocking implementation with daemon and user application.
 Michael> Signed-off-by: Michael Rommel <rommel@layer-7.net>
 Michael> ---

 Michael> Added the dependency on libpcap to the .mk file

Committed with a minor change (see below), thanks.

 Michael> +++ b/package/knock/Config.in
 Michael> @@ -0,0 +1,13 @@
 Michael> +config BR2_PACKAGE_KNOCK
 Michael> +	bool "knock"
 Michael> +	select BR2_PACKAGE_LIBPCAP
 Michael> +	help
 Michael> +	  A port knocking implementation.
 Michael> +	  Provides a daemon and a user application. Port knocking can be
 Michael> +	  used to run an arbitrary application, once the daemon detects
 Michael> +	  a predefined sequence of incoming TCP/UDP packets on a network
 Michael> +	  interface. This can be used, e.g. to open up ports in a
 Michael> +	  firewall.
 Michael> +
 Michael> +	  http://www.zeroflux.org/projects/knock
 Michael> +

You shouldn't add an empty line after the URL.

-- 
Bye, Peter Korsgaard
