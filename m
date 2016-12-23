From: Rahul Bedarkar <Rahul.Bedarkar@imgtec.com>
Date: Fri, 23 Dec 2016 19:21:28 +0530
Subject: [Buildroot] [RFC PATCH] util-linux: fix build with ncurses
In-Reply-To: <20161223142725.3f8ddf09@free-electrons.com>
References: <1482424027-9369-1-git-send-email-rahul.bedarkar@imgtec.com>
 <20161223142725.3f8ddf09@free-electrons.com>
Message-ID: <ee5cb1c3-c300-0bcf-9a6f-86ee491bc771@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Friday 23 December 2016 06:57 PM, Thomas Petazzoni wrote:
> Hello,
>
> On Thu, 22 Dec 2016 21:57:07 +0530, Rahul Bedarkar wrote:
>
>> diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
>> index 9b70f9f..e957f84 100644
>> --- a/package/util-linux/Config.in
>> +++ b/package/util-linux/Config.in
>> @@ -1,6 +1,5 @@
>>  menuconfig BR2_PACKAGE_UTIL_LINUX
>>  	bool "util-linux"
>> -	depends on BR2_USE_WCHAR
>
> This part of the patch is very incomplete: if you remove the dependency
> of util-linux on BR2_USE_WCHAR, then you need to check all the reverse
> dependencies of util-linux, and see if they still need their
> BR2_USE_WCHAR dependency. And of course do that recursively for the
> reverse dependencies of the reverse dependencies.

Thanks for pointing it out, I will fix it.

Thanks,
Rahul
