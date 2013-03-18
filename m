From: Alexander Lukichev <alexander.lukichev@gmail.com>
Date: Mon, 18 Mar 2013 16:41:30 +0200
Subject: [Buildroot] Problems with zeromq 3.2.2
In-Reply-To: <CAAHaz6HmMaXNjSh_ZsqWDaOe3Ajm0kFhyPd0PxMCHsBys967JA@mail.gmail.com>
References: <CAHt8ZCM0W1Lnn4LotB8QYp90J3CgUjR4VL17WnPLum6M9Q0E8Q@mail.gmail.com>
 <CAAHaz6HmMaXNjSh_ZsqWDaOe3Ajm0kFhyPd0PxMCHsBys967JA@mail.gmail.com>
Message-ID: <CAAHaz6HTNHh_yCiPpXHewSaaE0NHqCx+aH09VHO36vp-iPrJow@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi, Simon!

I am hasty, as always. Let me make another correction :)

2013/3/18 Alexander Lukichev <alexander.lukichev@gmail.com>

>you use C++ bindings. That was bundled with zmq-2.x but as the
> library itself is written in C language and the number of other
> language bindings has grown significantly (see the list here
>http://www.zeromq.org/bindings:_start ), C++ bindings were made
> into a separate project, just like other languages.

There appears to be another reason for this: the zmq.hpp header
code that was bundled with the zeromq package fell into some
lack of maintenance. It was split off into separate project so that
other people could improve it. See e.g. this thread
http://lists.zeromq.org/pipermail/zeromq-dev/2011-September/013226.html

There is a more high-level bindings for C++:

https://github.com/benjamg/zmqpp

There is also one for integration with Qt:

https://github.com/jonnydee/nzmqt

(actually, there is another one but it seems to be too old and
unmaintained), if you are interested. This one I've tested and am
using (modified) in a project right now.

--
Best regards,
  Alexander Lukichev
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130318/35c64a14/attachment-0001.html>
