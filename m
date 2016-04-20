From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 20 Apr 2016 22:18:02 +0200
Subject: [Buildroot] [PATCH] [RFC] U-Boot: don't check hashes for U-Boot
 external patches
In-Reply-To: <57174233.9040302@free.fr>
References: <1460644321-13849-1-git-send-email-julien.boibessot@free.fr>
 <57100509.8040804@mind.be> <57100ABB.8090206@mind.be>
 <5714B6C2.6020204@free.fr> <57156B4C.9090203@mind.be>
 <57174233.9040302@free.fr>
Message-ID: <5717E3FA.4010601@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/20/16 10:47, Julien Boibessot wrote:
> On 19/04/2016 01:18, Arnout Vandecappelle wrote:
>> On 04/18/16 12:28, Julien Boibessot wrote:
>>> Hello,
>>>
>>> Arnout,
>>>
>>> thanks for the comments.
>>>
>>> On 14/04/2016 23:25, Arnout Vandecappelle wrote:
>> [snip]
>>>>
>>>>    Oh, and something similar should be done for LINUX_PATCH as well.
>>>
>>> LINUX_PATCH is already working well with external patches that have to
>>> be downloaded.
>>
>>   Of course, because we don't have a linux.hash and probably never will
>> have one.
>
> ah ok, got it now ! :-)
> So why can't we just get rid of uboot.hash too ?

  I don't think so.

  For the kernel, it is very unlikely that you just use the latest version, most 
projects will want a specific version and usually even a patched version. With 
device trees this becomes somewhat less true, but even so, most people just 
don't use the latest-and-greatest kernel. Therefore, having hashes is quite useless.

  For u-boot (and barebox for that matter), this also used to be the case, but 
nowadays you can very often get away with just using the upstream version. In 
this case, the hash is indeed valuable.

  Cc-ing Yann, our hash expert :-)

  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
