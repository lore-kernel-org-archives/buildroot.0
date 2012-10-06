From: Valentine Barshak <gvaxon@gmail.com>
Date: Sat, 06 Oct 2012 22:51:34 +0400
Subject: [Buildroot] [PATCH] sylpheed: Fix includedir
In-Reply-To: <506F6CC2.6050007@mind.be>
References: <1349457934-6208-1-git-send-email-gvaxon@gmail.com>
 <506F6CC2.6050007@mind.be>
Message-ID: <50707DB6.5090401@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/06/2012 03:26 AM, Arnout Vandecappelle wrote:
> On 05/10/12 19:25, Valentine Barshak wrote:
>> The sylpheed headers are installed to the target directory,
>> creating full staging directory path in the target rootfs,
>> which is wrong.
>> This happens because the headers are installed to
>> $(DESTDIR)$(includedir), while DESTDIR is set to
>> $(TARGET_DIR) and includedir is $(STAGING_DIR)/usr/include.
>>
>> Remove $(DESTDIR) from the include paths in the Makefile
>> to have sylpheed install its headers to staging include
>> directory instead.
>
>   Actually, includedir should be /usr/include instead of
> $(STAGING_DIR)/usr/include.  Peter set it to $(STAGING_DIR)/usr/include
> because sylpheed incorrectly adds includedir to its include path.
> So maybe it's better to patch src/Makefile and remove the
> --includedir=... from sylpheed.mk.

Right, I'll submit an updated patch that I've prepared and tested on the 
vmware.

BTW, are there any objections to bump it to version 3.2, which is the 
latest. It seems to work fine for me (though to be honest I haven't seen 
any issues with 3.1 either). Version 3.2 needs the same includedir fix 
as well.

Thanks,
Val.

>
>   Regards,
>   Arnout
>
