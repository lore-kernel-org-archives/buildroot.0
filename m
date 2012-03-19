From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon, 19 Mar 2012 15:56:53 +0100
Subject: [Buildroot] [PATCH v3 1/2] omap-u-boot-utils: add new host
	package
In-Reply-To: <201203181822.28975.arnout@mind.be>
References: <1331844852-4609-1-git-send-email-luca@lucaceresoli.net>
 <1331844852-4609-2-git-send-email-luca@lucaceresoli.net>
 <201203181822.28975.arnout@mind.be>
Message-ID: <4F674935.5070308@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout Vandecappelle wrote:
> On Thursday 15 March 2012 21:54:11 Luca Ceresoli wrote:
> [snip]
>> +#############################################################
>> +#
>> +# omap-u-boot-utils
>> +#
>> +#############################################################
>> +
>> +OMAP_U_BOOT_UTILS_VERSION = 8aff852322
>> +OMAP_U_BOOT_UTILS_SITE = git://github.com/nmenon/omap-u-boot-utils.git
>> +OMAP_U_BOOT_UTILS_SITE_METHOD = git
>   SITE_METHOD is actually redundant because it is derived from the
> git:// prefix.  Still, I prefer this site method.
>
>   OTOH, for the URL, I prefer tu use the http URL.  Many company
> firewalls block git traffic.

I think you should start a company-wide petition against such a torture! ;)

Anyway... I used to think github only supports https, but now I found out
also http works, and is is even already used by other BR packages... I'll
resubmit with an http URL.


>
>> +
>> +define HOST_OMAP_U_BOOT_UTILS_BUILD_CMDS
>> +	$(MAKE) -C $(@D)
>> +endef
>> +
>> +define HOST_OMAP_U_BOOT_UTILS_INSTALL_CMDS
>> +	for f in gpsign pserial tagger ucmd ukermit ; do \
>> +		[ -f ${HOST_DIR}/usr/bin/$$f ] || \
>   Why this condition?  The result is that when you bump the version and
> don't do a make clean, the old version will still be installed in the
> host directory.

Oops, will fix.

Thanks,
Luca
