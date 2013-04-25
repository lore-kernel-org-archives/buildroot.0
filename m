From: Mark Jackson <mpfj-list@newflow.co.uk>
Date: Thu, 25 Apr 2013 08:49:52 +0100
Subject: [Buildroot] [PATCH] fs/ubifs: factorize all the "depends on"
 into "if...endif" blocks
In-Reply-To: <20130424212620.GC24710@free.fr>
References: <5177D061.6020905@newflow.co.uk> <20130424212620.GC24710@free.fr>
Message-ID: <5178E020.4050605@newflow.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 24/04/13 22:26, Yann E. MORIN wrote:
> Mark, All,
> 
> On Wed, Apr 24, 2013 at 01:30:25PM +0100, Mark Jackson wrote:
>> All the UBIFS options use "depends on BR2_TARGET_ROOTFS_UBIFS" but
>> we can simplify the config file by enclosing them in an "if..endif"
>> block.
>>
>> We also do the same for the "depends on BR2_TARGET_ROOTFS_UBI".
> 
> A few comments below (mostly nitpicking, but hey! ;-) )
> 
>> Signed-off-by: Mark Jackson <mpfj@newflow.co.uk>
>> ---
>>  fs/ubifs/Config.in |   18 ++++++++----------
>>  1 file changed, 8 insertions(+), 10 deletions(-)
>>
>> diff --git a/fs/ubifs/Config.in b/fs/ubifs/Config.in
>> index f17c7dc..c1d2ce7 100644
>> --- a/fs/ubifs/Config.in
>> +++ b/fs/ubifs/Config.in
>> @@ -3,21 +3,20 @@ config BR2_TARGET_ROOTFS_UBIFS
>>  	help
>>  	  Build a ubifs root filesystem
>>  
>> +if BR2_TARGET_ROOTFS_UBIFS
> [--SNIP--]
>> +if BR2_TARGET_ROOTFS_UBI
> [--SNIP--]
>> +endif
>> +
>> +endif
> 
> Comment the endif-s so we know at a glance to which if they belong to:
> 
> +endif # BR2_TARGET_ROOTFS_UBI
> +
> +endif # BR2_TARGET_ROOTFS_UBIFS

I *very* nearly put those in anyway, but checked with a few other Config.in files
and none of them had such closing comments.

> With that fixed:
> Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

I'll post a v2.

Cheers
Mark J.
