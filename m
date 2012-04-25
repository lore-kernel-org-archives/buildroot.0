From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 25 Apr 2012 11:45:17 -0300
Subject: [Buildroot] [PATCH] util-linux: disable installing binaries by
 default
In-Reply-To: <1335364003.2428.14.camel@sven>
References: <1335359709-26898-1-git-send-email-gustavo@zacarias.com.ar>
 <1335364003.2428.14.camel@sven>
Message-ID: <2cb3fdaa67b81857b507a44dacdc154d@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2012-04-25 11:26, Sven Neumann wrote:

> On Wed, 2012-04-25 at 10:15 -0300, Gustavo Zacarias wrote:
>> +config BR2_PACKAGE_UTIL_LINUX_LIBBLKID
>> +       select BR2_PACKAGE_UTIL_LINUX_LIBUUID
>> +       bool "libblkid and blkid utilities"
>> +       default y
>>
> Actually it only installs libblkid. If you want the blkid utility you
> also need to select BR2_PACKAGE_UTIL_LINUX_BINARIES.
>
>
> Regards,
> Sven

I know.
Problem is i can't (or don't know how to) make a bool in Kconfig depend 
on some other option nicely.
And i'd rather avoid adding more options as i've said.
So i can leave it as is or just remove the blkid/uuid utilities mention 
in Config.in
Regards.
