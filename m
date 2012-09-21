From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 21 Sep 2012 08:03:05 -0300
Subject: [Buildroot] [PATCH] unionfs: add missing dependency on
	host-pkg-config
In-Reply-To: <1348224356-20104-1-git-send-email-arnout@mind.be>
References: <1348224356-20104-1-git-send-email-arnout@mind.be>
Message-ID: <505C4969.8090707@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/21/12 07:45, Arnout Vandecappelle (Essensium/Mind) wrote:

> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

> How was this never caught by the autobuilders?  Do they happen to
> build host-pkg-config most of the time?  If so, maybe we should make
> the randpackageconfig select a smaller number of packages to increase
> the chance of finding this kind of issue...

Because it uses any pkg-config around, it doesn't honour PKG_CONFIG nor
check for it as a dependency.

Makefile:CPPFLAGS += $(shell pkg-config --cflags fuse)
Makefile:LIB = $(shell pkg-config --libs fuse)

As long as there's one on PATH it'll just work.
Regards.
