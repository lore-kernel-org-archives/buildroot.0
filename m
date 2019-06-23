From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 23 Jun 2019 21:46:05 +0200
Subject: [Buildroot] [PATCH v1] libcdaudio: fix compile on host systems
 without C++ support
In-Reply-To: <20190113214722.15104-1-ps.report@gmx.net>
References: <20190113214722.15104-1-ps.report@gmx.net>
Message-ID: <20190623214605.14a93a24@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 13 Jan 2019 22:47:22 +0100
Peter Seiderer <ps.report@gmx.net> wrote:

> Delivered libcdaudio configure tries to run a C++ check with the
> host C preprocessor. Fix it by enabling autoreconf  (needs
> a patch for configure.ac/Makefile.am removing ancient lines).
> 
> Fixes [1]:
> 
>   checking how to run the C++ preprocessor... /lib/cpp
>   configure: error: C++ preprocessor "/lib/cpp" fails sanity check
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Contrary to what your commit title says, the problem does not occur
when the host system lacks C++ support, it's when the target toolchain
doesn't have C++ support. I have an Arch Linux system here (which is
where the failure happens), and the host system has C++ support, but
doesn't provide /lib/cpp.

I fixed up the commit title, commit log, and comment in the .mk file
and applied.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
