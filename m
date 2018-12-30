From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 30 Dec 2018 22:42:39 +0100
Subject: [Buildroot] [PATCH] package/sqlite: security bump to version
 3.25.3
In-Reply-To: <20181222074448.24100-1-peter@korsgaard.com>
References: <20181222074448.24100-1-peter@korsgaard.com>
Message-ID: <20181230224239.7f204bc2@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 22 Dec 2018 08:44:47 +0100, Peter Korsgaard wrote:
> Fixes CVE-2018-20346: SQLite before 3.25.3, when the FTS3 extension is
> enabled, encounters an integer overflow (and resultant buffer overflow) for
> FTS3 queries that occur after crafted changes to FTS3 shadow tables,
> allowing remote attackers to execute arbitrary code by leveraging the
> ability to run arbitrary SQL statements (such as in certain WebSQL use
> cases), aka Magellan.
> 
> For more details, see:
> https://blade.tencent.com/magellan/index_en.html
> https://www.sqlite.org/releaselog/3_25_3.html
> https://www.mail-archive.com/sqlite-users at mailinglists.sqlite.org/msg113218.html
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/sqlite/sqlite.hash | 4 ++--
>  package/sqlite/sqlite.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
