From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 23 Mar 2017 09:25:11 +0100
Subject: [Buildroot] [PATCH 4/6] python-mwscrape: use documented license
 abbreviation
In-Reply-To: <20170322223212.GA3591@free.fr>
References: <1490204935-13172-1-git-send-email-rahul.bedarkar@imgtec.com>
 <1490204935-13172-4-git-send-email-rahul.bedarkar@imgtec.com>
 <20170322213900.3ace3cc4@free-electrons.com> <20170322223212.GA3591@free.fr>
Message-ID: <3e6647c5-8b47-d1c1-a0fa-3cbf120759ec@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 22-03-17 23:32, Yann E. MORIN wrote:
> Thomas, All,
> 
> On 2017-03-22 21:39 +0100, Thomas Petazzoni spake thusly:
>> On Wed, 22 Mar 2017 23:18:53 +0530, Rahul Bedarkar wrote:
>>
>>>  PYTHON_MWSCRAPE_VERSION = 6a58d7801eb1e884fd0516f1adbedbd4481c10e6
>>>  PYTHON_MWSCRAPE_SITE = $(call github,itkach,mwscrape,$(PYTHON_MWSCRAPE_VERSION))
>>> -PYTHON_MWSCRAPE_LICENSE = MPL-2.0
>>> +PYTHON_MWSCRAPE_LICENSE = MPLv2.0
>>
>> Well, our idea was to use the SPDX license codes as much as possible,
>> and MPL-2.0 is the correct SPDX license code for this license. However,
>> it is true we haven't used SPDX from the beginning, so we're using
>> GPLv2 everywhere, while SPDX uses GPL-2.0.
>>
>> See:
>>
>>   https://spdx.org/licenses/
>>
>> I think our idea was to keep using GPLv2/LGPLv2.1/GPLv3, but for all
>> other licenses, use the SPDX code as much as possible.
>>
>> Maybe we should bite the bullet, and migrate all packages to use SPDX
>> license codes?
> 
> That would have my approval, yes.

 Indeed, I've been thinking about doing this.

 Now we just have to find a volunteer to construct the necessary sed magic :-)

 BTW I would propose to do this in one mega-patch that does mechanical
substitution in all the .mk files (make sure the commit log contains the
scriptlet that does it), and a second patch to fix the documentation. If it
makes things easier, the mega-patch could be split up into separate patches for
the different versions.

 Oh, and for the documentation update: perhaps we should remove the list of
licenses from our documentation, and instead refer only to spdx.org? I just
notice now: we currently don't refer to SPDX at all in the documentation! That
would explain Rahul's confusion about the proper license string...

 Oh, and scancpan and scanpypi have to be updated as well.

 Regards,
 Arnout

> 
> Regards,
> Yann E. MORIN.
> 
>> Arnout, Yann, Peter?
>>
>> Best regards,
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
