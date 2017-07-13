From: Romain Naour <romain.naour@gmail.com>
Date: Thu, 13 Jul 2017 13:17:05 +0200
Subject: [Buildroot] [PATCH v2 03/13] package/minetest: new package
In-Reply-To: <20170713102427.68ea2e66@windsurf.orange-hotspot.com>
References: <20170612205410.20230-1-romain.naour@gmail.com>
 <20170612205410.20230-3-romain.naour@gmail.com>
 <20170624171958.56312346@windsurf.home>
 <46aba327-97c5-f62d-8100-b3c4957c4576@gmail.com>
 <20170713102427.68ea2e66@windsurf.orange-hotspot.com>
Message-ID: <1d0b11d9-b0d6-2b60-ff62-d9c4e82ed347@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 13/07/2017 ? 10:24, Thomas Petazzoni a ?crit :
> Hello,
> 
> On Wed, 12 Jul 2017 18:37:39 +0200, Romain Naour wrote:
> 
>> Le 24/06/2017 ? 17:19, Thomas Petazzoni a ?crit :
>>> Hello,
>>>
>>> On Mon, 12 Jun 2017 22:54:00 +0200, Romain Naour wrote:
>>>   
>>>> + 		message(STATUS "GetText enabled; locales found: ${GETTEXT_AVAILABLE_LOCALES}")
>>>> ++		# On some platforms, such as Linux with GNU libc, the gettext
>>>> ++		# functions are present in the C standard library and libintl
>>>> ++		# is not required. For other libc (uClibc-ng or musl) libintl  
>>>
>>> Only uClibc-ng in fact. musl has stub gettext functionality.  
>>
>> So, with your series applied during the summer camp this is not true even with
>> uClibc-ng.
> 
> Correct: now all C libraries provide some gettext implementation.

So this patch is not required anymore since gettext stub will be used.

> 
>> I think BR2_SYSTEM_ENABLE_NLS should be used in minetest.mk.
> 
> Why?

I mean BR2_SYSTEM_ENABLE_NLS should be used for gettext handling, see the
followup patch.

Best regards,
Romain

> 
> Thomas
> 
