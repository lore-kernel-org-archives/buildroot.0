From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 17 Nov 2015 23:54:12 +0100
Subject: [Buildroot] [PATCH] pkg-download: support file:// in
 BR2_PRIMARY_SITE
In-Reply-To: <20151117175558.156ea1f0@free-electrons.com>
References: <1447776478-16046-1-git-send-email-jezz@sysmic.org>
 <20151117175558.156ea1f0@free-electrons.com>
Message-ID: <564BB014.6030809@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 17-11-15 17:55, Thomas Petazzoni wrote:
> Dear J?r?me Pouiller,
> 
> On Tue, 17 Nov 2015 17:07:58 +0100, J?r?me Pouiller wrote:
>> This feature was already discuted here:
>>
>>   http://lists.busybox.net/pipermail/buildroot/2015-April/125419.html
>>
>> Personally, I have a big central directory with all tarballs I have
>> ever downloaded. I use this feature to isolate tarballs necessary to
>> build a configuration:
>>
>>   make project_defconfig
>>   make BR2_DL_DIR=/tmp/mirror-project BR2_PRIMARY_SITE=file:///home/user/dl source
>>   tar -C /tmp -czvf mirror-project.tgz mirror-project
> 
> You have a much simpler option:
> 
> 	make external-deps

 You probably mean:

for file in $(make external-deps); cp dl/$file /tmp/mirror-project; done


 I think a local file PRIMARY_SITE can be useful for other situations as well,
e.g. a slow CIFS-mounted shared download location that is too slow to use as
DL_DIR, so I think the feature has merit.

 Regards,
 Arnout


> 
> Thomas
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
