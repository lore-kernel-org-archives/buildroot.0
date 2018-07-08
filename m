From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 8 Jul 2018 13:33:31 +0200
Subject: [Buildroot] [PATCH] package/automake: bump version to 1.16.1
In-Reply-To: <20180708105642.GD2474@scaer>
References: <20180706212709.10376-1-jean-francois.tetu@savoirfairelinux.com>
 <13b9a287-31bf-fc90-5d49-ba78cb68b002@mind.be>
 <438109890.9050032.1531017842188.JavaMail.zimbra@savoirfairelinux.com>
 <20180708105642.GD2474@scaer>
Message-ID: <62e4e8e3-5992-e9b5-fecc-9c4576760d52@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 08-07-18 12:56, Yann E. MORIN wrote:
> Jean-Fran?ois, All,
> 
> On 2018-07-07 22:44 -0400, Jean-Fran?ois T?tu spake thusly:
>> On Saturday, July 7, 2018 5:31:11 PM, Arnout Vandecappelle wrote:
>>> automake is a package that runs a risk of breaking other packages using it.
>>> Would you be willing to monitor the autobuild results in the coming weeks to
>>> find and fix breakage caused by this bump?
>>
>> Gladly, I'll monitor the daily autobuild results and fix whatever breaks.
> 
> It looks liek we have our first automake-bump related issues piling up:
> 
>     http://autobuild.buildroot.org/results/221/2215acb7e011b9fd469217abbc319941f8f6ee61/build-end.log

 Looks like the AUTORECONF = YES doesn't propagate into the libltdl directory.
Makes me think though: can't we use the libltdl from the libtool package?

>     http://autobuild.buildroot.org/results/13d/13d600c8b33017793cd0dbdd5d204ba0b01924a5/build-end.log

 This one looks like a problem with the timestamps, triggering an
autoreconfigure though none is needed.

 Regards,
 Arnout

> 
> Care to have a look?
> 
> Regards,
> Yann E. MORIN.
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
