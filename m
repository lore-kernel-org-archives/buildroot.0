From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 23 Feb 2013 13:48:02 +0100
Subject: [Buildroot] [PATCH] new package: adns
In-Reply-To: <5128A8C4.6040804@petroprogram.com>
References: <1360959402-24775-1-git-send-email-stefan.froberg@petroprogram.com>
 <20130216030625.04d9545d@skate> <5128A8C4.6040804@petroprogram.com>
Message-ID: <5128BA82.1080501@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 23/02/13 12:32, Stefan Fr?berg wrote:
> Hi Thomas
>
> 16.2.2013 4:06, Thomas Petazzoni kirjoitti:
>> Dear Stefan Fr?berg,
>>
>> Thanks for this package, definitely something useful to have.
>>
>> On Fri, 15 Feb 2013 22:16:42 +0200, Stefan Fr?berg wrote:
>>> GNU adns
>>>
>>> Advanced, easy to use, asynchronous-capable DNS client library and utilities.
>>>
>>> adns is a resolver library for C (and C++) programs, and a collection of
>>> useful DNS resolver utilities.
>>>
>>> Signed-off-by: Stefan Fr?berg <stefan.froberg@petroprogram.com>
>>> ---
>>>   package/Config.in                      |    1 +
>>>   package/adns/Config.in                 |    7 +
>>>   package/adns/adns-1.4-cnamechain.patch | 1275 +++++++++++++++
>>>   package/adns/adns-1.4-destdir.patch    |   54 +
>>>   package/adns/adns-1.4-ipv6.patch       | 2725 ++++++++++++++++++++++++++++++++
>>>   package/adns/adns-1.4-rh514838.patch   |   26 +
>> If possible, I think I would prefer to have the adns package download
>> those patches rather than have them in the Buildroot source tree
>> directly.
>>
>> ADNS_PATCHES = http://somewhere.com/foobar.patch \
>> 	http://somewhereelse.com/barfoo.patch
>>
>> I am not sure if the patch that allows that has already been merged
>> upstream, but it has been floating on the list for some time, and I
>> think it's a good thing to have.
>
> I tried to contact upstream about these patches but got no response.
>
> So is it's ok to include them in buildroot or should I try to search
> home for them ?

  What Thomas means is this:

It looks like you directly fetched these patches from some mailing list 
archive. Then it would be cleaner to let buildroot download them from 
there, rather than copying the patch in the buildroot tree.


  If for whatever reason it is difficult to retrieve from the 'net, then 
it would be nice if you could clean up the patches a little. Some of them 
even create a .orig file...


> (currently they are on my server but I don't know how long I can keep
> them there,
> keeping enterprise ready Internet connection is not exactly cheap here)
>
> Those adns patches can be grabbed from here:
> http://www.micro-os.com/

  No, we don't want to ask you to host those patches - then it's better 
to keep them in the buildroot tree.

  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
