From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 11 Sep 2012 16:32:08 +0200
Subject: [Buildroot] [PATCH 1/4] If linux-pam is built,
 enable dbm functionality in Berkeley DB
In-Reply-To: <1347078066-25257-1-git-send-email-golubovsky@gmail.com>
References: <1347078066-25257-1-git-send-email-golubovsky@gmail.com>
Message-ID: <20120911163208.3e9d23b3@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Sat,  8 Sep 2012 00:21:03 -0400,
Dmitry <golubovsky@gmail.com> a ?crit :

> +		$(if $(BR2_PACKAGE_LINUX_PAM),--enable-dbm,--disable-dbm) \

I don't really like this. I think you should rather add a configuration
sub-option in package/berkeleydb/Config.in to enable/disable DBM
support, and then have berkeleydb.mk test this configuration option,
and the linux-pam/Config.in package select it.

I don't like when one package recipe pokes into the configuration
options of another package.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
