From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 10 Jan 2018 20:04:48 +0000
Subject: [Buildroot] [Bug 10566] php.mk is missing option --with-pgsql
In-Reply-To: <bug-10566-163@https.bugs.busybox.net/>
References: <bug-10566-163@https.bugs.busybox.net/>
Message-ID: <bug-10566-163-zXnlvcVo6i@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10566

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |WORKSFORME

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
We already have PostgreSQL support in PHP:

ifeq ($(BR2_PACKAGE_PHP_EXT_PDO_POSTGRESQL),y)
PHP_CONF_OPTS += --with-pdo-pgsql=$(STAGING_DIR)/usr
PHP_DEPENDENCIES += postgresql
endif

Are you sure you had BR2_PACKAGE_PHP_EXT_PDO_POSTGRESQL enabled ?

-- 
You are receiving this mail because:
You are on the CC list for the bug.
