From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Thu, 19 Dec 2013 11:36:51 +0100
Subject: [Buildroot] [PATCH] lvm2: disable statical building because it
	fails
In-Reply-To: <20131217101137.5c8845a3@skate>
References: <1387263739-3831-1-git-send-email-fabio.porcedda@gmail.com>
 <20131217101137.5c8845a3@skate>
Message-ID: <CAHkwnC9+nr6zX7n-ZYoak-=iT1ZysDL8UoNGe2H7ghuFscS8Ew@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Dec 17, 2013 at 10:11 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Fabio Porcedda,
>
> On Tue, 17 Dec 2013 08:02:19 +0100, Fabio Porcedda wrote:
>> Fixes:
>> http://autobuild.buildroot.net/results/b0b/b0b386969459dda9c294f1ccb4927ca225fa6bdd/
>>
>> Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
>> ---
>>  package/lvm2/Config.in | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/package/lvm2/Config.in b/package/lvm2/Config.in
>> index 5d6209fc1..29b80ee 100644
>> --- a/package/lvm2/Config.in
>> +++ b/package/lvm2/Config.in
>> @@ -2,6 +2,7 @@ config BR2_PACKAGE_LVM2
>>       bool "lvm2 & device mapper"
>>       depends on BR2_LARGEFILE
>>       depends on BR2_USE_MMU # needs fork()
>> +     depends on !BR2_PREFER_STATIC_LIB # It fails to build statically
>>       help
>>         This is LVM2, the rewrite of The Linux Logical Volume Manager.
>>         LVM supports enterprise level volume management of disk and disk
>
> Thanks, but you forgot to propagate this new dependency to the reverse
> dependencies of lvm2, and you forgot to add the corresponding comment.
> See
> http://buildroot.org/downloads/manual/manual.html#dependencies-target-toolchain-options.

Ok, thanks, i will send an updated patch.

Best regards
-- 
Fabio Porcedda
