From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Fri, 2 Mar 2018 21:01:03 -0600
Subject: [Buildroot] [NEXT 03/26] cpe-info: id prefix/suffix
In-Reply-To: <29fbea6a-19e2-b3ca-8ac1-f3caa7a022da@mind.be>
References: <1519697441-54194-1-git-send-email-matthew.weber@rockwellcollins.com>
 <1519697441-54194-4-git-send-email-matthew.weber@rockwellcollins.com>
 <20180227224523.002a9e52@windsurf.lan>
 <CANQCQpa-_SD=kwh3fTLpna9hk7c1tAoucM5q-Ua=SnsVvUhK4g@mail.gmail.com>
 <29fbea6a-19e2-b3ca-8ac1-f3caa7a022da@mind.be>
Message-ID: <CANQCQpbEykwr5oSqhGF5D4TAxG-zUT0pTtJC4MEJWVBnSpA9uA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,

On Thu, Mar 1, 2018 at 2:34 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
> On 28-02-18 05:14, Matthew Weber wrote:
>> Thomas,
>>
>> On Tue, Feb 27, 2018 at 3:45 PM, Thomas Petazzoni
>> <thomas.petazzoni@bootlin.com> wrote:
>>> Hello,
>>>
>>> On Mon, 26 Feb 2018 20:10:18 -0600, Matt Weber wrote:
>>>
>>>> +ifeq ($(1),linux)
>>>> +     $(2)_CPE_PREFIX = $(CPE_PREFIX_OS)
>>>> +else ifeq ($(1),linux-headers)
>>>> +     $(2)_CPE_PREFIX = $(CPE_PREFIX_OS)
>>>
>>> You can also do:
>>>
>>> ifneq ($(filter linux linux-headers,$(1)),)
>>> $(2)_CPE_PREFIX = $(CPE_PREFIX_OS)
>>> else
>>> $(2)_CPE_PREFIX = $(CPE_PREFIX_APP)
>>> endif
>>>
>>> But OK, it's not a big difference :)
>>
>> Cleaner though if there are any others.  Will update in v2.
>
>  Yeah, like, what about bootloaders?
>

Looks like uboot isn't yet defined.  So that one will need to be
proposed before we'll know os or app.  However grub is listed and is
of app type.

Matt
