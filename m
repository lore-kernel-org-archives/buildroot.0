From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 26 Jan 2015 21:47:11 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/mjpg-streamer: New package
References: <1422196772-17463-1-git-send-email-bernd.kuhls@t-online.de>
 <20150125182620.29d8efc9@free-electrons.com>
Message-ID: <XnsA42EDD9F3E858berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8
@public.gmane.org> wrote in news:20150125182620.29d8efc9 at free-electrons.com:

>> +define MJPG_STREAMER_BUILD_CMDS
>> +     CC=$(TARGET_CC) \
>> +     CFLAGS="$(TARGET_CFLAGS)" \
>> +     $(MAKE) -C $(@D)
>> +endef
> 
> Can you use:
> 
>      $(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
> 
> instead ?

Hi,

without making changes to Makefiles this produces linking errors with 
libpthread. But using

$(TARGET_MAKE_ENV) $(MAKE) CC=$(TARGET_CC) -C $(@D)

works well. The rest of your comments are now part of v2, to be sent in a few 
minutes. Thanks for the hints!

Regards, Bernd
