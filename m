From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 26 Oct 2015 21:12:00 +0100
Subject: [Buildroot] [PATCH 03/21 v2] core: move pkg-utils.mk to support/
In-Reply-To: <20151022212038.GC3797@free.fr>
References: <cover.1445545973.git.yann.morin.1998@free.fr>
 <924ba3caeef2c8236936a4515e2d55316362d046.1445545973.git.yann.morin.1998@free.fr>
 <562950BD.4000405@mind.be> <20151022212038.GC3797@free.fr>
Message-ID: <562E8910.7050003@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 22-10-15 23:20, Yann E. MORIN wrote:
> Arnout, All,
> 
> On 2015-10-22 23:10 +0200, Arnout Vandecappelle spake thusly:
>> On 22-10-15 22:33, Yann E. MORIN wrote:
>>> pkg-utils.mk contains various definitions that are used in the package
>>> infrastructures and packages themselves.
>>>
>>> However, those definitions can be useful in other parts of Buildroot,
>>> and are already used in a few places that are not related to the package
>>> infrastructure. Also, $(sep) will be needed early in the Makefile when
>>> we eventually support multiple br2-external trees.
>>>
>>> Since this file only contains definitions, we can include it anytime.
>>>
>>> So, consider that file to no longer be specific to the package infras:
>>>   - move it to support and rename it,
>>>   - move a few similar definitions from the main Makefile to that file.
>>
>>  Actually I think a lot more should move to support. For instance, pkg-* is
>> actually not just for packages but also for linux, bootloaders, toolchain. And
>> even package/Makefile.in (with a better name then :-).
> 
> I do agree. But I think this can be done in a separate series.

 Yeah sorry I should have mentioned that: as a separate series indeed.


> The current series is about adding multi-br2-external support, so only
> includes whatever is necessary to achieve that goal.
> 
> I can queue a rework of the support materials as you suggest, but that
> will be done in a separate series (and hopefully not a requirement
> before this one is condered! ;-) ).
> 
>>> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>>> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>>> Cc: Peter Korsgaard <jacmet@uclibc.org>
>>> ---
>>>  Makefile              | 10 ++-----
>>>  package/pkg-utils.mk  | 59 ----------------------------------------
>>>  support/misc/utils.mk | 74 +++++++++++++++++++++++++++++++++++++++++++++++++++
>>
>>  If you agree that more stuff should move to support, I think there should be a
>> new directory support/make or support/mk.
> 
> As I said, we can move it later when doing the support rework.

 OK.

>>  BTW, why didn't the rename detection catch this? Did you change too much? In
>> that case, perhaps it's better to do it in two patches? :-P
> 
> It was not caught because it is less than 50% (actually, 49%!) so git did
> not detect a copy (or a rename either).

 If you send a v2, could you set -M40% so the rename is detected?

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
