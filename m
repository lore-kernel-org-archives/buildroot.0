From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Wed, 03 Feb 2016 21:15:26 -0200
Subject: [Buildroot] [PATCH 1/2] yad: fix libgtk2 related dependency
	error
References: <mailman.2229.1454536893.28235.buildroot@busybox.net>
Message-ID: <56b28a0eeab24_19087bc7805919a@ultri2.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gustavo,

On Wed, 3 Feb 2016 09:17:48 -0300, Gustavo Zacarias wrote:
> On 02/02/16 22:52, Ricardo Martincoski wrote:
> 
>> --- a/package/yad/Config.in
>> +++ b/package/yad/Config.in
>> @@ -2,6 +2,7 @@ config BR2_PACKAGE_YAD
>>   	bool "yad"
>>   	depends on BR2_PACKAGE_XORG7
>>   	depends on BR2_PACKAGE_LIBGTK2 || BR2_PACKAGE_LIBGTK3
>> +	select BR2_PACKAGE_LIBGTK3_X11 if BR2_PACKAGE_LIBGTK3
>>   	help
>>   	  YAD (yet another dialog) is a tool for create graphical dialogs
>>   	  from shell scripts.
> 
> Hi.
> This logic is severely broken, you can't force X11 if someone is using 
> gtk3 with say broadway or wayland.
> Not to mention BR2_PACKAGE_LIBGTK3_X11 depends on xorg being selected.

Thank you for your explanation.
I marked my patch as Superseded by yours
http://patchwork.ozlabs.org/patch/577916/
yad: fix libgtk3 dependency

> 
>> -ifeq ($(BR2_PACKAGE_LIBGTK3_X11),y)
>> +ifeq ($(BR2_PACKAGE_LIBGTK3),y)
> 
> This isn't accurate either, you first say it needs x11 by selecting it, 
> but you then basically say no?

My intent was to let the dependency to x11 be handled at config time.
But I see now the way it currently is on the master branch is better.

Regards,
Ricardo
