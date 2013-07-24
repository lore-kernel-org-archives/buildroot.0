From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Wed, 24 Jul 2013 23:58:24 +0200
Subject: [Buildroot] custom extraction and libs11n
In-Reply-To: <CAAXf6LVVEdBfiKgqJtP+3XPYGz3U9aOiyQXiGtiKkZv0XhQj3A@mail.gmail.com>
References: <2DD0B9C711CDFC45A3A266C78966CE7F451B3DA8@G4W3291.americas.hpqcorp.net>
 <CAAXf6LVVEdBfiKgqJtP+3XPYGz3U9aOiyQXiGtiKkZv0XhQj3A@mail.gmail.com>
Message-ID: <712cfcb6-d412-4bff-8501-f25e5b02d11f@email.android.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> wrote:

>Hi Lee Jenkins,
...
>>
>> LIBS11N_LICENSE          = Public Domain
>
>There should also be a
>LIBS11N_LICENSE_FILES = LICENSE.libs11n
>line that refers to the file describing the license.
>
>*Luca*: different files in this package fall under different licenses.
>What is the best way to handle this?

I can't check right now, but IIRC the convention in BR is a comma-separated list, e.g.:
FOO_LICENSE = LGPLv3+, BSD-3c, MIT[, another_license...]

From the LICENSE.libs11n file:
>
>---------
>All build-related files are Public Domain.
>
>Some source code falls under other licenses such as LGPL or BSD, as
>described in their source files. To the best of my understanding, s11n
>falls under Section 5 of the LGPL, and need not be released under that
>license. (More specifically, it contains no LGPL code, but uses
>features
>provided by a couple of LGPL'd classes.)

I am not a lawyer, but I find section 5 a bit unclear.
In all cases I think that if there are LGPL files in this lib, then [part of] the lib falls under the LGPL.
But this is not a BR issue. You may want to contact the package author for a clarification.

>
>The list of files which are known to be exceptions to the Public
>Domain license:
>
>LGPL:
>        lib/toolbox/bzstream.{h,cpp}
>        lib/toolbox/gzstream.{h,cpp}
>
>BSD:
>        include/FlexLexer.h
>
>MIT:
>        lib/expat (may or may not be in your s11n distribution)
>
>Unspecified:
>        toc/bin/mkdeps.c
>
>These are all released under fairly non-restritive licenses.
>
>There *may* be other such files: please see the individual source
>files if in doubt.
>-------------------
>
>

Luca
