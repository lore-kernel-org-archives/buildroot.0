From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 19 Apr 2017 21:34:21 +0200
Subject: [Buildroot] [RFC] Adopt a coding style for Python scripts
In-Reply-To: <ff7902df-d244-bbdd-507e-84bf6bc6f1f5@mind.be>
References: <58f00d5f9f9f2_1dd63f875a965624536da@ultri3.mail>
 <ff7902df-d244-bbdd-507e-84bf6bc6f1f5@mind.be>
Message-ID: <CAAXf6LXga+ixXCgk_+66vMyxxvYnLbZN32-iXrCY76j84e4--w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2017-04-14 19:14 GMT+02:00 Arnout Vandecappelle <arnout@mind.be>:
>
>
> On 14-04-17 01:44, Ricardo Martincoski wrote:
>> Samuel, Maxime, Thomas, All,
>>
>> First of all, I don't want to start a flame war.
>>
>> I would like to know what you think about moving from A to D (or C or B) below.
>>
>> A) keep using the implicit coding style for Python that we use now in Buildroot;
>
>  Note about this coding style: it is absolutely not formal, and most likely not
> followed consistently. It's a combination of the coding style that the various
> contributors are used to, with some things inherited from non-Python Buildroot
> coding style. I think the single line between functions falls in the latter
> category.
>
>
>> B) adopt a pre-existing Python coding style;
>>    The advantages of using a pre-existing one are: documenting on the manual
>>    takes a single sentence; for some coding styles there are automatic checkers
>>    to help during development/review.
>>    Of course there are coding style guides others than PEP8. But I don't know
>>    much about them.
>>    Do some of you use another coding style for Python? What are its advantages?
>>
>> C) adopt the recommendation PEP8 [1] as coding style;
>>
>> D) adopt the recommendation PEP8 [1] as coding style and the tool pep8 [2] as
>>    automatic checker for coding style before submitting patches;
>>    It checks for a subset of the recommendation (e.g. file naming is not
>>    checked).
>
>  For me, option D is great. It can also be added to the checkpackage script.
>

I'm not against this either. However, sometimes I feel that pep8 is
being too pedantic. For example, there is a minimum variable name
length of 3. However, for regex searches, it is common to use the
variable 'm' to hold the match, and then use 'if m' or 'm.group(3)' or
whatever, which I feel is perfectly fine.
I haven't used pep8 so don't know if it can be tweaked.

There also exist other tools btw, like flake8, which also check other
items than style. They too can be useful, but they too can be 'too
much'.

/Thomas
