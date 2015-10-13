From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 13 Oct 2015 23:14:19 +0200
Subject: [Buildroot] [PATCH v2 2/2] axfs: add new filesystem type
In-Reply-To: <20151013202408.GA4161@free.fr>
References: <1444064102-13575-1-git-send-email-ariel@vanguardiasur.com.ar>
 <1444064102-13575-3-git-send-email-ariel@vanguardiasur.com.ar>
 <5612C712.6020209@mind.be> <561CF52D.3090609@vanguardiasur.com.ar>
 <20151013202408.GA4161@free.fr>
Message-ID: <561D742B.4050800@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 13-10-15 22:24, Yann E. MORIN wrote:
> Ariel, All,
> 
> On 2015-10-13 09:12 -0300, Ariel D'Alessandro spake thusly:
>> El 05/10/15 a las 15:53, Arnout Vandecappelle escribi?:
> [--SNIP--]
>>>> +define ROOTFS_AXFS_CMD
>>>> +	$(HOST_DIR)/usr/bin/mkfs.axfs -s -a $(TARGET_DIR) $@
>>>
>>>  I'm not sure if we really want to give the -s option. Is it very verbose?
>>> Generally I like a bit of feedback about how the filesystem is built, and we do
>>> get it for e.g. squashfs.
>>
>> Yeah, I think it's very verbose. But on the other hand, with the -s
>> option it's too quiet.
>> I don't know what is the main criteria. Maybe you can tell me, here's
>> the output of two mkfs.axfs executions with and without -s option:
>>
>> --
>> $ ./mkfs.axfs -s -a target/ output/
>> number of files:                   585
>> number of 4KB nodes:               1752
>>
>> Total image size:                       5111906
>> --
>>
>> --
>> $ ./mkfs.axfs -a target/ output/
> [--SNIP--]
>> Total image size:                       5111906
> 
> IMHO, the non-silent version is way too verbose. I'd prefer that the -s
> flag be used.
> 
> Arnout, OK for you?

 I believe mksquashfs is equally verbose. But it's OK for me either way.

 Regards,
 Arnout

-- 
Arnout Vandecappelle      arnout dot vandecappelle at essensium dot com
Senior Embedded Software Architect . . . . . . +32-478-010353 (mobile)
Essensium, Mind division . . . . . . . . . . . . . . http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium . . . . . BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
