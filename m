From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 13 Mar 2017 18:08:28 +0100
Subject: [Buildroot] [RFC PATCH 2/9] support/scripts: add fix-rpath
 script to sanitize the rpath
In-Reply-To: <72d3cece-a944-74b1-6e41-6f79e3a7eab1@grandegger.com>
References: <1488550733-3956-1-git-send-email-wg@grandegger.com>
 <1488550733-3956-3-git-send-email-wg@grandegger.com>
 <20170303154853.4eb15819@free-electrons.com>
 <c8a4d85e-ff1a-44ab-832b-bd4eff235a00@grandegger.com>
 <8122b244-b97f-e0fd-6d15-a33b8f44af25@grandegger.com>
 <30db8390-0a94-5449-0c5e-90263576be98@mind.be>
 <817f4be5-9f4c-927d-f611-8b112dfd0097@grandegger.com>
 <7524a67f-d19d-1023-262c-c0b7793e6066@mind.be>
 <0825a8e8-94d9-c6dd-3b22-555c02280f35@grandegger.com>
 <6976debd-6909-3767-3645-7a40162c40df@mind.be>
 <72d3cece-a944-74b1-6e41-6f79e3a7eab1@grandegger.com>
Message-ID: <9cc5cd01-0dde-f88d-d1f9-6a8fbbbaf2c2@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 12-03-17 22:10, Wolfgang Grandegger wrote:
> Am 12.03.2017 um 21:53 schrieb Arnout Vandecappelle:
>>
>>
[snip]
>>  You mean 19 seconds for the C program vs 22 seconds for cmp? That's what I
>> would expect indeed because cmp basically does the same. In my measurements,
>> readelf still was significantly slower - I didn't write down the numbers but
>> from memory it was like 25%.
> 
> No, 19 sec for the C program just checking the first 4 bytes. 22 with patchelf.
> And with readelf I think it was close to 19 sec as well. I will doublecheck,
> though.

 I think I had a bigger difference, but anyway even 20% isn't really worth it,
probably.

> 
>>
>>> patchelf is
>>> written in C++... maybe that's the reason why it's slower.
>>
>>  Well, it's rather because patchelf reads the entire file into a std::vector,
>> while readelf will just seek to the bits that are requested.
>>
>>
>>
>>  By the way, did you already post your patches to the patchelf list?
> 
> I'm currently preparing a new patch series. I did not find a mailing list for
> the patchelf project. Maybe I have to use the GIT hub interface.

 Yes, github pull request is the way to go.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
