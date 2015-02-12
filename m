From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Thu, 12 Feb 2015 22:20:08 +0100
Subject: [Buildroot] [PATCH] pkg-cmake: reduce output when being silent
In-Reply-To: <CAHkwnC9TyTDnd0jfcVtoX0fO3N5xDD7eeWqbqATtF+-pMcatOA@mail.gmail.com>
References: <1423677141-10912-1-git-send-email-fabio.porcedda@gmail.com>
 <20150211211420.57208953@free-electrons.com>
 <CAHkwnC9TyTDnd0jfcVtoX0fO3N5xDD7eeWqbqATtF+-pMcatOA@mail.gmail.com>
Message-ID: <CAHkwnC-hpByjrpQjorurs=_CcX_6Xew4H08Ne_VrtSg6vsrRbQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I've forgotten to do a replay all...

On Thu, Feb 12, 2015 at 6:24 AM, Fabio Porcedda
<fabio.porcedda@gmail.com> wrote:
> On Wed, Feb 11, 2015 at 9:14 PM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
>> Dear Fabio Porcedda,
>>
>> On Wed, 11 Feb 2015 18:52:21 +0100, Fabio Porcedda wrote:
>>
>>> +ifdef QUIET
>>> +CMAKE_QUIET = -DCMAKE_RULE_MESSAGES=OFF -DCMAKE_INSTALL_MESSAGE=NEVER
>>> +else
>>> +CMAKE_QUIET =
>>> +endif
>>
>> Use:
>>
>> ifneq ($(QUIET),)
>> CMAKE_QUIET = -DCMAKE_RULE_MESSAGES=OFF -DCMAKE_INSTALL_MESSAGE=NEVER
>> endif
>>
>> We generally don't use ifdef to test the value of a variable in
>> Buildroot.
>
> Ok will change it, nevertheless I like more the "ifdef" but maybe it's
> just may personal preference.
>
>> The else part is unnecessary.
>
> I added that to be able to use "make --warn-undefined-variables", i
> was thinking that is a useful tool for debugging makefile code.
>
> BR
> --
> Fabio Porcedda



-- 
Fabio Porcedda
