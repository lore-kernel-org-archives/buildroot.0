From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 24 Aug 2009 23:30:07 +0200
Subject: [Buildroot] IPv6 in busybox
In-Reply-To: <4A855D74.5090308@tandberg.com> (Chris Smith's message of "Fri\,
	14 Aug 2009 13\:49\:56 +0100")
References: <4A6EE8F1.3060302@tandberg.com>
	<87y6q8jyz1.fsf@macbook.be.48ers.dk> <4A855D74.5090308@tandberg.com>
Message-ID: <87k50soq74.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Chris" == Chris Smith <chris.smith@tandberg.com> writes:

 Chris> There is a problem with IPv6 support in busybox.  I think you need to
 Chris> modify the busybox.mk file to add the CONFIG_FEATURE_IFUPDOWN_IPV6
 Chris> lines to allow ipv6 support in 'ifup'

Thanks, committed.

Please send fixes to the BR mailing list instead of directly to me in
the future, please.

 Chris> ifeq ($(BR2_INET_IPV6),y)
 Chris>    $(SED) "s/^.*CONFIG_FEATURE_IPV6.*/CONFIG_FEATURE_IPV6=y/;"
 Chris> $(BUSYBOX_DIR)/.config
 Chris>    $(SED)
 Chris> "s/^.*CONFIG_FEATURE_IFUPDOWN_IPV6.*/CONFIG_FEATURE_IFUPDOWN_IPV6=y/;"
 Chris> $(BUSYBOX_DIR)/.config
 Chris> else
 Chris>    $(SED) "s/^.*CONFIG_FEATURE_IPV6.*/CONFIG_FEATURE_IPV6=n/;"
 Chris> $(BUSYBOX_DIR)/.config
 Chris>    $(SED)
 Chris> "s/^.*CONFIG_FEATURE_IFUPDOWN_IPV6.*/CONFIG_FEATURE_IFUPDOWN_IPV6=n/;"
 Chris> $(BUSYBOX_DIR)/.config
 Chris> endif

-- 
Bye, Peter Korsgaard
