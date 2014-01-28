From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 28 Jan 2014 23:17:26 +0100
Subject: [Buildroot] [PATCH] Run post scripts referenced by relative
	paths
In-Reply-To: <CAHKzcEN7NvA9XAiFEAZ9xpjp16YQYzNX2sucbmQ4ps_yRZrScA@mail.gmail.com>
References: <1390904090-27934-1-git-send-email-waldemar.rymarkiewicz@gmail.com>
 <CAGduivzPCzuKsvy2HWuxdv9E5wVzdWvgdosNCBfQsenmmeZihA@mail.gmail.com>
 <CAHKzcEM_-gWUPe_cSYQCoUtgywMwmi8Wkjyy25UqgMGSRQto8A@mail.gmail.com>
 <20140128183202.GC3466@free.fr> <20140128224133.3a145dd0@skate>
 <CAHKzcEN7NvA9XAiFEAZ9xpjp16YQYzNX2sucbmQ4ps_yRZrScA@mail.gmail.com>
Message-ID: <20140128221726.GF3466@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Waldemar, All,

On 2014-01-28 23:06 +0100, Waldemar Rymarkiewicz spake thusly:
> > On Tue, 28 Jan 2014 19:32:02 +0100, Yann E. MORIN wrote:
> >> Why don't you just set:
> >>   BR2_ROOTFS_POST_BUILD_SCRIPT="./my-script ./my-second-script"
> >> (Ditto for BR2_ROOTFS_POST_IMAGE_SCRIPT.
> >>
> >> I'd say, we don't need that change. I prefer the user be explixit about
> >> what he intends to do, rather than Buildroot guessing.

> Let's leave it as it is now then.
> 
> The point was that neither manual nor menuconfig help explains how a
> script should be referenced. By full path, relative or what. In my
> case the easiest way was  just to put  "a space-separated list of
> scripts" as per help message and it does not work. For someone who is
> not dealing with buildroot frequently it can be an issue. Of course
> you can always use ./your_script, but still it's not explained
> anywhere. Abspath will fix it and it costs nothing, but I understand
> your way of thinking.

Ah, but then we are ready to accept a patch to the manual to fix this! ;-)
The manual is located in docs/manual/ in your buildroot tree, FYI.

Your comment is prefectly valid, indeed, but would better be solved by
fixing the manual instead.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
