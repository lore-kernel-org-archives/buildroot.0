From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Tue, 28 Oct 2014 14:41:29 +0100
Subject: [Buildroot] [PATCH v6 0/2] Mono new package
In-Reply-To: <CA+TH9VngG20VsJqPQUkRT14u+w8_DB+U8f7pZWf3e9+nF7SR9A@mail.gmail.com>
References: <1414009330-4433-1-git-send-email-angelo.compagnucci@gmail.com>
 <20141025105055.05c53953@free-electrons.com>
 <544EC442.5030804@lucaceresoli.net>
 <CA+TH9VngG20VsJqPQUkRT14u+w8_DB+U8f7pZWf3e9+nF7SR9A@mail.gmail.com>
Message-ID: <544F9D09.1010408@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Angelo,

thank you for the follow-up.

Angelo Compagnucci wrote:
> Dear Luca,
>
>> BTW, Angelo, Thomas, where did you get licensing info when
>> writing/committing the package?
>
> Mono is a complex piece of software composed by several components, so
> the licensing scheme is complex. I'll try to summarize here.

Yes, it's very complex. If I were the Mono developer I'd probably split
each part in a different package. But this is not a Buildroot issue of
course.

Back in topic, I don't use Mono, hence I don't know the meaning of
"mcs", "gmcs", "jay", "boehm" etc, which doesn't help.

>
> The file COPYING.LIB is quite explicative:

Oops, I looked in LICENSE. The fact that there are at least 3 different
explanations (website, LICENSE and COPYING.LIB) does not help me either.

>
> "The Mono runtime is licensed under the terms of the GNU
> Library General Public License, version 2.

This is coherent with the website, while LICENSE states LGPL, without
specifying a version. So LGPLv2 should be correct.

>
> The eglib directory is licensed under the terms of the MIT
> X11 license and is a drop-in replacement for Mono's use of
> glib 2.0 (which was LGPL).
>
> The Boehm licensing information is in the libgc directory
>
> The SGen Garbage Collector is under the terms of the MIT X11
> license
>
> The class libraries under mono/mcs are unless otherwise stated
> under the MIT X11 license.

So eglib, boehm and the garbage collector are part of the runtime,
correct?

>
> Open source Microsoft code is licensed under the original terms
> which is either MS-PL for older components, or dual licensed
> MS-PL/Apache2 licensed."

But we have no mention of MS-PL nor Apache2 in MONO_LICENSE.

Where is the Microsoft code used? In the runtime?

>
> * The C# compiler is dual-licensed under the MIT/X11 license and the
> GNU General Public License (GPL).
>
> Every file inside mcs/mcs folder has this preamble "Dual licensed
> under the terms of the MIT X11 or GNU GPL"
>
> * The tools are released under the terms of the GNU General Public
> License (GPL).
>
> Not every file has a license in it's preamble, but the most part show
> a GPL preamble.

Uh, where are these "tools" located?
In the tools/ subdir I can't find any evidence of a GPL license:

   $ git grep -i -C3 licens -- tools/ | grep -i general
   $

Maybe you refer to another subdir?

>
> * The class libraries are released under the terms of the MIT X11 license.
>
> Every file inside mcs/class show a MIT.X11 preamble
>
> It's complex but it shows some sense!
> For the practical point of view of using it, you should comply with
> the license of the software you ship so the mono runtime and mono
> class only (LGPL2, MIT)

That's correct if you ship a target, not if you ship an SDK (which is
basically the stuff that is produced by Buildroot in output/host/).
If you do, you have host-mono in the SDK and this pulls in GPL and other
licenses.

Is my understanding correct?

>
> Hope this clarify!

Yes, it is less fuzzy now, thanks.

But unfortunately, due to my poor knowledge of the Mono project, I can't
build myself a strong opinion on what the correct MONO_LICENSE value
should be. But maybe you can further improve the current value starting
from my questions above (or clarify that the current value is ok).

Regards,
-- 
Luca
