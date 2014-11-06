From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 06 Nov 2014 15:34:48 -0300
Subject: [Buildroot] [PATCH 7/7] ifupdown: new package
In-Reply-To: <20141106191215.117286eb@free-electrons.com>
References: <1415281013-1077-1-git-send-email-gustavo@zacarias.com.ar>	<1415281013-1077-8-git-send-email-gustavo@zacarias.com.ar>
 <20141106191215.117286eb@free-electrons.com>
Message-ID: <545BBF48.4010005@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/06/2014 03:12 PM, Thomas Petazzoni wrote:


> What about:
> 
> 	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
> 		CFLAGS="$(TARGET_CFLAGS) -D'IFUPDOWN_VERSION=\"$(IFUPDOWN_VERSION)\"'" \
> 		-C $(@D)
> 

Yes works as well.

>> +	$(INSTALL) -m 0755 $(@D)/ifup $(TARGET_DIR)/sbin/ifup
> 
> -D missing

Do we want to enforce -D for skeleton/fhs dirs?
Because there are many sinners out there already.
(and i do vaguely recall someone telling me a long time ago that it was
redundant and to drop it).

>> +	$(INSTALL) -m 0755 -D $(@D)/settle-dad.sh \
>> +		$(TARGET_DIR)/lib/ifupdown/settle-dad.sh
> 
> Ditto.

No, take another look, otherwise it wouldn't even install :)
Regards.
