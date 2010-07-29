From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 29 Jul 2010 16:30:08 +0200
Subject: [Buildroot] [PATCH 1/2] gcc: remove option on SJLJ exceptions
In-Reply-To: <201007290718.59051.minimod@morethan.org>
References: <cover.1280385006.git.thomas.petazzoni@free-electrons.com>
	<20100729133837.5680e0c2@surf>
	<201007290659.39124.minimod@morethan.org>
	<201007290718.59051.minimod@morethan.org>
Message-ID: <20100729163008.468a211e@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Michael,

On Thu, 29 Jul 2010 07:18:56 -0500
"Michael S. Zick" <minimod@morethan.org> wrote:

> mszick at wolf466:~$ lua
> Lua 5.1.4  Copyright (C) 1994-2008 Lua.org, PUC-Rio
> > bye = function() return os.exit("String Value") end
> > bye()
> stdin:1: bad argument #1 to 'exit' (number expected, got string)
> stack traceback:
>         [C]: in function 'exit'
>         stdin:1: in function 'bye'
>         stdin:1: in main chunk
>         [C]: ?

With the current Buildroot git (i.e, without SJLJ exceptions), I built
an ARM system with Lua, and made your test under Qemu. I had the exact
same output, with the exact same stack trace.

Are more complicated cases likely to make a difference ?

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
