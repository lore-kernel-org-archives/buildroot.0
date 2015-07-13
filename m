From: Ryan Barnett <ryan.barnett@rockwellcollins.com>
Date: Mon, 13 Jul 2015 18:30:05 -0500
Subject: [Buildroot] [PATCH 1/1] linux: add server options for NFSD
In-Reply-To: <55A44820.3080406@mind.be>
References: <1436829189-90663-1-git-send-email-ryan.barnett@rockwellcollins.com>
 <55A44820.3080406@mind.be>
Message-ID: <CAMQcK5K5HTDzfSkcifjsKSdxjsWBE4uvosPTrObkAC3abcyFTg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,

On Mon, Jul 13, 2015 at 6:22 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 07/14/15 01:13, Ryan Barnett wrote:
>> When nfs-utils packages is selected, automatically enable the kernel
>> options for NFSD. This will allow for an NFS server to work by only
>> adding /etc/exports to the filesystem.
>>
>> Signed-off-by: Ryan Barnett <ryan.barnett@rockwellcollins.com>
>> ---
>>
>> Test with qemu_x86_defconfig
>>
>> Signed-off-by: Ryan Barnett <ryan.barnett@rockwellcollins.com>
>> ---
>>  linux/linux.mk | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/linux/linux.mk b/linux/linux.mk
>> index b602a04..ef876c4 100644
>> --- a/linux/linux.mk
>> +++ b/linux/linux.mk
>> @@ -229,6 +229,9 @@ define LINUX_KCONFIG_FIXUP_CMDS
>>       $(if $(BR2_PACKAGE_XTABLES_ADDONS),
>>               $(call KCONFIG_ENABLE_OPT,CONFIG_NF_CONNTRACK,$(@D)/.config)
>>               $(call KCONFIG_ENABLE_OPT,CONFIG_NF_CONNTRACK_MARK,$(@D)/.config))
>> +     $(if $(BR2_PACKAGE_NFS_UTILS),
>> +             $(call KCONFIG_ENABLE_OPT,CONFIG_NFSD,$(@D)/.config)
>> +             $(call KCONFIG_ENABLE_OPT,CONFIG_NFSD_V4,$(@D)/.config))
>
>  Since v4 is currently disabled in nfs-utils, this isn't useful at the moment,
> right?

Hmm - good catch I just assumed that it had the support enabled. I
will send an update to just support CONFIG_NFSD.

Thanks,
-Ryan

-- 
Ryan Barnett / Sr Software Engineer
Airborne Information Systems / Security Systems and Software
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
ryan.barnett at rockwellcollins.com
www.rockwellcollins.com
