From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 16 Aug 2015 14:04:12 +0200
Subject: [Buildroot] How to fix buildroot Errors?
In-Reply-To: <CA+yqE7_X-mMYS7t_xhZCYdsqeThf3zFh0X1pFWYKTYh4otoQjg@mail.gmail.com>
References: <CA+yqE7_X-mMYS7t_xhZCYdsqeThf3zFh0X1pFWYKTYh4otoQjg@mail.gmail.com>
Message-ID: <20150816120412.GD3650@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hmidi, All,

On 2015-08-16 13:28 +0200, Hmidi Slim spake thusly:
> After make configurations on buildroot,I run Make the I got these message
> errors:
> File
> "/home/slim/T?l?chargements/buildroot-2015.05/output/host/usr/lib/python2.7/json/__init__.py",
> line 338, in loads
>     return _default_decoder.decode(s)
>   File
> "/home/slim/T?l?chargements/buildroot-2015.05/output/host/usr/lib/python2.7/json/decoder.py",
> line 366, in decode
>     obj, end = self.raw_decode(s, idx=_w(s, 0).end())
>   File
> "/home/slim/T?l?chargements/buildroot-2015.05/output/host/usr/lib/python2.7/json/decoder.py",
> line 382, in raw_decode
>     obj, end = self.scan_once(s, idx)
> ValueError: Invalid \escape: line 10 column 46 (char 416)
> make[1]: *** [install] Error 1
> make[1]: Leaving directory
> `/home/slim/T?l?chargements/buildroot-2015.05/output/build/host-nodejs-0.10.38'
> make: ***
> [/home/slim/T?l?chargements/buildroot-2015.05/output/build/host-nodejs-0.10.38/.stamp_host_installed]
> Error 2

As discussed on IRC, and for future reference: the problem is caused by
the accentuation in "T?l?chargements" (french for "Downloads").

The problem still occurs on master, but is not related to Buildroot.
It's nodjs' JSON decoder that does not know how to deal with
accentuation... :-(

Hmidi, maybe you could file a bug report in nodejs' own tracker, along
the lines of:

    "If a path contains frenc accentuation, like "T?l?chargements", the
    build fails with:"
    (and quote the error message above)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
