From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 23 Feb 2015 20:07:48 +0100
Subject: [Buildroot] [PATCH] package/libevent: fix static build
In-Reply-To: <2008003175.212046.1424715113306.JavaMail.root@openwide.fr>
References: <20150223190040.70f41d55@free-electrons.com>
 <2008003175.212046.1424715113306.JavaMail.root@openwide.fr>
Message-ID: <20150223200748.46ce9690@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Mon, 23 Feb 2015 19:11:53 +0100 (CET), Romain Naour wrote:

> Can you try to build libwebsock with your config ?
> 
> Sorry, I meant libwebsock fix static build.
> 
> libevent break libwebsock's build because libevent_openssl.pc is not
> installed.

Ah, right, now I can reproduce the problem. Instead of trying to get
AC_SEARCH_LIB to work properly with static libraries, how about using
PKG_CHECK_MODULES() instead to rely on pkg-config? Something like:
