From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Sep 2014 22:04:34 +0200
Subject: [Buildroot] [PATCH] util-linux: disable more command for host
 build
In-Reply-To: <1411419290-32334-1-git-send-email-ps.report@gmx.net>
References: <1411419290-32334-1-git-send-email-ps.report@gmx.net>
Message-ID: <20140923220434.07b41701@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Seiderer,

On Mon, 22 Sep 2014 22:54:50 +0200, Peter Seiderer wrote:
> Fixes the following compile error (in case neither curses or ncurses
> development files are installed on the build host):

[...]

> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  package/util-linux/util-linux.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Thanks, applied.

However, instead of all those --disable-<foo>, can't we simply use
--disable-all-programs? Could you try this? I believe in the
host-util-linux, we only care about the libraries (libuuid, etc.), and
not the programs.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
