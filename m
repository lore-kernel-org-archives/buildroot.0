From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 15 Mar 2012 21:53:27 +0100
Subject: [Buildroot] [PATCH resend] new package: zeromq
In-Reply-To: <CAAXf6LVtbfbktV6Ke2DN7MxW=rRTbLNQAeJLDz=_YVEdzTXJBQ@mail.gmail.com>
 (Thomas De Schampheleire's message of "Thu, 15 Mar 2012 20:26:56
 +0100")
References: <7cbcbbf3191cf0d5fab5.1331743096@beantl019720>
 <87k42mrvkq.fsf@macbook.be.48ers.dk>
 <CAAXf6LVtbfbktV6Ke2DN7MxW=rRTbLNQAeJLDz=_YVEdzTXJBQ@mail.gmail.com>
Message-ID: <8762e5si0o.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> writes:

Hi,

 >> Util-linux also depends on LARGEFILE, so you need that as well.
 >> Zeromq is written in C++, so you also need INSTALL_LIBSTDCPP.

 Thomas> Is there somewhere some documentation that explains these rules? The
 Thomas> C++ thing is new to me for example.

Well, it's pretty simple - There's basically 2 kind of dependencies:

1: Toolchain configuration options (largefile, wchar, C++, ..)
2: Libraries

For the first type we use 'depends by' and add a comment so people know
what to change in their toolchain to be able to use the package. For the
second we automatically enable the dependencies using 'select'.

There's a few special situations that fall outside this (an example is
when you have multiple backends like X11 and directfb), but this covers
90%+ of the situations.

-- 
Bye, Peter Korsgaard
