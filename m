From: Romain Naour <romain.naour@gmail.com>
Date: Wed, 18 Oct 2017 22:57:44 +0200
Subject: [Buildroot] [PATCH] powertop: needs autoreconf
In-Reply-To: <20171018193339.2t2asjcmkdjdzzsw@tarshish>
References: <dac9c0cd9a627b5c5500de6779f4aeca43fd0989.1508349837.git.baruch@tkos.co.il>
 <3d9c7e58-2980-e6f6-b23c-d85cff470769@gmail.com>
 <20171018193339.2t2asjcmkdjdzzsw@tarshish>
Message-ID: <46cdc0d9-85fc-e372-4512-f2472e6839e7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch,

Le 18/10/2017 ? 21:33, Baruch Siach a ?crit?:
> Hi Romain,
> 
> On Wed, Oct 18, 2017 at 08:58:55PM +0200, Romain Naour wrote:
>> Le 18/10/2017 ? 20:03, Baruch Siach a ?crit?:
>>> Commit 01048deab60 (package/powertop: bump to version 2.9) removed
>>> autoreconf even though the remaining patch touches Makefile.am. Fix
>>> this.
>>
>> Indeed...
>> I don't recall what happened, probably I had the intend to remove all patches
>> with the version bump but I finally re-added
>> 0001-dont-force-stack-smashing-protection.patch.
>>
>> The issue appear now following the automake bump 1.15.1.
>>
>>> Fixes:
>>> http://autobuild.buildroot.net/results/3bf/3bf8daee559e2978f8602c56397afda771299032/
>>> http://autobuild.buildroot.net/results/f9b/f9b4f113a333107a972fa51bd0347eeb0d52496f/
>>> http://autobuild.buildroot.net/results/067/0675826888b6f89e76291c7835839344300ca9f5/
>>>
>>> Cc: Romain Naour <romain.naour@gmail.com>
>>> Cc: Steven Noonan <steven@uplinklabs.net>
>>> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
>>> ---
>>>  package/powertop/powertop.mk | 2 ++
>>>  1 file changed, 2 insertions(+)
>>>
>>> diff --git a/package/powertop/powertop.mk b/package/powertop/powertop.mk
>>> index ce7a11875894..7c9c7ccc3f41 100644
>>> --- a/package/powertop/powertop.mk
>>> +++ b/package/powertop/powertop.mk
>>> @@ -12,6 +12,8 @@ POWERTOP_DEPENDENCIES = pciutils ncurses libnl host-pkgconf \
>>>  POWERTOP_LICENSE = GPL-2.0
>>>  POWERTOP_LICENSE_FILES = COPYING
>>>  POWERTOP_CONF_ENV = LIBS=$(TARGET_NLS_LIBS)
>>> +# Patching Makefile.am
>>
>> Maybe you can name the patch here
>> # 0001-dont-force-stack-smashing-protection.patch
>>
>>> +POWERTOP_AUTORECONF = YES
>>
>> Gettextize was needed with powertop 2.27, can you check if it's still needed ?
> 
> The build succeeds here without gettextize. The same config fails without the 
> patch with the same error as the autobuilder.

Thanks for checking :)

Best regards,
Romain

> 
> baruch
> 
