From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 21 Mar 2015 23:17:27 +0100
Subject: [Buildroot] Buildroot on OSX
In-Reply-To: <87a8z6husr.fsf@dell.be.48ers.dk>
References: <CA+-urNQQ9gSwRtmkNq0FBTDqaBuc5bZSS3LQYgsNGB3aEa4sHw@mail.gmail.com>
 <20150320180814.GH21001@waldemar-brodkorb.de>
 <87a8z6husr.fsf@dell.be.48ers.dk>
Message-ID: <20150321221727.GD4201@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2015-03-21 23:04 +0100, Peter Korsgaard spake thusly:
> >>>>> "Waldemar" == Waldemar Brodkorb <wbx@openadk.org> writes:
> >> I was just asked if it was possible to use Buildroot natively on a
>  >> Mac. I recommended that he just build in a Linux VM. However, after
>  >> playing around at command line and learning about Homebrew, it looked
>  >> like it may not be too far off especially since Buildroot builds so
>  >> much itself. Ignoring external toolchains which I would assume
>  >> wouldn't work, has anyone done this?
> 
>  > Once I tried to do this, but there wasn't much interest to carry
>  > needed patches in buildroot. It is hard to get these Darwin-to-Linux
>  > cross-compile patches into upstream projects.
>  > Recently I discussed some of the patches I am using in OpenADK with
>  > a friend and we will try to reduce them and do it in a better way,
>  > which might even be usable for buildroot.
> 
> In general, using anything else than a Linux system to build Linux
> systems is bound to cause extra issues. To my knowledge, nobody uses
> Buildroot with a !Linux host on any regular schedule.
> 
> I don't mind simple fixes, but users on !Linux should not expect full
> functionality, and I am not interested in carrying any big / feature
> patches for it.

Fully agreed.

Patches that are "portability cleanups", like changing '#!/bin/sh' to
'#!/usr/bin/env bash' for example, are probably acceptable.

Anything that adds complexity and/or different code-paths are probably
to be avoided. And patches to packages to make them build on MacOS are
to be banned (unless upstream accepts them first).

Seriously, there's no better platform for doing Linux development than a
Linux box. At worst, a VM would do the trick.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
