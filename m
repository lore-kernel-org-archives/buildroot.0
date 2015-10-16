From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 16 Oct 2015 11:55:34 +0200
Subject: [Buildroot] [PATCH] busybox: enable fully featured hush shell
	for nommu
In-Reply-To: <561FD606.2080905@mind.be> (Arnout Vandecappelle's message of
 "Thu, 15 Oct 2015 18:36:22 +0200")
References: <1444862205-23935-1-git-send-email-gustavo@zacarias.com.ar>
 <561FD606.2080905@mind.be>
Message-ID: <87twpr2l49.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 >> +	$(call KCONFIG_ENABLE_OPT,CONFIG_HUSH_LOCAL,$(BUSYBOX_BUILD_CONFIG))
 >> +	$(call KCONFIG_ENABLE_OPT,CONFIG_HUSH_RANDOM_SUPPORT,$(BUSYBOX_BUILD_CONFIG))
 >> +	$(call KCONFIG_ENABLE_OPT,CONFIG_HUSH_EXPORT_N,$(BUSYBOX_BUILD_CONFIG))
 >> +	$(call KCONFIG_ENABLE_OPT,CONFIG_HUSH_MODE_X,$(BUSYBOX_BUILD_CONFIG))

 >  I don't like this, since it makes it completely impossible to disable these
 > hush features. I admit that it indeed doesn't make a significant difference, but
 > on principle I'm against forcing this on the user.

Yeah, I also don't think this is really nice.

 >  But then we're running the fixups three times in the configure step, which
 > feels a bit like overkill to me. So perhaps a more elegant solution would be the
 > following: instead of calling sed-based fixups, use a kconfig fragment and
 > merge_config to apply the fixups.

 >  Cc-ing our Kconfig infra expert to consider this.

Lets here what he has to say ;) A further complication is that busybox
uses a really old kconfig version.

-- 
Bye, Peter Korsgaard
