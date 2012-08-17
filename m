From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 17 Aug 2012 19:33:40 +0200
Subject: [Buildroot] [PATCH] erlang: Add new package.
In-Reply-To: <CAFbHwiTCXTT23fGLnz_w8kr+6NmNzV9kK+=nHYpXOY5NOMt1dg@mail.gmail.com>
References: <CAFbHwiTCXTT23fGLnz_w8kr+6NmNzV9kK+=nHYpXOY5NOMt1dg@mail.gmail.com>
Message-ID: <20120817193340.39e7ddb5@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Will,

Le Wed, 4 Apr 2012 17:49:07 +0100,
Will Newton <will.newton@gmail.com> a ?crit :

> ---
>  package/Config.in                     |    1 +
>  package/erlang/Config.in              |    9 +++++++++
>  package/erlang/erlang-build-fix.patch |   13 +++++++++++++
>  package/erlang/erlang.mk              |   26 ++++++++++++++++++++++++++
>  4 files changed, 49 insertions(+), 0 deletions(-)
>  create mode 100644 package/erlang/Config.in
>  create mode 100644 package/erlang/erlang-build-fix.patch
>  create mode 100644 package/erlang/erlang.mk

Thanks for this.

A couple of questions/comments:

 *) Could you update the patch to use autotools-package and
 host-autotools-package in accordance with the latest package
 infrastructure changes?

 *) Could you add your Signed-off by line?

 *) The complete Erlang stuff gets installed in /usr/lib/erlang, even
 the binaries (compiler, interpreter?) in /usr/lib/erlang/bin/. Is this
 the normal installation location? If so, then we should at least
 probably provide a few symlinks from /usr/bin/.

 *) By default the /usr/lib/erlang/ size is 55 MB on ARM. Is this the
 minimal size of the standard library?

 *) From the configure.in script, I see options like shared-zlib, or
 ssl path or things like that, but your erlang package does not depend
 on zlib nor OpenSSL. Can you give a few comments about this?

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
