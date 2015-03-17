From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Tue, 17 Mar 2015 12:31:48 +0100
Subject: [Buildroot] [PATCH v2] package/sysdig: New package
In-Reply-To: <20150317112339.GM2415@tarshish>
References: <1426589808-568-1-git-send-email-angelo.compagnucci@gmail.com>
 <20150317112339.GM2415@tarshish>
Message-ID: <CA+TH9VnhBOe+KSV+6nsgF_sUD9SX8WtfQpY2oxG_=5h-=nSniA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch,

2015-03-17 12:23 GMT+01:00 Baruch Siach <baruch@tkos.co.il>:
> Hi Angelo,
>
> On Tue, Mar 17, 2015 at 11:56:48AM +0100, Angelo Compagnucci wrote:
>> diff --git a/package/sysdig/Config.in b/package/sysdig/Config.in
>> new file mode 100644
>> index 0000000..94b088f
>> --- /dev/null
>> +++ b/package/sysdig/Config.in
>> @@ -0,0 +1,17 @@
>> +comment "sysdig needs a Linux kernel to be built"
>> +     depends on !BR2_LINUX_KERNEL
>> +
>> +config BR2_PACKAGE_SYSDIG
>> +     bool "sysdig"
>> +     select BR2_PACKAGE_ZLIB
>> +     select BR2_PACKAGE_LUAJIT
>> +     select BR2_PACKAGE_LIBJSON
>
> This packages also needs to depend on all the dependencies of these packages.
> Please read the whole section under
> http://nightly.buildroot.org/manual.html#depends-on-vs-select.

Now I understand because Thomas Petazzoni suggests to use depends on
insted of select!

>
>> +     depends on BR2_LINUX_KERNEL
>> +     help
>> +       Sysdig is open source, system-level exploration:
>> +       capture system state and activity from a running Linux instance,
>> +       then save, filter and analyze.
>> +       Think of it as strace + tcpdump + lsof + awesome sauce.
>> +       With a little Lua cherry on top.
>> +
>> +       http://sysdig.org
>
> A dependencies comment is still missing here
> (http://nightly.buildroot.org/manual.html#_dependencies_on_a_linux_kernel_built_by_buildroot).

The comment is there:

@@ -0,0 +1,17 @@
+comment "sysdig needs a Linux kernel to be built"
+ depends on !BR2_LINUX_KERNEL

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
