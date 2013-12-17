From: Ryan Barnett <rjbarnet@rockwellcollins.com>
Date: Tue, 17 Dec 2013 08:24:47 -0600
Subject: [Buildroot] [PATCH v4 2/2] manual: update for multiple global
	patch dirs
In-Reply-To: <52B04F5E.1010602@mind.be>
References: <1387270827-4379-1-git-send-email-rjbarnet@rockwellcollins.com>	<1387270827-4379-2-git-send-email-rjbarnet@rockwellcollins.com>
 <CAAXf6LVu=ZUYZ-O-+WcCcnY2sCs8Nn-OiEwRwNkrjyqwhakE=Q@mail.gmail.com>
 <52B04F5E.1010602@mind.be>
Message-ID: <OF15352E49.1C4D9698-ON86257C44.0049F2E1-86257C44.004F26CE@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas D, Arnout,

Thomas De Schampheleire <patrickdepinguin@gmail.com> wrote on 12/17/2013 
07:30:01 AM:

> On Tue, Dec 17, 2013 at 2:19 PM, Arnout Vandecappelle <arnout@mind.be> 
wrote:
>[..]
>>>>
>>>>
>>>> -For a specific version <packageversion> of a specific package
>>>> <packagename>,
>>>> -patches are applied as follows.
>>>> +For a specific version +<packageversion>+ of a specific package
>>>> ++<packagename>+, patches are applied from +BR2_GLOBAL_PATCH_DIR+ as
>>>> +follows:
>>>>
>>>> -First, the default Buildroot patch set for the package is applied.
>>>> +. For every directory - +<global-patch-dir>+ - that exists in
>>>> +  +BR2_GLOBAL_PATCH_DIR+, a +<package-patch-dir>+ will be determined 
as
>>>> +  follows:
>>>> ++
>>>> +* If the directory
>>>> +  +<global-patch-dir>/<packagename>/<packageversion>/+ exists.
>>>> ++
>>>> +* Otherwise, if the directory +<global-patch-dir>/<packagename>+ 
exists.
>>>
>>>
>>> I find this wording strange:
>>> '.... will be determined as follows: if the directory A exists.
>>> Otherwise, if the directory B exists.'
>>>
>>> What about:
>>> '.... will be determined as follows: A, if it exists. Otherwise, B, if
>>> it exists.'
>>
>>
>>  Actually for me, Ryan's formulation sounds more natural: if ... else 
if 
>>  ... else ....

> The order of if/else are both fine for me, but I was more referring to
> something else. The intro sentence says: "The order will be determined
> as follows". When I read this, I expect to get a summary of items (the
> 'order'). However, what follows is a list of conditionals ("if A")
> without 'then' statement.
> 
> It's a bit like this to me:
> "On lazy days, I do only two things: if I am hungry, and if I am 
sleepy."
> while I expect more something like:
> "On lazy days, I do only two things: if I am hungry, I eat, and if I

Is alright to keep the way it is? I prefer the way this looks when the 
html manual is generated.

>
>>> I think it's a pity that there is duplication between this section and
>>> the one on BR2_GLOBAL_PATCH_DIR.
>>> However, it seems this was an explicit request made by Arnout.
>>>
>>> Arnout, would it not be better to remove the duplication, but rather
>>> use hyperlinks to refer from one section to the other, with the
>>> detailed explanation about patch order being in this 'How patches are
>>> applied' section?
>>
>>
>>  I meant to say that the remark about numbering the patches should be
>> duplicated, so that's just one sentence.
>>
>>  I do agree that it would be better to move the whole discussion about 
the
>> order in which patches are applied to this section (including a 
specific
>> comment about the linux patches), with a crossref from the global patch 
dir
>> section. However, Ryan didn't really change that structure (there was
>> already some amount of duplication), so I think it can safely be done 
in a
>> separate patch.
>>
> 
> Fair enough, but is Ryan prepared to make that follow-up patch, or
> should we wait until someone takes it up?

I was going to follow-up this patch with another series that removes the 
options PATCH_DIR options for individual packages besides the kernel. When 
I do that, I was planning on cleaning up the documentation to avoid this 
duplication. It was easier for right now, to duplicate the section Arnout 
requested rather than to try to figure out the best way possible for 
avoiding duplication.

Thomas D - are you ok with this patch series besides the minor spelling 
mistake?

Thanks,
-Ryan
