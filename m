From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 17 Dec 2013 17:07:56 +0100
Subject: [Buildroot] [PATCH v4 2/2] manual: update for multiple global
	patch dirs
In-Reply-To: <OF15352E49.1C4D9698-ON86257C44.0049F2E1-86257C44.004F26CE@rockwellcollins.com>
References: <1387270827-4379-1-git-send-email-rjbarnet@rockwellcollins.com>
 <1387270827-4379-2-git-send-email-rjbarnet@rockwellcollins.com>
 <CAAXf6LVu=ZUYZ-O-+WcCcnY2sCs8Nn-OiEwRwNkrjyqwhakE=Q@mail.gmail.com>
 <52B04F5E.1010602@mind.be>
 <OF15352E49.1C4D9698-ON86257C44.0049F2E1-86257C44.004F26CE@rockwellcollins.com>
Message-ID: <CAAXf6LWDQYotYSqBh5H1aYc1B2PJYfDbK+FaF8hYt4VTpSnMzg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Dec 17, 2013 at 3:24 PM, Ryan Barnett
<rjbarnet@rockwellcollins.com> wrote:
> Thomas D, Arnout,
>
> Thomas De Schampheleire <patrickdepinguin@gmail.com> wrote on 12/17/2013
> 07:30:01 AM:
>
>> On Tue, Dec 17, 2013 at 2:19 PM, Arnout Vandecappelle <arnout@mind.be>
> wrote:
>>[..]
>>>>>
>>>>>
>>>>> -For a specific version <packageversion> of a specific package
>>>>> <packagename>,
>>>>> -patches are applied as follows.
>>>>> +For a specific version +<packageversion>+ of a specific package
>>>>> ++<packagename>+, patches are applied from +BR2_GLOBAL_PATCH_DIR+ as
>>>>> +follows:
>>>>>
>>>>> -First, the default Buildroot patch set for the package is applied.
>>>>> +. For every directory - +<global-patch-dir>+ - that exists in
>>>>> +  +BR2_GLOBAL_PATCH_DIR+, a +<package-patch-dir>+ will be determined
> as
>>>>> +  follows:
>>>>> ++
>>>>> +* If the directory
>>>>> +  +<global-patch-dir>/<packagename>/<packageversion>/+ exists.
>>>>> ++
>>>>> +* Otherwise, if the directory +<global-patch-dir>/<packagename>+
> exists.
>>>>
>>>>
>>>> I find this wording strange:
>>>> '.... will be determined as follows: if the directory A exists.
>>>> Otherwise, if the directory B exists.'
>>>>
>>>> What about:
>>>> '.... will be determined as follows: A, if it exists. Otherwise, B, if
>>>> it exists.'
>>>
>>>
>>>  Actually for me, Ryan's formulation sounds more natural: if ... else
> if
>>>  ... else ....
>
>> The order of if/else are both fine for me, but I was more referring to
>> something else. The intro sentence says: "The order will be determined
>> as follows". When I read this, I expect to get a summary of items (the
>> 'order'). However, what follows is a list of conditionals ("if A")
>> without 'then' statement.
>>
>> It's a bit like this to me:
>> "On lazy days, I do only two things: if I am hungry, and if I am
> sleepy."
>> while I expect more something like:
>> "On lazy days, I do only two things: if I am hungry, I eat, and if I
>
> Is alright to keep the way it is? I prefer the way this looks when the
> html manual is generated.

I'm not sure we fully understand each other. My comment is not really
about the looks of it, but rather about a missing part of the
sentence. I don't really care about "if A then B" or "B, if A", it was
just a suggestion. My main point is that there is no 'then' part on
the if, making the whole sentence incomplete.

Unless you can convince me that this is correct English, I think this
should be fixed in this patch and not in a followup.


Best regards,
Thomas
