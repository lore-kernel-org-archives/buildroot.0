From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 11 Oct 2015 23:02:30 +0200
Subject: [Buildroot] Change build directory por a package
In-Reply-To: <CAD7j7Q9cSriOdjNQXxamwCh8W_TCJsQ0iuYDmsEr+FJ_Az_nkQ@mail.gmail.com>
References: <CAD7j7Q9cSriOdjNQXxamwCh8W_TCJsQ0iuYDmsEr+FJ_Az_nkQ@mail.gmail.com>
Message-ID: <20151011210230.GD24916@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Carlos, All,

On 2015-10-11 20:08 +0200, Carlos Soto spake thusly:
> I'm working on a SDL2 package for buildroot, and I'm having some problems.
> Apparently, libtool has trouble finding some object files while linking. It
> looks for object files inside the sdl2-2.0.3/build/ dir, but they are
> located in sdl2-2.0.3/build/.libs/

After a quick (manual) test-build locally, I did not observe this problem.

If you could past the last 100-or-so lines of the build with the error
message, that would help pinpoint the actual root cause of the issue.

> As soon as I manually move all object files to sdl2-2.0.3/build/ everything
> goes well, but it is something in the middle of the process so I don't
> think I can put a hook to make the mv.

Indeed, there is no such possibility.

> I've tried this guide[1] and it works fine, and the only difference seems
> to be that the build directory is outside of the src directory, so my
> question is: how can I change the build directory in the mk file for a
> given package (in this case, SDL2)?

We do not support out-of-tree builds "natively" for now. There is always
the possibility to do it "manaully", but I doubt this would really be
needed. So let's try to understand/fix the issue without resorting to
such a workaround (which would be ugly).

Care to send your sdl2 package to the list for review, so we can help on
it? Be sure to mark it as being an "RFC" (Request For Comments) so it's
clear it's not ready for being applied.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
