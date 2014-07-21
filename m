From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 22 Jul 2014 00:11:19 +0200
Subject: [Buildroot] [PATCH 3/4] mysql: add mysql init script
In-Reply-To: <1393944603-3104-3-git-send-email-kuyurix@gmail.com>
References: <1393944603-3104-1-git-send-email-kuyurix@gmail.com>
 <1393944603-3104-3-git-send-email-kuyurix@gmail.com>
Message-ID: <20140722001119.14837d38@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Marcelo Guti?rrez,

On Tue,  4 Mar 2014 14:50:02 +0000, Marcelo Guti?rrez wrote:

> +case "$1" in
> +	start)
> +		/usr/bin/mysqld_safe &

I've added a call to mysql_install_db on the first boot, to generate
the MySQL system tables, otherwise the server refuses to start. I've
also used --pid-file when calling mysqld_safe to explicitly specify
where the pid file should be stored, because...

> +		;;
> +	stop)
> +		if test -f /var/lib/mysql/mysqld.pid ; then
> +			PID=`cat /var/lib/mysql/mysqld.pid`

... it wasn't stored there, so I fixed that up as well.

Committed with those changes, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
