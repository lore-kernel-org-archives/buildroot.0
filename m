From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun, 23 Apr 2017 22:28:48 -0300
Subject: [Buildroot] [RFC] Adopt a coding style for Python scripts
References: <a6518c83-6421-8957-e11f-15db51d5a346@mind.be>
Message-ID: <58fd54d0772c9_6f826992cc505e6@ultri3.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,

On Sun, Apr 23, 2017 at 06:41 PM, Arnout Vandecappelle wrote:

> On 20-04-17 08:56, Ricardo Martincoski wrote:
>> Thomas,
>> 
>> I have a local patch for the docs for option D, but I will hold it for few more
>> days to see if we get more input.
>> 
>> On Wed, Apr 19, 2017 at 04:34 PM, Thomas De Schampheleire wrote:
>> 
>>> 2017-04-14 19:14 GMT+02:00 Arnout Vandecappelle <arnout@mind.be>:
>>>> On 14-04-17 01:44, Ricardo Martincoski wrote:
>> [snip]
>>>>> D) adopt the recommendation PEP8 [1] as coding style and the tool pep8 [2] as
>>>>>    automatic checker for coding style before submitting patches;
>>>>>    It checks for a subset of the recommendation (e.g. file naming is not
>>>>>    checked).
>>>>
>>>>  For me, option D is great. It can also be added to the checkpackage script.
>>>>
>>>
>>> I'm not against this either. However, sometimes I feel that pep8 is
>>> being too pedantic. For example, there is a minimum variable name
>>> length of 3. However, for regex searches, it is common to use the
>>> variable 'm' to hold the match, and then use 'if m' or 'm.group(3)' or
>>> whatever, which I feel is perfectly fine.
>> 
>> It seems more people think like you because pep8 tool does not check for that
>> specifically (it's a subset from the recommendation), see my tests at the end.
>> 
>>> I haven't used pep8 so don't know if it can be tweaked.
>> 
>> The warnings can be suppressed by type.
>> pep8 --ignore E302 1.py
>> But AFAIK it can't be configured i.e. to check for 1 or 3 empty lines instead
>> of 2. It's "check for 2" or "don't check for empty lines".
> 
>  I don't think we have a problem with the 2 empty lines. What I understand from
> the previous discussion is that we're OK with changing the Buildroot to standard
> to comply with pep8, also if that means adding an extra line between functions.

Sure. We don't have a problem with 2 empty lines.

Sorry the bad example I gave. What I meant to say is that the tool can be
tweaked but only by toggling on/off which warnings are generated.

>>> There also exist other tools btw, like flake8, which also check other
>>> items than style. They too can be useful, but they too can be 'too
>>> much'.
>> 
>> I haven't used flake8. I installed it after your e-mail.
>> I usually use pep8 for style, pyflakes for common errors (i.e. unused import),
>> and pyflakes3 for Python 3 compatibility (i.e. print without parenthesis).
>> 
>> Last year pep8 got renamed to pycodestyle to reduce confusion with PEP8.
>> 
>> So looking at [4] I had a nice surprise ...   
>>  pycodestyle >= 2.0.0, < 2.1.0
>>  pyflakes >= 0.8.0, != 1.2.0, != 1.2.1, != 1.2.2, < 1.3.0
>>  mccabe >= 0.5.0, < 0.6.0
>> If you use flake8 you already use pep8 = pycodestyle!
>> 
>> The only thing that worries me a bit is this warning from [5]:
>> "In many ways, Flake8 is tied to the version of Python on which it runs."
>> 
>> 
>> Do you (or somebody else) know if it can be a concern in our use case?
>> 
>> 
>> Other than that I am OK to adopt PEP8 + flake8 instead of PEP8 + pep8.
>> Let's call it option E.
>> E) PEP8 + flake8
>> Let's see what others think.
> 
>  Let's start with documenting PEP8 :-)

OK. I hope I understand your suggestion correctly.
I will send a patch for option C (PEP8 recommendation, no tools).
Anyway it can be changed during review/apply if needed.

Regards,
Ricardo
