From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 10 Mar 2013 22:26:53 +0100
Subject: [Buildroot] [PATCH v2 6/8] gptfdisk: make utf16 support
	configurable
In-Reply-To: <1362689131-1479-7-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Thu, 7 Mar 2013 21:45:28 +0100")
References: <1362689131-1479-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1362689131-1479-7-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <878v5vx7xe.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Instead of always disabling the UTF16 support, make it
 Thomas> configurable. When ICU is available, enable UTF16 support, otherwise
 Thomas> disable it.

 Thomas> diff --git a/package/gptfdisk/gptfdisk-001-configurable-utf16-support.patch b/package/gptfdisk/gptfdisk-001-configurable-utf16-support.patch
 Thomas> new file mode 100644
 Thomas> index 0000000..2d51e6f
 Thomas> --- /dev/null
 Thomas> +++ b/package/gptfdisk/gptfdisk-001-configurable-utf16-support.patch
 Thomas> @@ -0,0 +1,48 @@
 Thomas> +[PATCH] Make the UTF16 support configurable
 Thomas> +
 Thomas> +libicu is quite large, and unicode partition names are uncommon, so we
 Thomas> +may not necessarily want to have UTF16 support unconditionnally. This
 Thomas> +patch adds a USE_UTF16 environment variable to tell whether we want
 Thomas> +the UTF16 support or not.
 Thomas> +
 Thomas> +Signed-off-by: Justin Maggard <jmaggard10@gmail.com>
 Thomas> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Please consider sending this upstream.
 
 Thomas>  define GPTFDISK_BUILD_CMDS
 Thomas> -	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) \
 Thomas> -		$(GPTFDISK_TARGETS_y)
 Thomas> +	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) $(GPTFDISK_MAKE_OPTS) \
 Thomas> +		-C $(@D) $(GPTFDISK_TARGETS_y)
 Thomas>  endef

Instead of this long line I moved the _MAKE_OPTS into the 2nd line.

Committed, thanks.

-- 
Bye, Peter Korsgaard
