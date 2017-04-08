From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 8 Apr 2017 16:12:07 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2017-04-07
In-Reply-To: <20170408153804.45e749a3@free-electrons.com>
References: <20170408062822.DB87E20847@mail.free-electrons.com>
 <6309c1c4-169b-6c7b-53fe-631ddd7b7c73@mind.be>
 <20170408153804.45e749a3@free-electrons.com>
Message-ID: <d67ae6f4-a084-6236-a479-9377733b9824@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 08-04-17 15:38, Thomas Petazzoni wrote:
> Hello,
> 
> On Sat, 8 Apr 2017 15:35:03 +0200, Arnout Vandecappelle wrote:
>> On 08-04-17 08:28, Thomas Petazzoni wrote:
>>>         m68k |                   arp-scan-1.9 | NOK | http://autobuild.buildroot.net/results/c605c8cc36348f199a36e2652851b8d02ee222c0 |       
>>
>>  Hm, looks like the elf2flt issue is not just for ARM, but also for m68k. Weird
>> that I didn't catch this when running test-pkg on arp-scan...
> 
> How do you know it's the elf2flt issue here?

 It's not, actually. The ssp issue fixed by patch 0001 had the same symptom
(configure failing for libpcap), and I stupidly confused that with the elf2flt
issue.

 The problem is actually libpcap being linked with libnl but not providing a .pc
file. Needs to be fixed like in e.g. aircrack-ng.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
