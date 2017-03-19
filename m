From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 19 Mar 2017 23:31:36 +0100
Subject: [Buildroot] [PATCH v1] wiringpi: bump to version 2.44
In-Reply-To: <53182259-8ac8-de42-4ffb-ecd79e2597fe@mind.be>
References: <20170315210828.3784-1-ps.report@gmx.net>
 <20170318141428.0c4b6d36@free-electrons.com>
 <20170319222409.205633ad@gmx.net>
 <53182259-8ac8-de42-4ffb-ecd79e2597fe@mind.be>
Message-ID: <1cda02af-597a-5254-253e-5bcc84ac7ddd@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 19-03-17 23:28, Arnout Vandecappelle wrote:
> 
> 
> On 19-03-17 22:24, Peter Seiderer wrote:
>> Hello Thomas,
>>
>> On Sat, 18 Mar 2017 14:14:28 +0100, Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:
>>
>>> Hello,
>>>
>>> On Wed, 15 Mar 2017 22:08:28 +0100, Peter Seiderer wrote:
>>>> - rebase 0001-Adjust-for-buildroot-build.patch
>>>> - delete 0002-include-asm-ioctl.h-directly-for-_IOC_SIZEBITS.patch
>>>>   (all changes are incorporated into wiringpi-2.44)
>>>> - remove useless hash file (git download)
>>> Git downloads now generate reproducible tarballs, so we in fact want to
>>> add hashes for them as well. However, it is true that the hash is not
>>> checked currently. This has been on the TODO-list for a while.
>> Mhhh, tried several times, every time I get a different checksum:
>>
>> 	$ sha256sum dl/wiringpi-2.44.tar.gz 
>> 5324ed452b7adfb77d049ea49dfe8878605c6198cb5c706ae2b285a70fb9d096  dl/wiringpi-2.44.tar.gz
>>
>> 	$ sha256sum dl/wiringpi-2.44.tar.gz 
>> 65e6b3a916b940eec085222a28a5859b09e79e0020de2f2b07563d910426180c  dl/wiringpi-2.44.tar.gz
> 
> 
>  Really weird, both Yann and I tested and we got the same sha256sum as Thomas
> put in wiringpi.hash... So we are clearly still doing something wrong in the
> download helper.
> 
>  To help us nail down the problem, could you do:
> 
> tar -xf dl/wiringpi-2.44.tar.gz
> tar -tf dl/wiringpi-2.44.tar.gz | xargs sha256sum
> 
> and compare the output with https://gitlab.com/snippets/1655089/raw ?

 Oh, maybe it's in the timestamps, so also compare the output of

tar tvf ~/src/buildroot/dl/wiringpi-2.44.tar.gz

with https://gitlab.com/snippets/1655090/raw

 Regards,
 Arnout
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
