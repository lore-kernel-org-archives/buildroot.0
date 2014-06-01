From: Spenser Gilliland <spenser@gillilanding.com>
Date: Sun, 1 Jun 2014 13:02:53 -0500
Subject: [Buildroot] [PATCH 1/2] busybox: add fbset to default configs
In-Reply-To: <20140601174228.GK3430@free.fr>
References: <1401644248-27612-1-git-send-email-hadrien.boutteville@gmail.com>
 <20140601174228.GK3430@free.fr>
Message-ID: <CAEBucnC8Vg1fvFW9NA15ffL0k4f61gAh2Gvpk1pXiP+swN9e7g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hadrien,

On Sun, Jun 1, 2014 at 12:42 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Hadrien, All,
>
> On 2014-06-01 19:37 +0200, Hadrien Boutteville spake thusly:
>> Some drivers (like ti-gfx) need fbset and we can't select it when we
>> use BusyBox because it is provided by BusyBox and as a package.
>>
>> Signed-off-by: Hadrien Boutteville <hadrien.boutteville@gmail.com>
>
> Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: "Spenser Gilliland" <spenser@gillilanding.com>
>
> Regards,
> Yann E. MORIN.
>
>> ---
>>  package/busybox/busybox-1.19.x.config | 6 +++---
>>  package/busybox/busybox-1.20.x.config | 6 +++---
>>  package/busybox/busybox-1.21.x.config | 6 +++---
>>  package/busybox/busybox-1.22.x.config | 6 +++---
>>  4 files changed, 12 insertions(+), 12 deletions(-)
>>
>> diff --git a/package/busybox/busybox-1.19.x.config b/package/busybox/busybox-1.19.x.config
>> index bf5e8df..08e14c7 100644
>> --- a/package/busybox/busybox-1.19.x.config
>> +++ b/package/busybox/busybox-1.19.x.config
>> @@ -525,9 +525,9 @@ CONFIG_BLKID=y
>>  # CONFIG_FEATURE_BLKID_TYPE is not set
>>  CONFIG_DMESG=y
>>  CONFIG_FEATURE_DMESG_PRETTY=y
>> -# CONFIG_FBSET is not set
>> -# CONFIG_FEATURE_FBSET_FANCY is not set
>> -# CONFIG_FEATURE_FBSET_READMODE is not set
>> +CONFIG_FBSET=y
>> +CONFIG_FEATURE_FBSET_FANCY=y
>> +CONFIG_FEATURE_FBSET_READMODE=y
>>  CONFIG_FDFLUSH=y
>>  CONFIG_FDFORMAT=y
>>  # CONFIG_FDISK is not set
>> diff --git a/package/busybox/busybox-1.20.x.config b/package/busybox/busybox-1.20.x.config
>> index 5525434..085d43c 100644
>> --- a/package/busybox/busybox-1.20.x.config
>> +++ b/package/busybox/busybox-1.20.x.config
>> @@ -539,9 +539,9 @@ CONFIG_BLKID=y
>>  # CONFIG_FEATURE_BLKID_TYPE is not set
>>  CONFIG_DMESG=y
>>  CONFIG_FEATURE_DMESG_PRETTY=y
>> -# CONFIG_FBSET is not set
>> -# CONFIG_FEATURE_FBSET_FANCY is not set
>> -# CONFIG_FEATURE_FBSET_READMODE is not set
>> +CONFIG_FBSET=y
>> +CONFIG_FEATURE_FBSET_FANCY=y
>> +CONFIG_FEATURE_FBSET_READMODE=y
>>  CONFIG_FDFLUSH=y
>>  CONFIG_FDFORMAT=y
>>  # CONFIG_FDISK is not set
>> diff --git a/package/busybox/busybox-1.21.x.config b/package/busybox/busybox-1.21.x.config
>> index e46b528..fbae26e 100644
>> --- a/package/busybox/busybox-1.21.x.config
>> +++ b/package/busybox/busybox-1.21.x.config
>> @@ -541,9 +541,9 @@ CONFIG_BLKID=y
>>  # CONFIG_FEATURE_BLKID_TYPE is not set
>>  CONFIG_DMESG=y
>>  CONFIG_FEATURE_DMESG_PRETTY=y
>> -# CONFIG_FBSET is not set
>> -# CONFIG_FEATURE_FBSET_FANCY is not set
>> -# CONFIG_FEATURE_FBSET_READMODE is not set
>> +CONFIG_FBSET=y
>> +CONFIG_FEATURE_FBSET_FANCY=y
>> +CONFIG_FEATURE_FBSET_READMODE=y
>>  CONFIG_FDFLUSH=y
>>  CONFIG_FDFORMAT=y
>>  # CONFIG_FDISK is not set
>> diff --git a/package/busybox/busybox-1.22.x.config b/package/busybox/busybox-1.22.x.config
>> index e8db3bc..544b82f 100644
>> --- a/package/busybox/busybox-1.22.x.config
>> +++ b/package/busybox/busybox-1.22.x.config
>> @@ -544,9 +544,9 @@ CONFIG_BLKID=y
>>  # CONFIG_FEATURE_BLKID_TYPE is not set
>>  CONFIG_DMESG=y
>>  CONFIG_FEATURE_DMESG_PRETTY=y
>> -# CONFIG_FBSET is not set
>> -# CONFIG_FEATURE_FBSET_FANCY is not set
>> -# CONFIG_FEATURE_FBSET_READMODE is not set
>> +CONFIG_FBSET=y
>> +CONFIG_FEATURE_FBSET_FANCY=y
>> +CONFIG_FEATURE_FBSET_READMODE=y
>>  CONFIG_FDFLUSH=y
>>  CONFIG_FDFORMAT=y
>>  # CONFIG_FDISK is not set
>> --
>> 1.9.3
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot



-- 
Spenser Gilliland
Computer Engineer
Doctoral Candidate
