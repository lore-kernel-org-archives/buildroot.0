From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Mon, 6 Jan 2014 18:36:57 +0100
Subject: [Buildroot] [PATCH] toolchain/external: fix wrapper by not
 passing conflicting flags
In-Reply-To: <20140106170756.GA3383@free.fr>
References: <1388967142-3456-1-git-send-email-yann.morin.1998@free.fr>
 <CAGduivx4AZW3ic8HvVDtCwe7tdb4v-w7PEwVOPb_D6gSz82mtA@mail.gmail.com>
 <20140106170756.GA3383@free.fr>
Message-ID: <CAGduivwtnFBAsB4vm-Dt_CKG+dYKWZ+Uo6ObMDhkepz6db94aA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It did build without any warnings in Linux, so far so good :).

On Mon, Jan 6, 2014 at 6:07 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> On 2014-01-06 17:07 +0100, Maxime Hadjinlian spake thusly:
>> On Mon, Jan 6, 2014 at 1:12 AM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>> > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
>> > In our wrapper, we forcibly add the -march=, -mcpu= and-mtune= flags
>> > to the actual copmpiler, this in an attempt to always generate correct
>> > and optimised code for the target.
> [--SNIP--]
>> > @@ -157,6 +153,31 @@ int main(int argc, char **argv)
>> >                 *cur++ = "-mfloat-abi=" BR_FLOAT_ABI;
>> >  #endif
>> >
>> > +#if defined(BR2_ARCH) || \
>> > +    defined(BR2_TUNE) || \
>> > +    defined(BR2_CPU)
>> Shouldn't this be BR_* ?
>
> Doh, yes indeed. Good catch. :-)
>
>> After modifying to use BR instead of BR2 variable, your patch did what
>> was intended.
>> It suppressed all theses pesky messages while building the kernel.
>>
>> I am currently doing a full build, will report once it's done.
>
> Thank you! :-)
>
> Regards,
> Yann E. MORIN.
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
