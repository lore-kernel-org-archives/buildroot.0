From: martin krastev <blu.dark@gmail.com>
Date: Tue, 12 Feb 2013 02:09:16 +0200
Subject: [Buildroot] non-standard architecture targets
In-Reply-To: <201302101840.31016.yann.morin.1998@free.fr>
References: <CAKPuMhOrKZwAp5FZgvBO2M5dfvrFnCjBchwAfBn+_tu_XiwB2Q@mail.gmail.com>
 <201302101733.42143.yann.morin.1998@free.fr>
 <CAKPuMhNBQKufPGtau-SbYz50zqCnuAFpUaO4faWQspjNRzb+hg@mail.gmail.com>
 <201302101840.31016.yann.morin.1998@free.fr>
Message-ID: <CAKPuMhO=7y19ZJCNfoyuT=fsiTPZ9NK9y9JaRuri9bS9c+sxKQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Feb 10, 2013 at 7:40 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Martin, all,
>
> [Please, do *not* top-post, put your reply below the text you're replying to]

My apologies.

>
> On Sunday 10 February 2013 martin krastev wrote:
>> Unfortunately the tuple pattern in question is not something I have
>> control over - that is what gcc expects to have as a target (pattern)
>> to enable paired-singles support for ppc750cl.
>
> (for reference, you suggested those tuples:
>   powerpc-buildroot-linux-uclibc-paired and
>   powerpc-buildroot-linux-paired-uclibc).
>
> Well, gcc can *not* expect such tuples, as they are invalid.
>
> However, the following tuples are valid, and match the pattern gcc expects:
>     powerpc-unknown-linux-gnupaired
>     powerpc-unknown-linux-uclibcpaired
>
> But AFAIK there is no way to set these using Buildroot.

Well, I've found a way that produces the desired effect. The target
tuple is set in this file and line (buildroot-2012.11.1):

./package/Makefile.in:23


Best regards, and thank you for your time.

Martin

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
