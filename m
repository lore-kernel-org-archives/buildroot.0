From: Markos Chandras <Markos.Chandras@imgtec.com>
Date: Thu, 22 Mar 2012 09:17:48 +0000
Subject: [Buildroot] [PATCH] xfsprogs: Bump to 3.1.7 and convert to
	AUTOTARGET
In-Reply-To: <20120321184616.19ed7ea2@skate>
References: <1332349635-15914-1-git-send-email-markos.chandras@imgtec.com>
 <20120321184616.19ed7ea2@skate>
Message-ID: <4F6AEE3C.9020108@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/21/2012 05:46 PM, Thomas Petazzoni wrote:

> Hello,
> 
> Thanks for this work!
> 
> Le Wed, 21 Mar 2012 17:07:15 +0000,
> Markos Chandras <markos.chandras@imgtec.com> a ?crit :
> 
>>  #############################################################
>> -XFSPROGS_VERSION:=3.0.3
>> +XFSPROGS_VERSION:=3.1.7
> 
> We prefer '=' instead of ':=', and spaces before and after '=', i.e:
> 
> XFSPROGS_VERSION = 3.1.7
> 
>>  XFSPROGS_SOURCE=xfsprogs-$(XFSPROGS_VERSION).tar.gz
> 
> This line is not needed, it's the default.
> 
>> +XFSPROGS_INSTALL_STAGING = NO
>> +XFSPROGS_INSTALL_TARGET = YES
> 
> Not needed, it's the default.
> 
>> 
>> -$(DL_DIR)/$(XFSPROGS_SOURCE):
>> -      $(call DOWNLOAD,$(XFSPROGS_SITE)/$(XFSPROGS_SOURCE))
>> +XFSPROGS_DEPENDENCIES = util-linux
>> 
>> -xfsprogs-source: $(DL_DIR)/$(XFSPROGS_SOURCE)
>> +XFSPROGS_CONF_ENV = ac_cv_header_aio_h=yes ac_cv_lib_rt_lio_listio=yes
>> +XFSPROGS_CONF_OPT = --enable-lib64=no \
>> +                                     --enable-gettext=no \
>> +                                     INSTALL_USER=default \
>> +                                     INSTALL_GROUP=default
> 
> Hum, why default:default and not root:root here? Anyway, our fakeroot
> script is going to chown everything to root:root.
> 
> In terms of indentation, something like:
> 
> XFSPROGS_CONF_OPT = \
>         --enable-lib64=no \
>         --enable-gettext=no \
>         INSTALL_USER=root \
>         INSTALL_GROUP=root
> 
> Would be better, IMO, but I'm nitpicking.
> 
> Otherwise, looks good (but untested).
> 
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 

Hi Thomas,

Thanks for the review. A new patch is coming soon

-- 
markos
