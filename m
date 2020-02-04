From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 04 Feb 2020 14:55:29 +0100
Subject: [Buildroot] [PATCH v3 7/8] package/mariadb: do not pass
 --user=mysql to mysql_install_db
In-Reply-To: <20200204012200.7273-7-bluemrp9@gmail.com> (Ryan Coe's message of
 "Mon, 3 Feb 2020 17:21:59 -0800")
References: <20200204012200.7273-1-bluemrp9@gmail.com>
 <20200204012200.7273-7-bluemrp9@gmail.com>
Message-ID: <87sgjqjw32.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ryan" == Ryan Coe <bluemrp9@gmail.com> writes:

 > We currently install the default database by passing --user=mysql to the
 > install script. With the upcoming bump to the 10.4 series, this does not
 > work as intended. An error occurs because of missing PAM modules. We work
 > around this now by creating the default db as root and calling chown to
 > change the files to user mysql.

 > Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
 > ---
 > Changes v2 -> v3:
 >   - separate changes into seperate patches (suggested by Thomas)
 > Changes v1 -> v2:
 >   - no change

Committed, thanks.

-- 
Bye, Peter Korsgaard
