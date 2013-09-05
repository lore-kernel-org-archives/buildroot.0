From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 5 Sep 2013 16:01:35 +0200
Subject: [Buildroot] [PATCH] apply-patches.sh: detect missing patches
In-Reply-To: <5228425A.7090502@lucaceresoli.net>
References: <20130813160017.GA2590@harvey.netwinder.org>
 <CAAXf6LXBHm7nG__780PqUaO+v9+4j2KON7UO0dw4Ej2qC3=XGg@mail.gmail.com>
 <CAAXf6LV9HPWdzqV_F5zQ+aABtVxZGRRkhDszF2Qx8vyXMb+PhA@mail.gmail.com>
 <20130905100459.13173009@skate> <5228425A.7090502@lucaceresoli.net>
Message-ID: <20130905140135.GC3136@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On 2013-09-05 10:35 +0200, Luca Ceresoli spake thusly:
> Thomas Petazzoni wrote:
> >Dear Thomas De Schampheleire,
> >
> >On Thu, 5 Sep 2013 09:03:33 +0200, Thomas De Schampheleire wrote:
> >
> >>>Although I agree with the concept of checking for existence, I'm not
> >>>sure about the action to take.
> >>>Earlier in apply-patches.sh, if a patch is in an unsupported format,
> >>>it is simply skipped (and a message printed). I think the action in
> >>>that case should line up with the nonexisting patch case, so either
> >>>give a warning and continue, or an error and stop.
> >>Any input from others?
> >My general feeling is that when something goes wrong or looks wrong, we
> >should abort with an error, and not try to continue with something
> >more-or-less broken/incorrect.
> 
> I agree. Who reads a million lines of build outputwhen make exits returning
> zero? Definitely BR should stop and shout out loud about missing or
> incorrect patches.

I concur: we should abort on incorrect/missing/malformed patch.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
