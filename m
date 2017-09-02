From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Sep 2017 23:12:52 +0200
Subject: [Buildroot] [PATCH v2 07/11] package/flex: disable reallocarray
In-Reply-To: <20170902205423.21288-8-romain.naour@gmail.com>
References: <20170902205423.21288-1-romain.naour@gmail.com>
 <20170902205423.21288-8-romain.naour@gmail.com>
Message-ID: <20170902231252.44d10e64@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  2 Sep 2017 22:54:19 +0200, Romain Naour wrote:
> This doesn't compile with glibc 2.26 where reallocarray() as been introduced.
> 
> Fixes:
> stage1flex-misc.o: In function `allocate_array':
> misc.c:(.text+0x38f): undefined reference to `reallocarray'
> stage1flex-misc.o: In function `reallocate_array':
> misc.c:(.text+0xc8a): undefined reference to `reallocarray'
> collect2: error: ld returned 1 exit status

This commit log is a bit mysterious: if reallocarray() has been
introduced in glibc 2.26, why isn't flex able to use it ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
