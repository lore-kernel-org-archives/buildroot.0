From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Wed, 5 Feb 2020 20:27:30 +0100
Subject: [Buildroot] [PATCH] utils/check-package: add a check for the
 separation in the hash files
In-Reply-To: <20200205170729.GI3131@scaer>
References: <20200204103836.7730-1-heiko.thiery@gmail.com>
 <20200205170729.GI3131@scaer>
Message-ID: <CAEyMn7Y_3eGyNY-BezPd9NvHox3tr7-BeLZuAYJodWTe-4zLTw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann, All,

> The script now throwsa traceback:
>
>     $ make check-package
>     [lots of output...]
>     Traceback (most recent call last):
>       File "./utils/check-package", line 194, in <module>
>         __main__()
>       File "./utils/check-package", line 177, in __main__
>         nwarnings, nlines = check_file_using_lib(fname)
>       File "./utils/check-package", line 146, in check_file_using_lib
>         nwarnings += print_warnings(cf.check_line(lineno + 1, text))
>       File "/home/ymorin/dev/buildroot/buildroot/utils/checkpackagelib/lib_hash.py", line 57, in check_line
>         if not re.match("^{}  {}  {}.*$".format(htype, hexa, filename), text):
>       File "/usr/lib/python2.7/re.py", line 141, in match
>         return _compile(pattern, flags).match(string)
>       File "/usr/lib/python2.7/re.py", line 251, in _compile
>         raise error, v # invalid expression
>     sre_constants.error: multiple repeat
>     make: *** [Makefile:1185: check-package] Error 1
>
> Care to have a look at it?

Yes I see it .. the string has to be escaped .. I will prepare that
and send a patch.

--
Heiko
