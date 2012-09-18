From: Samuel Martin <s.martin49@gmail.com>
Date: Tue, 18 Sep 2012 23:16:52 +0200
Subject: [Buildroot] [PATCH 10/11] toolchain/common: introduce blind
 options BR2_NEEDS_GETTEXT{, _IF_LOCALE}
In-Reply-To: <20120918195518.163c409d@skate>
References: <1347836276-24262-1-git-send-email-yann.morin.1998@free.fr>
 <1347836276-24262-11-git-send-email-yann.morin.1998@free.fr>
 <20120918195518.163c409d@skate>
Message-ID: <CAHXCMMJajHR7i2hhVYfDa9RejnBV3ezBidALf=zqVwaXsp_0Hw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann, Thomas, all,

2012/9/18 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>:
> Dear Yann E. MORIN,
>
> On Mon, 17 Sep 2012 00:57:55 +0200, Yann E. MORIN wrote:
[...]
>> Also, introduce four new Makefile variables:
>>   - $(gettext)
>>         contains the needed dependencies for pacakges that need gettext
>>         functioanlity: 'gettext' if the gettext pacakge is needed, empty
>>         otherwise
>>   - $(gettext-if-locale)
>>         ditto, but only if locales are enabled
>>   - $(gettext-LDFLAGS)
>>         contains the required LDFLAGS ("-lintl") if gettext is provided by
>>         the gettext package, empty otherwise
>>   - $(gettext-LDFLAGS-if-locale)
>>         ditto, but only if locales are enabled
>>
>> Packages can then add either variable to their own LDFLAGS.
>
> I am happy about the entire patch set, except those $(gettext),
> $(gettext-if-locale), $(gettext-LDFLAGS) and
> $(gettext-LDFLAGS-if-locale) variables. Even though they admittedly
> make the code a bit shorter, I think they needlessly hide what is
> really happening. I very much prefer an explicit:

I disagree with Thomas.
True, this hides a bit the details, but I do not think it that's a bad thing.
I mean gettext/locale support is somehow quite closely related to the
toolchain, so, having these variables warns a bit more about what one
is about to do.

Though, these variables hide some things, it's pretty easy to find out
their definitions; and IMHO, there are other things more hidden than
this in BR. ;-)
Besides, I think,  the variable names are clear, and won't easily lead
to mistakes or misunderstandings.


Yours,

-- 
Sam
