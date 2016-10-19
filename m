From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 19 Oct 2016 23:38:02 +0200
Subject: [Buildroot] [PATCH v1] motion: fix postgresql support
In-Reply-To: <1476734488-3436-1-git-send-email-ps.report@gmx.net>
References: <1476734488-3436-1-git-send-email-ps.report@gmx.net>
Message-ID: <20161019233802.40916531@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 17 Oct 2016 22:01:28 +0200, Peter Seiderer wrote:
> The commandline paramter to enable/disable postgresql support is
> called '--with-pgsql/--without-pgsql' and not '--with-postgresql/
> --without-postgresql'.
> 
> Fixes [1] in case postgresql development files are installed on the host:
> 
>   checking for PostgreSQL... testing
>   checking autodect pgsql headers... yes /usr/include/postgresql
>   checking autodect pgsql libs... /usr/lib64
>   checking for PQconnectStart in -lpq... no
>   configure: error: PostgreSQL support can't build without PostgreSQL libraries
> 
> [1] http://autobuild.buildroot.net/results/749/7497730da2affffe0e5b9b790081de10c269f416
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  package/motion/motion.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
