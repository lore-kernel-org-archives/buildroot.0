From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Wed, 29 Aug 2018 21:49:59 +0200
Subject: [Buildroot] [PATCH] package/squashfs: fix build on hosts with
 glibc >= 2.28
In-Reply-To: <20180827063731.m3xm4jamqyugxfwm@sapphire.tkos.co.il>
References: <20180825200751.28097-1-richard.kunze@web.de>
 <20180827063731.m3xm4jamqyugxfwm@sapphire.tkos.co.il>
Message-ID: <fe0218a6-d535-f476-c44a-4891d979d56d@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Richard,

Il 27/08/2018 08:37, baruch at tkos.co.il (Baruch Siach) ha scritto:
> Hi Richard,
> 
> Thanks for your contribution. Please find a few comments below.
> 
> On Sat, Aug 25, 2018 at 10:07:51PM +0200, Richard Kunze wrote:
>> Since glibc 2.28, sys/sysmacros.h is no longer included from sys/types.h
>> This patch fixes the resulting build error by explicitly including
>> sys/sysmacros.h
>>
>> Signed-off-by: Richard Kunze <richard.kunze@web.de>
>> ---
>>   package/squashfs/0001-include-sysmacros.patch | 19 +++++++++++++++++++
>>   1 file changed, 19 insertions(+)
>>   create mode 100644 package/squashfs/0001-include-sysmacros.patch
>>
>> diff --git a/package/squashfs/0001-include-sysmacros.patch b/package/squashfs/0001-include-sysmacros.patch
>> new file mode 100644
>> index 0000000000..56d9a742e7
>> --- /dev/null
>> +++ b/package/squashfs/0001-include-sysmacros.patch
> 
> Patches should have a description and sign-off. See the patches chapter in the
> Buildroot manual:
> 
>    https://buildroot.org/downloads/manual/manual.html#patch-policy
> 
> It would also be nice to add a note about the upstream status of this patch.

I've faced the same issue(glibc 2.28 sys/sysmacros.h) on atop package.

I point you the commit so you can inspire to that:
https://github.com/buildroot/buildroot/commit/4ffde065d2829d90cddc70f7c2e8f5775e59cbe9

Thomas Petazzoni helped me to write that commit log and improved it.

Sorry if there's some problem with e-mail answer but I've lost this 
e-mail and took it from archive by hand.

Giulio Benetti
