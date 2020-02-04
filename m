From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 04 Feb 2020 14:38:31 +0100
Subject: [Buildroot] [PATCH v3 1/8] package/mariadb: fix permissions of
 data dir when using systemd
In-Reply-To: <20200204012200.7273-1-bluemrp9@gmail.com> (Ryan Coe's message of
 "Mon, 3 Feb 2020 17:21:53 -0800")
References: <20200204012200.7273-1-bluemrp9@gmail.com>
Message-ID: <87imkmlbfs.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ryan" == Ryan Coe <bluemrp9@gmail.com> writes:

 > mysql_install_db is currently called in the systemd unit without
 > --user=mysql that the sysv script uses. This will generate the initial
 > database files with root permissions. However, mysqld runs as user mysql
 > so this will cause problems. We fix this by calling chown instead of
 > passing the user parameter because an upcoming version bump will fail when
 > ran this way.

It would be good to explain what that failure is, but OK.

Committed, thanks.

-- 
Bye, Peter Korsgaard
