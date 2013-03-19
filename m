From: Alexander Lukichev <alexander.lukichev@gmail.com>
Date: Tue, 19 Mar 2013 07:29:28 +0200
Subject: [Buildroot] Problems with zeromq 3.2.2
In-Reply-To: <20130318155928.6334b9b8@skate>
References: <CAHt8ZCM0W1Lnn4LotB8QYp90J3CgUjR4VL17WnPLum6M9Q0E8Q@mail.gmail.com>
 <CAAHaz6HmMaXNjSh_ZsqWDaOe3Ajm0kFhyPd0PxMCHsBys967JA@mail.gmail.com>
 <20130318155928.6334b9b8@skate>
Message-ID: <CAAHaz6ExNEoZW-SF_U6byhEO_J4AEw4fMHv8mzy5HaqiBjKw2Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi, Thomas, Simon, All!

2013/3/18 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

> Why don't we simply create a package for the separate project
> that provides the C++ bindings? Do these offer an API that is
> compatible with the C++ API that was provided by zmq 2.x?

Looks like it. It is the same <zmq.hpp> as in zmq 2.x but slightly
updated, see https://github.com/zeromq/cppzmq/commits/master

I am not able to test how well it aligns with the existing zmq 2.x-based
C++ code, though. I'll try to make a patch that installs that if the user
selected zeromq and "C++ bindings" for it, and send it here for
comments.

Does "C++ bindings" really need to be a separate buildroot
"package"? It is just one header, dependent on zeromq package,
only fetched now from a separate location.

--
Best regards,
  Alexander Lukichev
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130319/f14c668b/attachment.html>
