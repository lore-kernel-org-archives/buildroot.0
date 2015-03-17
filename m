From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Tue, 17 Mar 2015 12:59:11 +0100
Subject: [Buildroot] [PATCH v2] package/sysdig: New package
In-Reply-To: <20150317114816.GN2415@tarshish>
References: <1426589808-568-1-git-send-email-angelo.compagnucci@gmail.com>
 <20150317112339.GM2415@tarshish>
 <CA+TH9VnhBOe+KSV+6nsgF_sUD9SX8WtfQpY2oxG_=5h-=nSniA@mail.gmail.com>
 <20150317114816.GN2415@tarshish>
Message-ID: <CA+TH9Vkmn68BhLSWiv7rgcfR7ZPq4uqYBHcCU7qUjHAHUWcCPg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

2015-03-17 12:48 GMT+01:00 Baruch Siach <baruch@tkos.co.il>:
> Hi Angelo,
>
> On Tue, Mar 17, 2015 at 12:31:48PM +0100, Angelo Compagnucci wrote:
>> 2015-03-17 12:23 GMT+01:00 Baruch Siach <baruch@tkos.co.il>:
>> > On Tue, Mar 17, 2015 at 11:56:48AM +0100, Angelo Compagnucci wrote:
>> >> +     depends on BR2_LINUX_KERNEL
>> >> +     help
>> >> +       Sysdig is open source, system-level exploration:
>> >> +       capture system state and activity from a running Linux instance,
>> >> +       then save, filter and analyze.
>> >> +       Think of it as strace + tcpdump + lsof + awesome sauce.
>> >> +       With a little Lua cherry on top.
>> >> +
>> >> +       http://sysdig.org
>> >
>> > A dependencies comment is still missing here
>> > (http://nightly.buildroot.org/manual.html#_dependencies_on_a_linux_kernel_built_by_buildroot).
>>
>> The comment is there:
>>
>> @@ -0,0 +1,17 @@
>> +comment "sysdig needs a Linux kernel to be built"
>> + depends on !BR2_LINUX_KERNEL
>
> You are right, I missed that. It's just that I'm used to see these comments
> below the main 'config' section. Putting the comment above is also fine,
> though. Don't forget to update this comment when adding indirect dependencies.

I think that if I use select, the dependencies of this package will
explode. I think I can use select for simple, non problematic
packages, and use depends on for others.

I'll submit a patch in minutes!

Sincerely, Angelo

>
> baruch
>
> --
>      http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
> =}------------------------------------------------ooO--U--Ooo------------{=
>    - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -



-- 
Profile: http://it.linkedin.com/in/compagnucciangelo
