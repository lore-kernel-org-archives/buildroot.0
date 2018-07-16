From: =?utf-8?Q?Jean-Fran=C3=A7ois_T=C3=AAtu?= <jean-francois.tetu@savoirfairelinux.com>
Date: Mon, 16 Jul 2018 10:08:00 -0400 (EDT)
Subject: [Buildroot] [PATCH] package/squid: fix automake breakage
In-Reply-To: <9182911e-9411-dca6-d9ce-04de0b9f3965@mind.be>
References: <20180711193452.19461-1-jean-francois.tetu@savoirfairelinux.com>
 <e8dab288-fa61-b67f-a37a-d5f59023ad44@mind.be>
 <1471196708.10077896.1531356443377.JavaMail.zimbra@savoirfairelinux.com>
 <1273785525.10287869.1531419841244.JavaMail.zimbra@savoirfairelinux.com>
 <9182911e-9411-dca6-d9ce-04de0b9f3965@mind.be>
Message-ID: <1038067036.10841152.1531750080925.JavaMail.zimbra@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello


On Friday, July 13, 2018 6:10:47 AM, Arnout Vandecappelle wrote:
> On 12-07-18 20:24, Jean-Fran?ois T?tu wrote:
>> Hello Arnout,
>> 
>>> On Wednesday, July 11, 2018 5:08:13 PM, Arnout Vandecappelle wrote:
>>>>
>>>> However, have you also looked into the option of using Buildroot's libtool
>>>> instead of the bundled libltdl? If that doesn't work for some reason, I'd like
>>>> to add it in the commit log so a future developer who wants to give it go can
>>>> see what has been tried already.
>>>>
>> 
>> From what I understand, the packaged libltdl in Squid comes from its
>> bootstrap.
> 
> We probably don't want to use the bootstrap script :-)
> 
> What I meant was: make squid depend on libtool (target libtool, not host
> libtool), and remove libltdl from SUBDIRS in Makefile.am. Probably something
> goes wrong somewhere on the way, so that would have to be fixed as well.
> 

Yes, I see what you mean. I'll look into this and fix what breaks.

> Regards,
> Arnout
> 

--
Jean-Fran?ois T?tu
