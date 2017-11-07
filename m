From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Tue, 7 Nov 2017 21:22:56 +0100
Subject: [Buildroot] [PATCH 1/1] add qmake.conf fixup for sunxi-mali
 platforms
In-Reply-To: <fd2c8e8f-ebe0-79a7-df05-a4c2bc01ba11@mind.be>
References: <1510066081-35701-1-git-send-email-giulio.benetti@micronovasrl.com>
 <002cc8ca-ccf5-7610-905a-735e0740d942@micronovasrl.com>
 <fd2c8e8f-ebe0-79a7-df05-a4c2bc01ba11@mind.be>
Message-ID: <e96e3434-e0f5-23c4-0e31-887564e331a0@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Perfect,

tomorrow I submit a patch.

Thanks
Cheers

Il 07/11/2017 21:21, Arnout Vandecappelle ha scritto:
>
> On 07-11-17 19:58, Giulio Benetti wrote:
>> This patch is buggy.
>> The same for Gary Bisson patch.
>> Must put "EGLFS_DEVICE_INTEGRATION = eglfs_mali"
>> before:
>>
>> include(../common/linux_device_post.conf)
>> load(qt_config)
>>
>> otherwise qmake ignores it.
>> I thought to use sed to append EGLFS_DEVICE_INTEGRATION = eglfs_mali/viv just
>> after include(arch.conf).
>   Yes, with sed is a good idea. Preferably by renaming qmake.conf to
> qmake.conf.in and always using sed to generate the actual qmake.conf file. Add a
> line
>
> EGLFS_DEVICE_INTEGRATION = @EGLFS_DEVICE@
>
> at the appropriate place. The sed then either replaces @EGLFS_DEVICE@ with the
> proper string, or deletes the line.
>
>   Regards,
>   Arnout
>
>> What do you think?
> [snip]
>

-- 
Giulio Benetti
R&D Manager &
Advanced Research

MICRONOVA SRL
Sede: Via A. Niedda 3 - 35010 Vigonza (PD)
Tel. 049/8931563 - Fax 049/8931346
Cod.Fiscale - P.IVA 02663420285
Capitale Sociale ? 26.000 i.v.
Iscritta al Reg. Imprese di Padova N. 02663420285
Numero R.E.A. 258642
