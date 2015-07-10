From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 Jul 2015 09:54:19 +0200
Subject: [Buildroot] [PATCH 7/7 v2] mysql: add mariadb galera cluster
 variant
In-Reply-To: <CAHXCMMKV79jKA9YcA_f6KxWuivKMjP8_zZKjHjAHDU6hgiiXCg@mail.gmail.com>
References: <1436458921-4199-1-git-send-email-sylvain.raybaud@green-communications.fr>
 <1436458921-4199-8-git-send-email-sylvain.raybaud@green-communications.fr>
 <CAHXCMMKV79jKA9YcA_f6KxWuivKMjP8_zZKjHjAHDU6hgiiXCg@mail.gmail.com>
Message-ID: <20150710095419.1ec6da31@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Thu, 9 Jul 2015 23:56:25 +0200, Samuel Martin wrote:

> Here is a partial review (inlined).
> 
> But, overall, I feel like this implementation (essentially the *.mk
> file) does not match the Buildroot way of doing things... :-/
> Have you look at the virtual package infrastructure [1]?

Fully agreed. Using the same package for both MySQL and MariaDB would
make sense if their build system was similar. But it's completely
different, so it really needs to be two separate packages.

Then, if their client libraries are compatible, so that client
applications can use either MySQL or MariaDB with no change, then doing
a virtual package is indeed the right direction.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
