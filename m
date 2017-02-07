From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Mon, 06 Feb 2017 22:33:34 -0200
Subject: [Buildroot] [PATCH 9/9] check-package: check *.mk for typo in
 variable
References: <d4c92dd2-1140-224e-090b-291b4b1e9e40@gmail.com>
Message-ID: <589915de15cc8_1b4d3ff5d49eab882791@ultri3.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain,

On Sat, Jan 21, 2017 at 03:19 PM, Romain Naour wrote:

> Le 31/12/2016 ? 04:21, Ricardo Martincoski a ?crit :

[snip]

> This one produce a false positive with MYSQL_SOCKET from oracle-mysql because
> it's a virtual package providing mysql:
> 
> package/oracle-mysql/oracle-mysql.mk:19: possible typo: MYSQL_SOCKET ->
> *ORACLE_MYSQL*
> 
> MYSQL_SOCKET = /run/mysql/mysql.sock

The easy way is to just add MYSQL_SOCKET to the ALLOWED regex ...

> 
> ORACLE_MYSQL_PROVIDES = mysql
> 
> Maybe we could add an exception for variables named <<provider_name>_PROVIDES>_* ?

... but I will try this generic approach, probably in a similar way I did for
the LINUX_TOOL_ prefix. It sounds more correct.

> 
> MYSQL_SOCKET is used in mariadb and php packages.
> 
> Other warnings (15) are real real typo or variable without the right package prefix.

Thank you for your review.
Sorry the delay.

Best regards,
Ricardo
