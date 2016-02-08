From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 7 Feb 2016 21:22:12 -0300
Subject: [Buildroot] [PATCH] yad: fix libgtk3 dependency
In-Reply-To: <20160207233241.7e5eb5b9@free-electrons.com>
References: <1454504515-4365-1-git-send-email-gustavo@zacarias.com.ar>
 <20160207233241.7e5eb5b9@free-electrons.com>
Message-ID: <56B7DFB4.4030101@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/02/16 19:32, Thomas Petazzoni wrote:

>>   config BR2_PACKAGE_YAD
>>   	bool "yad"
>>   	depends on BR2_PACKAGE_XORG7
>> -	depends on BR2_PACKAGE_LIBGTK2 || BR2_PACKAGE_LIBGTK3
>> +	depends on BR2_PACKAGE_LIBGTK2 || BR2_PACKAGE_LIBGTK3_X11
>
> Is the BR2_PACKAGE_XORG7 dependency still needed, then?

Hi.
I believe it isn't, the only weak spot right now is that libgtk3 isn't 
deterministic - you can select multiple backends like x11 & wayland, 
however i'm unsure if that's allowed, IIRC there's no way to select 
which one you want.
Though that's a separate issue that i've already addressed in v3 of the 
libgtk3 bump by making it a choice.
Regards.
