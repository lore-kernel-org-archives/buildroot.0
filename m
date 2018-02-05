From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 5 Feb 2018 08:18:20 +0100
Subject: [Buildroot] [PATCH] support/dockerfile: add directives to run
 as non-root
In-Reply-To: <CABa6e=otTJ1GiyhBA_hXXxNcyGts0TH5=CW=abBiwa5TageAHw@mail.gmail.com>
References: <20180106152833.10111-1-yann.morin.1998@free.fr>
 <87bmh521a5.fsf@dell.be.48ers.dk> <20180204100444.GB2411@scaer>
 <CABa6e=otTJ1GiyhBA_hXXxNcyGts0TH5=CW=abBiwa5TageAHw@mail.gmail.com>
Message-ID: <20180205071820.GA2417@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Cam, All,

On 2018-02-05 14:52 +1100, Cam Hutchison spake thusly:
> On 4 February 2018 at 21:04, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
[--SNIP--]
> >> I don't know much about Docker, but I was of the understanding that each
> >> run statement creates a new layer and the number of layers should be
> >> minimized, which is why you normally see stuff like:
[--SNIP--]
> Minimizing the number of layers for simple layers like the "RUN useradd"
> and "RUN chown" really doesn't save very much.
> 
> Where the big win comes in (and is not mentioned in the official
> documentation) is when you keep the "install && build && clean" commands
> in a single RUN command. This matters because if you split it up over
> multiple layers, the earlier layers still contain all the stuff the
> later layers try to clean. The end result is a fat image that contains
> the stuff you wanted to remove in a lower layer, with whiteout entries
> in a higher layer, so it only looks like the files have been removed.
> 
> Your patch set does the right thing WRT the debian install/clean, so all
> good, but I thought I'd mention this because it did not come up in any
> discussions here or in the linked docs.

OK, so we *do* have a Docker expert, now! ;-)

Thank you for your explanations, that was very instructive. I gues
that's because aufs is used underneath, or something like that?

I would have expected that, instead of implicit, a layer would have been
explicit, like with a COMMIT keyword or something like that...

Anyway, it all makes sense in hindsight, indeed. Thanks!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
