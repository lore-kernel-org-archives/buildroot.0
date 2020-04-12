From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Apr 2020 22:22:19 +0200
Subject: [Buildroot] [PATCH v4 1/1] package/mariadb: patch
 mariadb_config to add sysroot path
In-Reply-To: <20200213174655.17309-1-bluemrp9@gmail.com>
References: <20200213174655.17309-1-bluemrp9@gmail.com>
Message-ID: <20200412222219.34d94ceb@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 13 Feb 2020 09:46:55 -0800
Ryan Coe <bluemrp9@gmail.com> wrote:

> This patch adds @CMAKE_SYSROOT@ to mariadb_config.c.in. Without it,
> mariadb_config and mysql_config incorrectly returns host paths for
> include paths and library paths.
> 
> Upstream report and status:
> https://jira.mariadb.org/browse/CONC-454
> https://github.com/mariadb-corporation/mariadb-connector-c/pull/127
> 
> Reported-by: Alexey Lukyanchuk <skif@skif-web.ru>
> Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
> ---
> Changes v3 -> v4:
>   - add upstream status (suggested by Peter)
> Changes v2 -> v3:
>   - remove extra slash between CMAKE_SYSROOT and CMAKE_INSTALL_PREFIX
> Changes v1 -> v2:
>   - no change
> ---
>  ...2-add-sysroot-path-to-mariadb_config.patch | 32 +++++++++++++++++++
>  1 file changed, 32 insertions(+)
>  create mode 100644 package/mariadb/0002-add-sysroot-path-to-mariadb_config.patch

Applied to master, thanks. I have updated the upstream status, since
the patch has been accepted upstream. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
