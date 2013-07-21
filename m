From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Jul 2013 17:24:15 +0200
Subject: [Buildroot] [PATCHv2 2/3] eglibc/arm: doesn't build in thumb(1)
	mode
In-Reply-To: <87li52td8g.fsf@dell.be.48ers.dk>
References: <buildroot@busybox.net>
 <1374239193-23811-1-git-send-email-gustavo@zacarias.com.ar>
 <1374239193-23811-2-git-send-email-gustavo@zacarias.com.ar>
 <87li52td8g.fsf@dell.be.48ers.dk>
Message-ID: <20130721172415.1a730f0f@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Sat, 20 Jul 2013 00:07:59 +0200, Peter Korsgaard wrote:

>  Gustavo> @@ -36,7 +41,8 @@ define EGLIBC_CONFIGURE_CMDS
>  Gustavo>  	# Do the configuration
>  Gustavo>  	(cd $(@D)/build; \
>  Gustavo>  		$(TARGET_CONFIGURE_OPTS) \
>  Gustavo> -		CFLAGS="-O2" CPPFLAGS="" CXXFLAGS="-O2" \
>  Gustavo> +		CFLAGS="-O2 $(EGLIBC_EXTRA_CFLAGS)" CPPFLAGS="" \
> 
> I know you didn't add this, but why are we forcing -O2 here? Thomas?

Because eglibc must be built with optimizations. See
http://patches.openembedded.org/patch/38849/ for example.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
