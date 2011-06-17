From: =?ISO-8859-1?Q?Daniel_Nystr=F6m?= <daniel.nystrom@timeterminal.se>
Date: Fri, 17 Jun 2011 13:39:05 +0200
Subject: [Buildroot] QT 4.7.3 failes with current git version
In-Reply-To: <4DFA0E08.9060603@hs-augsburg.de>
References: <4DFA0E08.9060603@hs-augsburg.de>
Message-ID: <BANLkTiknhCpyv2ze2smDCbuhaLmQa7OBCA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2011/6/16 Michael Morscher <michael.morscher@hs-augsburg.de>:
> Hey guys,
>
> I currently wanted to try out QT on my mini2440 but failed compiling QT
> 4.7.3.
> The strange thing is, that it worked (using nearly the same old config
> of mine) with 2011.05 final, but the current git fails. Any ideas? Thanks.
>
> BR Config is posted here: http://pastebin.com/XZz4dE0a
>

<snip>
> function ?void* QTJSC::currentThreadStackBase() :
> ../3rdparty/javascriptcore/JavaScriptCore/runtime/Collector.cpp:715:42:
> error: ?pthread_getattr_np ?was not declared in this scope
</snip>

Looks like the uClibc patches isn't applied correctly. But the patches
is very ugly. I would recommend you to drop the patches (or just don't
make them apply) and compile with NPTL instead.
