From: Jonathan Ben Avraham <yba@tkos.co.il>
Date: Thu, 17 Sep 2015 18:20:34 +0300 (IDT)
Subject: [Buildroot] [PATCH 2/2] Add dependency on gzip to lxc for
 runtime
In-Reply-To: <20150917150353.GS11632@tarshish>
References: <1442501193-6059-1-git-send-email-yba@tkos.co.il>
 <1442501193-6059-2-git-send-email-yba@tkos.co.il>
 <20150917150353.GS11632@tarshish>
Message-ID: <alpine.DEB.2.02.1509171816500.13941@orcam81.orcam.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch,
See inlines...

On Thu, 17 Sep 2015, Baruch Siach wrote:

> Date: Thu, 17 Sep 2015 18:03:53 +0300
> From: Baruch Siach <baruch@tkos.co.il>
> To: Jonathan Ben-Avraham <yba@tkos.co.il>
> Cc: buildroot at buildroot.org
> Subject: Re: [Buildroot] [PATCH 2/2] Add dependency on gzip to lxc for runtime
> 
> Hi Yonatan,
>
> On Thu, Sep 17, 2015 at 05:46:33PM +0300, Jonathan Ben-Avraham wrote:
>> From: Jonathan Ben Avraham <yba@tkos.co.il>
>>
>> lxc executables such as lxc-checkconfig require scripts provided by
>> gzip such as zgrep.
>>
>> Signed-off-by: Jonathan Ben Avraham <yba@tkos.co.il>
>> ---
>>  package/lxc/Config.in |    6 ++++--
>>  1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/package/lxc/Config.in b/package/lxc/Config.in
>> index ffd9b4a..e774eee 100644
>> --- a/package/lxc/Config.in
>> +++ b/package/lxc/Config.in
>> @@ -9,6 +9,7 @@ config BR2_PACKAGE_LXC
>>  	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201305
>>  	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201405
>>  	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0 # libcap
>> +	depends on BR2_PACKAGE_GZIP
>
> We generally use 'select' for non obvious dependencies like this one. You'll
> also need to propagate the wchar dependency of gzip here.

I didn't use 'select' because of its implicit, sneaky nature. Bash is too 
heavy to just "select" it into a rootfs without the user explicitly 
putting an 'X' in the checkbox.

  - yba


> baruch
>
>>  	help
>>  	  Linux Containers (LXC), provides the ability to group and isolate
>>  	  of a set of processes in a jail by virtualizing and accounting the
>> @@ -16,10 +17,11 @@ config BR2_PACKAGE_LXC
>>
>>  	  https://linuxcontainers.org/
>>
>> -comment "lxc needs a toolchain w/ threads, headers >= 3.0, dynamic library"
>> +comment "lxc needs gzip, toolchain w/ threads, headers >= 3.0, dynamic library"
>>  	depends on BR2_USE_MMU
>>  	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201305
>>  	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201405
>>  	depends on !BR2_TOOLCHAIN_HAS_THREADS \
>>  		|| !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0 \
>> -		|| BR2_STATIC_LIBS
>> +		|| BR2_STATIC_LIBS \
>> +		|| !BR2_PACKAGE_GZIP
>
>

-- 
  9590 8E58 D30D 1660 C349  673D B205 4FC4 B8F5 B7F9  ~. .~  Tk Open Systems
=}-------- Jonathan Ben-Avraham ("yba") ----------ooO--U--Ooo------------{=
mailto:yba at tkos.co.il tel:+972.52.486.3386 http://tkos.co.il skype:benavrhm
