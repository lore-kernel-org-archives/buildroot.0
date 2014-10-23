From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 23 Oct 2014 08:07:52 -0300
Subject: [Buildroot] [PATCH 1/3] xtables-addons: new package
In-Reply-To: <5447E6E5.10904@mind.be>
References: <1413925852-12765-1-git-send-email-gustavo@zacarias.com.ar>
 <5447E6E5.10904@mind.be>
Message-ID: <5448E188.8010408@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/22/2014 02:18 PM, Arnout Vandecappelle wrote:
>> +define XTABLES_ADDONS_BUILD_CMDS
>> +	$(MAKE) -C $(@D) $(LINUX_MAKE_FLAGS)
> 
>  Is there a reason why
> 
> XTABLE_ADDONS_MAKE_OPTS = $(LINUX_MAKE_FLAGS)
> 
> doesn't work instead of overriding the build commands?
> 
>  Regards,
>  Arnout
> 
>> +endef
>> +
>> +define XTABLES_ADDONS_INSTALL_TARGET_CMDS
>> +	$(MAKE) -C $(@D) $(LINUX_MAKE_FLAGS) DESTDIR="$(TARGET_DIR)" install
>> +endef

It works for build but not for install, i can send a v2 just dropping
the build cmds and adding the opts.
Regarding the comment, there are packages that do so, for example fmc
and fmlib.
There are other packages that depend on linux as well but don't
have/need separate comment entries - being dependant on a kernel being
built i suspect some may need extra toolchain options but they aren't
audited by autobuilds hence they're not taken care of.
Regards.
