From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 25 Nov 2013 23:56:24 +0100
Subject: [Buildroot] [PATCH 4/5] fs/custom: generate complete,
 partition-based device images
In-Reply-To: <20131125224548.GB3435@free.fr>
References: <cover.1385157864.git.yann.morin.1998@free.fr>
 <ddf2a31498f7f8e1ec0d40d73849bc254ec00b6d.1385157864.git.yann.morin.1998@free.fr>
 <52931907.2040207@mind.be> <20131125190551.GA3435@free.fr>
 <5293CEC8.9010601@mind.be> <20131125224548.GB3435@free.fr>
Message-ID: <5293D598.20408@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 25/11/13 23:45, Yann E. MORIN wrote:
> Arnout, All,
>
> On 2013-11-25 23:27 +0100, Arnout Vandecappelle spake thusly:
>> On 25/11/13 20:05, Yann E. MORIN wrote:
>>> Arnout,
>>>
>>> On 2013-11-25 10:31 +0100, Arnout Vandecappelle spake thusly:
[snip]
>>   Anyway, I think it should be:
>>
>> BUILD_DIR=$(BUILD_DIR) fs/custom/genimages \
>> 	'$(call qstrip,$(BR2_TARGET_ROOTFS_CUSTOM_PARTITION_TABLE))'
>
> I'm using double quotes here, now, instead of single quotes.
> Otherwise, consider it changed. Thanks!

  With double quotes, it will not actually be quoted because the 
ROOTFS_$(2)_CMD use adds another level of double quotes and they cancel out.

[snip]
>>>>   With python's ConfigParser, this file would be reduced to +- 20 lines...
>>>
>>> Does ConfigParser handles lines like:
>>>     key=$((4*1024))
>>
>>   Obviously not, it would have to be
>> key = 4*1024
>
> For my education, are the spaces required? Because they are not in .ini,
> and in fact should not be present.

  Actually I don't know. Checking the source: spaces are allowed:

     OPTCRE = re.compile(
         r'(?P<option>[^:=\s][^:=]*)'          # very permissive!
         r'\s*(?P<vi>[:=])\s*'                 # any number of space/tab,
                                               # followed by separator
                                               # (either : or =), followed
                                               # by any # space/tab
         r'(?P<value>.*)$'                     # everything up to eol
         )



  Regards,
  Arnout

[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
