From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 28 Nov 2009 23:44:25 +0100
Subject: [Buildroot] BB update Was:  Build jobbing
In-Reply-To: <200911281516.07279.minimod@morethan.org> (Michael S. Zick's
	message of "Sat\, 28 Nov 2009 15\:16\:05 -0600")
References: <200911271522.58858.minimod@morethan.org>
	<200911281341.45157.minimod@morethan.org>
	<87d4324cl3.fsf@macbook.be.48ers.dk>
	<200911281516.07279.minimod@morethan.org>
Message-ID: <874ooe46d2.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Michael" == Michael S Zick <minimod@morethan.org> writes:

Hi,

 >> setjmp exceptions is afaik something else. I atleast just built lua
 >> without it being enabled.

 Michael> Look at my print(math.sin(12)) example -
 Michael> bet you don't see any backtrace.

Backtrace? Where should I see a backtrace?

Lua on my host (Debian):
% lua
Lua 5.1.4  Copyright (C) 1994-2008 Lua.org, PUC-Rio
> print(math.sin(12))
-0.53657291800043
> os.exit()

Lua built from BR:

% sudo chroot /tmp/blah /bin/sh
/ # lua
Lua 5.1.4  Copyright (C) 1994-2008 Lua.org, PUC-Rio
> print(math.sin(12))
-0.53657291800043
> os.exit()
/ # exit

Looks the same to me.

And this is without the setjmp exceptions:

% grep SJL .config
# BR2_GCC_USE_SJLJ_EXCEPTIONS is not set

-- 
Bye, Peter Korsgaard
