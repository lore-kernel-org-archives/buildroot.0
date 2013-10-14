From: =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jezz@sysmic.org>
Date: Mon, 14 Oct 2013 11:16:08 +0200
Subject: [Buildroot] [PATCH] Compile static versions of gcc libraries
In-Reply-To: <20131013153355.3839117b@skate>
References: <1381398042-6925-1-git-send-email-jezz@sysmic.org>
 <20131013153355.3839117b@skate>
Message-ID: <2096076.neUu8LQVqN@sagittae>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sunday 13 October 2013 15:33:55 Thomas Petazzoni wrote:
> Dear J?r?me Pouiller,
> 
> On Thu, 10 Oct 2013 11:40:42 +0200, J?r?me Pouiller wrote:
> > Since default configure options for host packages include
> > --disable-static, gcc was not configured to build static version of
> > its libraries (libgcc.a, libstdc++.a, ...).
> 
> I'm a bit confused, the toolchains I have here definitely do have
> libgcc.a :
> 
> $ find . -name 'libgcc.a'
> ./host/usr/lib/gcc/sh4-buildroot-linux-uclibc/4.7.3/libgcc.a

Sorry, in contrary of what I wrote in my commit message, this does not 
impact libgcc.a. However, it impacts libstdc++.a, libgomp.a, 
libmudflap*.a, ...

> What practical issue are you seeing?
My main concern is libstdc++.a.


-- 
J?r?me Pouiller, Sysmic
Embedded Linux specialist
http://www.sysmic.fr
