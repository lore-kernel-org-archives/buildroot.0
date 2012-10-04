From: Samuel Martin <s.martin49@gmail.com>
Date: Thu, 4 Oct 2012 11:24:04 +0200
Subject: [Buildroot] [PATCH] New package liblog4c-localtime
In-Reply-To: <506D527D.2010502@mail.ru>
References: <1349341682-12387-1-git-send-email-fenixk19@mail.ru>
 <506D527D.2010502@mail.ru>
Message-ID: <CAHXCMMKR3h3+wRdXgjCE_DzOJSv1SJhttqNvNt8_k_ac6LUJ0A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Alexander,

2012/10/4 Alexander Varnin <fenixk19@mail.ru>:
> Hello. I'm working on old buildroot version 2012.02.
> For some reason, this package doesn't get include in build, even when i
> check config in menuconfig. What else should i have to do, to make package
> building?
>
> 04.10.2012 13:08, Alexander Varnin ?????:
>
[...]
>> diff --git a/package/liblog4c-localtime/liblog4c-localtime.mk
>> b/package/liblog4c-localtime/liblog4c-localtime.mk
>> new file mode 100644
>> index 0000000..f0599c3
>> --- /dev/null
>> +++ b/package/liblog4c-localtime/liblog4c-localtime.mk
>> @@ -0,0 +1,11 @@
>> + #############################################################
>> + #
>> + # liblog4c
>> + #
>> + #############################################################
>> + LIBLOG4C_VERSION = 1.2.1
>> + LIBLOG4C_SITE = git://github.com/rcmadruga/log4c-localtime.git
>> + LIBLOG4C_INSTALL_STAGING = YES
>> +
>> + $(eval $(call AUTOTARGETS))
>> +

The problem is the package name "liblog4c-localtime" does not match
the match the make target translation, which should be
"LIBLOG4C_LOCALTIME" instead of just "LIBLOG4C".

So, fix either the package name or the variables in the *.mk file,
then it should work.


Regards,

-- 
Sam
