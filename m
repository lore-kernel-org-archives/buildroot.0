From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 21 Jan 2016 18:15:19 -0300
Subject: [Buildroot] [PATCH] ifupdown: bump to version 0.8.8
In-Reply-To: <20160121221324.62c48f5e@free-electrons.com>
References: <1453401915-7117-1-git-send-email-gustavo@zacarias.com.ar>
 <20160121221324.62c48f5e@free-electrons.com>
Message-ID: <56A14A67.2080606@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 21/01/16 18:13, Thomas Petazzoni wrote:

>> +# We need to switch from /bin/ip to /sbin/ip
>> +IFUPDOWN_DEFN_FILES = can inet inet6 ipx link meta
>> +define IFUPDOWN_MAKE_IP_IN_SBIN
>> +	for f in $(IFUPDOWN_DEFN_FILES) ; do \
>> +		$(SED) 's,/bin/ip,/sbin/ip,' $(@D)/$$f.defn ; \
>> +	done
>> +endef
>> +IFUPDOWN_POST_PATCH_HOOKS += IFUPDOWN_MAKE_IP_IN_SBIN
>
> For this kind of things, I think my personal preference would be to
> have a real patch rather than a post patch hook.
>
> Peter ?
>
> Thomas

Hi Thomas.
$ grep /bin/ip *.defn|wc -l
56

Patch would be bigger, and maybe not too version-portable.

Regards.
