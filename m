From: =?UTF-8?B?U3RlZmFuIEZyw7ZiZXJn?= <stefan.froberg@petroprogram.com>
Date: Sat, 23 Feb 2013 14:58:00 +0200
Subject: [Buildroot] [PATCH] new package: adns
In-Reply-To: <5128BA82.1080501@mind.be>
References: <1360959402-24775-1-git-send-email-stefan.froberg@petroprogram.com>
 <20130216030625.04d9545d@skate> <5128A8C4.6040804@petroprogram.com>
 <5128BA82.1080501@mind.be>
Message-ID: <5128BCD8.5030807@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

23.2.2013 14:48, Arnout Vandecappelle kirjoitti:
> On 23/02/13 12:32, Stefan Fr?berg wrote:
>> Hi Thomas
>>
>> 16.2.2013 4:06, Thomas Petazzoni kirjoitti:
>>> Dear Stefan Fr?berg,
>>>
>>> Thanks for this package, definitely something useful to have.
>>>
>>> On Fri, 15 Feb 2013 22:16:42 +0200, Stefan Fr?berg wrote:
>>>> GNU adns
>>>>
>>>> Advanced, easy to use, asynchronous-capable DNS client library and
>>>> utilities.
>>>>
>>>> adns is a resolver library for C (and C++) programs, and a
>>>> collection of
>>>> useful DNS resolver utilities.
>>>>
>>>> Signed-off-by: Stefan Fr?berg <stefan.froberg@petroprogram.com>
>>>> ---
>>>>   package/Config.in                      |    1 +
>>>>   package/adns/Config.in                 |    7 +
>>>>   package/adns/adns-1.4-cnamechain.patch | 1275 +++++++++++++++
>>>>   package/adns/adns-1.4-destdir.patch    |   54 +
>>>>   package/adns/adns-1.4-ipv6.patch       | 2725
>>>> ++++++++++++++++++++++++++++++++
>>>>   package/adns/adns-1.4-rh514838.patch   |   26 +
>>> If possible, I think I would prefer to have the adns package download
>>> those patches rather than have them in the Buildroot source tree
>>> directly.
>>>
>>> ADNS_PATCHES = http://somewhere.com/foobar.patch \
>>>     http://somewhereelse.com/barfoo.patch
>>>
>>> I am not sure if the patch that allows that has already been merged
>>> upstream, but it has been floating on the list for some time, and I
>>> think it's a good thing to have.
>>
>> I tried to contact upstream about these patches but got no response.
>>
>> So is it's ok to include them in buildroot or should I try to search
>> home for them ?
>
>  What Thomas means is this:
>
> It looks like you directly fetched these patches from some mailing
> list archive. Then it would be cleaner to let buildroot download them
> from there, rather than copying the patch in the buildroot tree.
>

Yes, that adns-1.4-cnamechain.patch is originally from their mailing
list but Gentoo hosts it too:
http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/net-libs/adns/files/adns-1.4-cnamechain.patch

However, here's the problem:
As you can see that cnamechain patch is patch level -p0
But those others patches are not.

Even worse, that adns-1.4-rh514838.patch (patch level -p1) is extracted
from Fedora src.rpm file.

And that adns-1.4-destdir.patch, AFAIK, can only be located from here
(and is also patch level -p0)
https://build.opensuse.org/package/view_file?file=adns-1.4-destdir.patch&package=adns&project=devel%3Alibraries%3Ac_c%2B%2B

So it's a mess and I don't think using direct download method will ever
work for this complete patch set.

>
>  If for whatever reason it is difficult to retrieve from the 'net,
> then it would be nice if you could clean up the patches a little. Some
> of them even create a .orig file...
>
>
>> (currently they are on my server but I don't know how long I can keep
>> them there,
>> keeping enterprise ready Internet connection is not exactly cheap here)
>>
>> Those adns patches can be grabbed from here:
>> http://www.micro-os.com/
>
>  No, we don't want to ask you to host those patches - then it's better
> to keep them in the buildroot tree.
>

That would be great!

>  Regards,
>  Arnout
>
>

Regards
Stefan
