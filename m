From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 24 Dec 2010 08:21:10 +0100
Subject: [Buildroot] [PATCH] add syslog-ng 3.0.9,
 including required eventlog lib
In-Reply-To: <73a045889e438229d8d9dd10da05a8585acb46d6.1293153206.git.smiley73@users.sourceforge.net>
References: <7c61f61e277949a18b471ee5297d03062ced6083.1293153003.git.smiley73@users.sourceforge.net>
	<73a045889e438229d8d9dd10da05a8585acb46d6.1293153206.git.smiley73@users.sourceforge.net>
Message-ID: <20101224082110.419580d3@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 23 Dec 2010 19:26:22 -0600
heiko at zuerker.org wrote:

> From: Heiko Zuerker <smiley73@users.sourceforge.net>
> 
> 
> Signed-off-by: Heiko Zuerker <smiley73@users.sourceforge.net>
> ---
>  package/Config.in              |    1 +
>  package/eventlog/eventlog.mk   |   13 +++++++++++++

You'll need a Config.in file for eventlog as well.

> --- /dev/null
> +++ b/package/syslog-ng/Config.in
> @@ -0,0 +1,19 @@
> +config BR2_PACKAGE_SYSLOG_NG
> +    bool "syslog-ng"
> +    depends on BR2_PACKAGE_LIBNET

For library dependencies, we generally use "select".

> +    help
> +      The syslog-ng application supports reliable and encrypted transport 
> +      using TCP and TLS, and offers powerful message filtering, sorting, 
> +      pre-processing and log normalization capabilities. Utilizing message 
> +      parsing and classification, syslog-ng is able to correlate log messages 
> +      both real-time and offline, making it especially suited to implement the 
> +      artificial ignorance principle. This high-performance tool handles 
> +      extreme loads easily, and is extensible with various plug-ins to best 
> +      suit your requirements. 

And we generally add the main website of the package here, at the end
of the help text.

> +config BR2_PACKAGE_SYSLOG_NG_LINK_DYN
> +    bool "dynamic linking"
> +    depends on BR2_PACKAGE_SYSLOG_NG

I haven't checked what --enable-dynamic-linking does. But if it's
dynamic linking against libraries, then you don't need a separate
option for that, just use BR2_PREFER_STATIC_LIB.

Is syslog-ng a complete replacement for sysklogd ?

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
