From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 25 Nov 2017 17:47:37 +0100
Subject: [Buildroot] [PATCH 1/1] ntp: add patch to support for libressl
In-Reply-To: <20171125124348.GA2798@scaer>
References: <20171108121143.5411-1-aduskett@gmail.com>
 <20171123225155.73a4da45@windsurf.lan> <20171125124348.GA2798@scaer>
Message-ID: <c9dd87ea-ff9d-bd3b-aa37-8c04f6e1a6a0@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 25-11-17 13:43, Yann E. MORIN wrote:
> Thomas, All,
> 
> On 2017-11-23 22:51 +0100, Thomas Petazzoni spake thusly:
>> On Wed,  8 Nov 2017 07:11:43 -0500, Adam Duskett wrote:
>>> NTP currently fails to compile against LibreSSL because of checks used
>>> to determine the SSL library version.
>>>
>>> Upstream-Status: Pending
>>> http://bugs.ntp.org/show_bug.cgi?id=3401#c3
>>>
>>> Signed-off-by: Adam Duskett <aduskett@gmail.com>
>>
>> Arnout, Peter, Yann, I think we discussed this topic during the
>> Buildroot meeting, and concluded we didn't want patches in Buildroot to
>> enable LibreSSL compatibility with a package. Do we stand on this
>> position, and reject Adam's contribution on ntp?
> 
> My position is to avoid feature patches. Adding libresl support in a
> package is adding a new feature IMHO.

 Well, it's a bit borderline; it's more like patching a script so that it can
run with busybox ash instead of relying on a bashism. However...

> As such, we should not accept it, unless it has *already* been accepted
> *and* merged upstream.

 ... I agree with this one, since there are some doubts (at least in my mind)
that this is the right approach.

 Regards,
 Arnout

> 
> Regards,
> Yann E. MORIN.
> 
>>> + #ifndef OPENSSL_VERSION_NUMBER
>>> ++#ifndef LIBRESSL_VERSION_NUMBER
>>
>> In addition, this continue to use the LIBRESSL_VERSION_NUMBER approach,
>> which will fail when libressl gains support for new APIs.
>>
>> Thanks in advance for giving your feedback on this patch. If nobody
>> complains, I'll merge :-)
>>
>> Thanks!
>>
>> Thomas
>> -- 
>> Thomas Petazzoni, CTO, Free Electrons
>> Embedded Linux and Kernel engineering
>> http://free-electrons.com
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
