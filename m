From: =?ISO-8859-1?Q?Ezequiel_Garc=EDa?= <ezequiel@vanguardiasur.com.ar>
Date: Tue, 15 Oct 2013 07:48:35 -0300
Subject: [Buildroot] Ncurses wide support
In-Reply-To: <525D1693.3010509@zacarias.com.ar>
References: <CAAEAJfCkpC6-ZnpcxYCgTiZN8=QJNY+wZg83Jjyzs8-e7jPkkw@mail.gmail.com>
 <525D1693.3010509@zacarias.com.ar>
Message-ID: <CAAEAJfD_YaKXY5cMn9H7DcUe3fyJ8L7wJ+RkmaOy40D0KmSZtw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo,

On 15 October 2013 07:18, Gustavo Zacarias <gustavo@zacarias.com.ar> wrote:
> On 10/15/2013 07:09 AM, Ezequiel Garc?a wrote:
>
>> Currently Buildroot support building the non-wide (non-unicode) ncurses library.
>>
>> While ncurses support an easy way to enable wide support with a configure option
>> (--enable-widec), this option builds *only* the wide-enabled library
>> (aka libncursesw)
>> and not the vanilla one.
>>
>> In other words, it's not possible to build both at the same time.
>>
>> By looking at my Gentoo ebuild -which is also source based- it seems
>> they solve this by
>> simply building ncurses twice: first the vanilla, and then (if unicode
>> is enabled) the
>> wide-enabled one.
>>
>> Questions that arise:
>>
>> 1. Does Buildroot support something like this?
>
> Hi.
> There are tricks that could work, for instance by tweaking build and
> install cmds you could build and stash the widec version in some new
> directory inside the build one, then build the narrow version and
> install both - being in another new directory makes it "make clean" safe.
>

Maybe you could explain this in detail? Or draft some ncurses.mk
patch for me to take care of it?

I know you probably don't care about nano, but it's currently broken
because of this ncursesw lack.
-- 
Ezequiel Garc?a, VanguardiaSur
www.vanguardiasur.com.ar
