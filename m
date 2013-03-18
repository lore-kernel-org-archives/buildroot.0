From: Alexander Lukichev <alexander.lukichev@gmail.com>
Date: Mon, 18 Mar 2013 14:13:48 +0200
Subject: [Buildroot] Problems with zeromq 3.2.2
In-Reply-To: <CAHt8ZCM0W1Lnn4LotB8QYp90J3CgUjR4VL17WnPLum6M9Q0E8Q@mail.gmail.com>
References: <CAHt8ZCM0W1Lnn4LotB8QYp90J3CgUjR4VL17WnPLum6M9Q0E8Q@mail.gmail.com>
Message-ID: <CAAHaz6HmMaXNjSh_ZsqWDaOe3Ajm0kFhyPd0PxMCHsBys967JA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi, Simon!

2013/3/18 Simon Dawson <spdawson@gmail.com>
> The zeromq package was recently bumped from version 2.2.0 to
> version 3.2.2. Unfortunately, zeromq 3.x.x is not backward-compatible
> with client code developed to use version 2.2.x.

  I should probably be blamed for this and I am sorry the version bump
breaks your code (most probably, other people's too)!

  The ZeroMQ has moved from version 2.x to 3.2 almost a year ago and
they tried hard not to break things. There is a migration guide for existing
2.x-based code here http://www.zeromq.org/docs:3-1-upgrade It provides
a header that helps preserve compatibility with both zmq-2.x and zmq-3.2.
For example, CZMQ high-level wrapper (http://czmq.zeromq.org/) uses it
to work with both versions of the library.

> For example, it appears that the C++ binding has been removed, and is
> now available as a separate project.

  As I understand, the guide only will not help much in your case because
you use C++ bindings. That was bundled with zmq-2.x but as the library
itself is written in C language and the number of other language bindings
has grown significantly (see the list here
http://www.zeromq.org/bindings:_start ), C++ bindings were made into a
separate project, just like other languages.

> I'm wondering if we should have separate packages in Buildroot for
> zeromq versions 2.2.x and "latest supported". Does anybody have any
> objections? I suppose the alternative is to try to understand the
> complex system of zeromq sub-projects, in order to re-instate the C++
> binding which has been lost in the seemingly-innocuous version bump.

  Maybe it would make sense to make an option to build and install bindings
for C++ when a user selected ZeroMQ in configuration? What do you think?
Bindings for other languages (Python? Perl?) may be installed in a similar
fashion. This makes it more flexible for the user.

--
Best regards,
  Alexander Lukichev
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130318/7a4d53da/attachment.html>
