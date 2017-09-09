From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 9 Sep 2017 22:25:55 +0200
Subject: [Buildroot] [PATCH] bind: fix compilation when lmdb.h is
 present on host
In-Reply-To: <20170908140249.24338-1-julien.floret@6wind.com>
References: <20170908140249.24338-1-julien.floret@6wind.com>
Message-ID: <20170909222555.7e26727d@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  8 Sep 2017 16:02:49 +0200, Julien Floret wrote:
> From: Robin Jarry <robin.jarry@6wind.com>
> 
> Bind autoconf scripts look for lmdb.h in /usr/include (even when
> cross-compiling). When liblmdb-dev is installed, this causes the
> following error:
> 
>     ...
>     checking for lmdb library... yes
>     checking for library containing mdb_env_create... no
>     configure: error: found lmdb include but not library.
> 
> Fix this by disabling explicitly lmdb support.
> 
> Signed-off-by: Robin Jarry <robin.jarry@6wind.com>
> Signed-off-by: Julien Floret <julien.floret@6wind.com>
> ---
>  package/bind/bind.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
