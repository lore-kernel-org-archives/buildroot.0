From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 13 Dec 2015 14:43:10 +0100
Subject: [Buildroot] [PATCH 1/1] package/libhdhomerun: new package
References: <1450004296-5335-1-git-send-email-bernd.kuhls@t-online.de>
 <20151213113342.GF2318@tarshish>
 <ve20kcx3eu.ln2@ID-313208.user.individual.net>
 <20151213120353.GG2318@tarshish>
Message-ID: <e890kcx3eu.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch,

Am Sun, 13 Dec 2015 14:03:53 +0200 schrieb Baruch Siach:

> Hi Bernd,
> 
> On Sun, Dec 13, 2015 at 12:47:11PM +0100, Bernd Kuhls wrote:
>> Am Sun, 13 Dec 2015 13:33:42 +0200 schrieb Baruch Siach:
>> > 
>> > Are you sure this is not for staging?
>> 
>> yes, because it is not a script but a binary compiled for the target:
>> 
>> $ file /home/bernd/buildroot/br2_kodi16/output/target/usr/bin/
>> hdhomerun_config
>> /home/bernd/buildroot/br2_kodi16/output/target/usr/bin/
hdhomerun_config:
>> ELF 64-bit LSB executable, x86-64, version 1 (SYSV), dynamically
>> linked, interpreter /lib/ld64-uClibc.so.0, not stripped
> 
> This most likely matches your host. Is that your target as well?

coincidentally yes, here is the arm version:

$ file /home/bernd/buildroot/br2_kodi16/output/target/usr/bin/
hdhomerun_config
/home/bernd/buildroot/br2_kodi16/output/target/usr/bin/hdhomerun_config: 
ELF 32-bit LSB executable, ARM, EABI5 version 1 (SYSV), dynamically 
linked, interpreter /lib/ld-uClibc.so.0, not stripped

>> I am not sure whether the file is really needed on the target or not
>> but it is definitely not suited for staging.
> 
> Agreed. But is this file really intended for target use? Most library
> *_config files are only useful during build. What is the purpose of
> hdhomerun_config?

Honestly I do not know, so I sent v2 of my patch:
http://patchwork.ozlabs.org/patch/556182/
If someone misses hdhomerun_config a follow-up patch is needed ;)

Regards, Bernd
