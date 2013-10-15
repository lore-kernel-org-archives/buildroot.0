From: =?ISO-8859-1?Q?Ezequiel_Garc=EDa?= <ezequiel@vanguardiasur.com.ar>
Date: Tue, 15 Oct 2013 08:56:04 -0300
Subject: [Buildroot] Ncurses wide support
In-Reply-To: <20131015133626.180de72d@skate>
References: <CAAEAJfCkpC6-ZnpcxYCgTiZN8=QJNY+wZg83Jjyzs8-e7jPkkw@mail.gmail.com>
 <525D1693.3010509@zacarias.com.ar>
 <CAAEAJfD_YaKXY5cMn9H7DcUe3fyJ8L7wJ+RkmaOy40D0KmSZtw@mail.gmail.com>
 <20131015133626.180de72d@skate>
Message-ID: <CAAEAJfAi1eZaSak6RXA-RDs7s+ZX_2F7EvnnkaFvhawQ7wNxAQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 15 October 2013 08:36, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Ezequiel Garc?a,
>
> On Tue, 15 Oct 2013 07:48:35 -0300, Ezequiel Garc?a wrote:
>
>> Maybe you could explain this in detail? Or draft some ncurses.mk
>> patch for me to take care of it?
>>
>> I know you probably don't care about nano, but it's currently broken
>> because of this ncursesw lack.
>
> Not sure to follow the original problem. If nano needs ncursesw, why
> don't you enable wchar support in your toolchain so that ncursesw gets
> built?
>

My toolchain *already* has wchar support yet the ncursesw library
is not built (at least over here). It seems like you need to enable it
*explicitly*.

The problem under discussion is that ncurses' --enable-widec option
prevents the non-wide (aka libncurses.so) library from being built.

Hope it's clear now.
-- 
Ezequiel Garc?a, VanguardiaSur
www.vanguardiasur.com.ar
