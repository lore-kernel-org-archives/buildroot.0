From: Cjw X <cjwfirmware@vxmdesign.com>
Date: Wed, 16 Sep 2015 13:36:20 -0400
Subject: [Buildroot] [PATCH 1/3] Experimental addition of the newlib
	library
In-Reply-To: <20150913101738.238ebc06@free-electrons.com>
References: <1442127768-26447-1-git-send-email-cjwfirmware@vxmdesign.com>
 <20150913101738.238ebc06@free-electrons.com>
Message-ID: <CAOudHSU5sVhW4ono_QprXuyazYjMiHcRzfvW2TNg9qLVZ8R=Bg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

I've gotten newlib moved over to the autotools infrastructure. I
should be able to post updated patches tonight.

>
>> +define NEWLIB_INSTALL_STAGING_CMDS
>> +     mkdir -p $(HOST_DIR)/usr/$(GNU_TARGET_NAME)/lib
>> +     $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
>
> Except the mkdir, the install command is not needed if you use the
> autotools-package infrastructure.

So, that mkdir command needs to be run, and the it is most closely
associated with the staging install.
Is there some way to run mkdir then without overriding the
install_staging define? I haven't found anything in the docs.

Thanks,
-Chris


>
> Thanks a lot!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
