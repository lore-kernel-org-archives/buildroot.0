From: Wolfgang Grandegger <wg@grandegger.com>
Date: Mon, 3 Jul 2017 09:04:11 +0200
Subject: [Buildroot] [RFC PATCH v5 01/11] package/patchelf: use most
 recent version as a base for rpath sanitation
In-Reply-To: <ae53a8d6-9104-b693-bc11-850cdd5cf7bf@mind.be>
References: <1498811828-6893-1-git-send-email-wg@grandegger.com>
 <1498811828-6893-2-git-send-email-wg@grandegger.com>
 <80a1cf57-34bb-dc8f-e2b9-dd4001f7df6b@mind.be>
 <5b16af39-81af-9a19-dd28-9aebfde9e817@grandegger.com>
 <a30436db-052e-bc75-d727-1147a75da98f@mind.be>
 <401fdb29-ce3a-f5a2-67d7-a03e2f785e87@mind.be>
 <ae53a8d6-9104-b693-bc11-850cdd5cf7bf@mind.be>
Message-ID: <6c844720-dd3d-cd87-b544-152f62afcba7@grandegger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 02.07.2017 um 18:10 schrieb Arnout Vandecappelle:
> 
> 
> On 01-07-17 17:24, Arnout Vandecappelle wrote:
>>
>>
>> On 01-07-17 11:40, Arnout Vandecappelle wrote:
>>>
>>>
>>> On 30-06-17 19:33, Wolfgang Grandegger wrote:
>>>> Am 30.06.2017 um 19:15 schrieb Arnout Vandecappelle:
>>>>>
>>>>> On 30-06-17 10:36, Wolfgang Grandegger wrote:
>>>>>> We would like to use "patchelf" to do rpath sanitation of all ELF files
>>>>>> in the "host", "staging" and "target" directory, mainly because a script
>>>>>> based solutions is too complex and slow.
>>>>>    Note that the bump is needed because some features were introduced since 0.9
>>>>> that we need for out rpath sanitization.
>>>> OK. Strictly speaking, we don't need/use the new stuff. The patch could also be
>>>> adapted to 0.0. I mainly used the most recent version because of the mainlining
>>>> process.
>>>
>>>   Perhaps we should stick to 0.9 then. Since then, they have started using C++11
>>> features, and I am not sure they are supported by the gcc in RHEL5. Since we
>>> will always use patchelf, it will have to be buildable on any host that we
>>> support...
>>
>>   OK, so we have a problem here: current patchelf master doesn't build with gcc
>> 4.4 because of the use of C++11 constructs. Here are our options:
>>
>> 1. Base our patchelf on 0.9 still instead of current master.
> 
>   After discussion here at the BR Summer Camp, we decided to stick with option 1
> (stay on patchelf 0.9) and revisit later when either patchelf grows interesting
> additional features upstream, or we anyway decide to drop old Debian and RHEL.

OK, I will use v0.9 plus a few patches (relevant for rpath 
sanitization). I see at least:

   a365bcb Remove apparently incorrect usage of "static"


Wolfgang.
