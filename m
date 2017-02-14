From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Feb 2017 22:43:57 +0100
Subject: [Buildroot] [PATCH v1] ddrescue: fix uclibc compile
In-Reply-To: <20170214194508.24384-1-ps.report@gmx.net>
References: <20170214194508.24384-1-ps.report@gmx.net>
Message-ID: <20170214224357.44b973ad@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 14 Feb 2017 20:45:08 +0100, Peter Seiderer wrote:
> Fixes compile failure with uclibc [1] because of missing stdio.h include:
> 
>   In file included from io.cc:28:0:
>   block.h:219:22: error: ?FILE? has not been declared
>      int write_mapfile( FILE * f = 0, const bool timestamp = false,
> 
> [1] http://autobuild.buildroot.net/results/4ac0754f1cc5ea934d6437e89d1f4906fb3fd0a8
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  .../ddrescue/0001-io.cc-add-stdio.h-include.patch  | 36 ++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
>  create mode 100644 package/ddrescue/0001-io.cc-add-stdio.h-include.patch

Applied to master, thanks. Please submit upstream as well. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
