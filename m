From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 16 Jul 2018 19:53:11 +0200
Subject: [Buildroot] [PATCH] package/squid: fix automake breakage
In-Reply-To: <1038067036.10841152.1531750080925.JavaMail.zimbra@savoirfairelinux.com>
References: <20180711193452.19461-1-jean-francois.tetu@savoirfairelinux.com>
 <e8dab288-fa61-b67f-a37a-d5f59023ad44@mind.be>
 <1471196708.10077896.1531356443377.JavaMail.zimbra@savoirfairelinux.com>
 <1273785525.10287869.1531419841244.JavaMail.zimbra@savoirfairelinux.com>
 <9182911e-9411-dca6-d9ce-04de0b9f3965@mind.be>
 <1038067036.10841152.1531750080925.JavaMail.zimbra@savoirfairelinux.com>
Message-ID: <db0e77c3-bd3a-63f0-5fcb-fb48480c9416@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 16-07-18 16:08, Jean-Fran?ois T?tu wrote:
> Hello
> 
> 
> On Friday, July 13, 2018 6:10:47 AM, Arnout Vandecappelle wrote:
>> On 12-07-18 20:24, Jean-Fran?ois T?tu wrote:
>>> Hello Arnout,
>>>
>>>> On Wednesday, July 11, 2018 5:08:13 PM, Arnout Vandecappelle wrote:
>>>>>
>>>>> However, have you also looked into the option of using Buildroot's libtool
>>>>> instead of the bundled libltdl? If that doesn't work for some reason, I'd like
>>>>> to add it in the commit log so a future developer who wants to give it go can
>>>>> see what has been tried already.
>>>>>
>>>
>>> From what I understand, the packaged libltdl in Squid comes from its
>>> bootstrap.
>>
>> We probably don't want to use the bootstrap script :-)
>>
>> What I meant was: make squid depend on libtool (target libtool, not host
>> libtool), and remove libltdl from SUBDIRS in Makefile.am. Probably something
>> goes wrong somewhere on the way, so that would have to be fixed as well.
>>
> 
> Yes, I see what you mean. I'll look into this and fix what breaks.

 Great!

 Note that in the meantime, Thomas has reverted the automake bump as a quick way
to fix the issue. So when you repost, please also include the automake bump in
the series (the squid update should be the first patch, the automake bump the
second one).

 Thanks!

 Regards,
 Arnout

> 
>> Regards,
>> Arnout
>>
> 
> --
> Jean-Fran?ois T?tu
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
