From: Stanislav Vlasic <svlasic@gmail.com>
Date: Fri, 24 Jul 2015 23:08:28 +0200
Subject: [Buildroot] Isengard 15.0 python issue - solution
In-Reply-To: <XnsA4E1EA4505855berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
References: <mou1bv$4au$1@ger.gmane.org>
 <XnsA4E1EA4505855berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
Message-ID: <55B2A94C.9050607@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/24/2015 11:01 PM, Bernd Kuhls wrote:
> [posted and mailed]
>
> Stanislav Vlasic <svlasic@gmail.com> wrote
> in news:mou1bv$4au$1 at ger.gmane.org:
>
>> Problem was isolated and fixed by Corey Moyer. I will not submit patch
>> as I'm not original author of it, will just describe it:
>>
>> Python addons are crashing because of
>> https://github.com/xbmc/xbmc/blob/master/xbmc/interfaces/python/XBPython.
>> cpp#L565
>>
>> Patch would be to remove defined(TARGET_LINUX) from #if statement in
>> line above. I'm not sure if this issue affects all Linux builds (Kodi
>> 15.0 works fine on my Linux Mint 17.1).
>>
>> This is tested on Buildroot 2015.02 and 2015.05, Python 2.7.8, 2.7.9 and
>> 2.7.10.
>
> Hi,
>
> I never had any problems with python addons in Kodi, here is a snippet of
> my .config:
>
> BR2_PACKAGE_PYTHON=y
> BR2_PACKAGE_PYTHON_PY_ONLY=y
> # BR2_PACKAGE_PYTHON_PYC_ONLY is not set
> # BR2_PACKAGE_PYTHON_PY_PYC is not set
>
> Maybe these options have an influence?
>
> Regards, Bernd
>

Difference is that I have BR2_PACKAGE_PYTHON_PYC_ONLY selected but I'm 
not sure if that could be the case because everything was working with 
BR2_PACKAGE_PYTHON_PYC_ONLY as default option since XBMC 12 (I'm working 
with Amlogic SoCs).

I will test with BR2_PACKAGE_PYTHON_PY_ONLY enabled and patch disabled 
and will report back results.
