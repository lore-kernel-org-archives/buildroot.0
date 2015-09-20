From: Jonathan Ben Avraham <yba@tkos.co.il>
Date: Sun, 20 Sep 2015 20:15:02 +0300 (IDT)
Subject: [Buildroot] [PATCH 1/1] lxc needs gzip scripts for
 lxc-checkconfig runtime
In-Reply-To: <20150920190622.3f7278c3@free-electrons.com>
References: <1442761327-18830-1-git-send-email-yba@tkos.co.il>
 <20150920190622.3f7278c3@free-electrons.com>
Message-ID: <alpine.DEB.2.02.1509202012390.13941@orcam81.orcam.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sun, 20 Sep 2015, Thomas Petazzoni wrote:

> Date: Sun, 20 Sep 2015 19:06:22 +0200
> From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> To: Jonathan Ben-Avraham <yba@tkos.co.il>
> Cc: buildroot at buildroot.org
> Subject: Re: [Buildroot] [PATCH 1/1] lxc needs gzip scripts for
>     lxc-checkconfig runtime
> 
> Dear Jonathan Ben-Avraham,
>
> On Sun, 20 Sep 2015 18:02:07 +0300, Jonathan Ben-Avraham wrote:
>> From: Jonathan Ben Avraham <yba@tkos.co.il>
>>
>> lxc executables such as lxc-checkconfig require scripts provided by
>> gzip such as zgrep.
>>
>> Signed-off-by: Jonathan Ben Avraham <yba@tkos.co.il>
>> ---
>>  package/lxc/Config.in |    1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/package/lxc/Config.in b/package/lxc/Config.in
>> index ffd9b4a..5377977 100644
>> --- a/package/lxc/Config.in
>> +++ b/package/lxc/Config.in
>> @@ -1,6 +1,7 @@
>>  config BR2_PACKAGE_LXC
>>  	bool "lxc"
>>  	select BR2_PACKAGE_LIBCAP
>> +	select BR2_PACKAGE_GZIP # runtime, for lxc-checkconfig
>
> BR2_PACKAGE_GZIP depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS, so you
> should select it as well.
>
> Thanks!
>
> Thomas

I wondered whether to send a patch for each 'select' individually or to 
wait until I complete my testing and submit a single patch with all of the 
lxc selects. What do you prefer?

  - yba


-- 
  9590 8E58 D30D 1660 C349  673D B205 4FC4 B8F5 B7F9  ~. .~  Tk Open Systems
=}-------- Jonathan Ben-Avraham ("yba") ----------ooO--U--Ooo------------{=
mailto:yba at tkos.co.il tel:+972.52.486.3386 http://tkos.co.il skype:benavrhm
