From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 12 Mar 2013 18:42:10 +0100
Subject: [Buildroot] [PATCH 4/6] fs/ext2: use the ext2 variant to name
 the generated rootfs image
In-Reply-To: <20130310145501.7e5dec1f@skate>
References: <cover.1362693453.git.yann.morin.1998@free.fr>
 <1d86b1b76a2c56aaf0098ec389e570862e7aa3fb.1362693453.git.yann.morin.1998@free.fr>
 <20130310145501.7e5dec1f@skate>
Message-ID: <513F68F2.5050009@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/10/13 14:55, Thomas Petazzoni wrote:
> Dear Yann E. MORIN,
>
> On Thu,  7 Mar 2013 23:04:41 +0100, Yann E. MORIN wrote:
>> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>> Cc: Arnout Vandecappelle <arnout@mind.be>
>> ---
>>   fs/ext2/ext2.mk |    2 +-
>>   1 files changed, 1 insertions(+), 1 deletions(-)
>>
>> diff --git a/fs/ext2/ext2.mk b/fs/ext2/ext2.mk
>> index 1660d9c..57acad7 100644
>> --- a/fs/ext2/ext2.mk
>> +++ b/fs/ext2/ext2.mk
>> @@ -29,4 +29,4 @@ define ROOTFS_EXT2_CMD
>>   	PATH=$(TARGET_PATH) $(EXT2_ENV) fs/ext2/genext2fs.sh -d $(TARGET_DIR) $(EXT2_OPTS) $@
>>   endef
>>
>> -$(eval $(call ROOTFS_TARGET,ext2))
>> +$(eval $(call ROOTFS_TARGET,ext2,ext$(BR2_TARGET_ROOTFS_EXT2_GEN)))
>
> It is not a very strong opinion here, but I'm not sure I like this idea
> of the file extension being dependent on BR2_TARGET_ROOTFS_EXT2_GEN.
>
> I think I would have preferred something that renames the filesystem
> to:
>
> $(eval $(call ROOTFS_TARGET,ext))
>
> which generates a rootfs.ext image, with a compatibility symbolic link
> ext2 -> ext. This can for example be done in a
> ROOTFS_EXT_POST_GEN_HOOKS.

  That sounds like a good idea to me.

  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
