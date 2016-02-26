From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 26 Feb 2016 16:43:21 +0100
Subject: [Buildroot] [nano] error compiling nano
In-Reply-To: <CALtfCQZsG=u4scz83-6Ke1iVp9pDqpiN79365vnS2mpF05SFRw@mail.gmail.com>
 (=?utf-8?B?IsOTc2NhciBHw7NtZXo=?= Fuente"'s message of "Fri, 26 Feb 2016
 10:35:05 +0100")
References: <CALtfCQZsG=u4scz83-6Ke1iVp9pDqpiN79365vnS2mpF05SFRw@mail.gmail.com>
Message-ID: <87a8mnv5nq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "?scar" == ?scar G?mez Fuente <oscargomezf@gmail.com> writes:

 > Hi,
 > I'm trying to compile the test editor: nano, with raspberrypi2_defconf
 > configuration and fail. It seems to be that the problem is in the source
 > file: char.c.

 > I attached you the log of the make:

 > ---
 > ...
 >      IGNORE_CALL_RESULT(mbtowc(NULL, NULL, 0));
 >      ^
 > chars.c: In function ?wctomb_reset?:
 > chars.c:101:5: warning: implicit declaration of function ?wctomb?
 > [-Wimplicit-function-declaration]
 >      IGNORE_CALL_RESULT(wctomb(NULL, 0));

Nano needs wide character support. It sounds like you have built a
toolchain without it, and then changed the toolchain configuration and
added nano without doing a clean rebuild.

You need to do a clean rebuild if you change toolchain options.

-- 
Bye, Peter Korsgaard
