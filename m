From: =?UTF-8?Q?C=C3=A9dric_Marie?= <cedric.marie@openmailbox.org>
Date: Thu, 23 Apr 2015 08:59:19 +0200
Subject: [Buildroot] [PATCH] pkg-cmake: Skip compilation in installation
 step
In-Reply-To: <5538266A.1070006@mind.be>
References: <1429733516-4466-1-git-send-email-cedric.marie@openmailbox.org>
 <5538266A.1070006@mind.be>
Message-ID: <0383c034bd5f3c3c6c55a6d6d381f3ba@openmailbox.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

> Would it also make sense we install cmake itself with this rule, in
> package/cmake/cmake.mk:47 , too?

That could make sense, yes. I had not thought about CMake being compiled 
with CMake generated makefiles.


> Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> 
>  Doing it for host-cmake itself can be a separate patch. And not very 
> important
> either, I can't measure the time difference...

OK for a separate patch.

I agree the time difference is not so big. But it can be several seconds 
with some packages (it is done twice: staging + target). When you have 
to rebuild your package regularly, you certainly appreciate saving these 
few seconds. I do :)

In fact, it is a little bit strange that the default behaviour of CMake 
install is to compile before installing. I understand it can be useful 
to check that everything is up-to-date, and maybe check if a new 
installation rule has been added. But outside Buildroot, when installing 
a CMake package to your computer, it might result in compiling with root 
privileges (since make install is likely to be called with root 
privileges). This point is out-of-scope regarding Buildroot, I was just 
wondering about CMake default behaviour...


-- 
C?dric
