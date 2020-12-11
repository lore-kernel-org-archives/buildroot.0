From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 11 Dec 2020 22:27:27 +0100
Subject: [Buildroot] [PATCH] package/mariadb: security bump to version
 10.3.27
In-Reply-To: <20201128224147.23260-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sat, 28 Nov 2020 23:41:46 +0100")
References: <20201128224147.23260-1-peter@korsgaard.com>
Message-ID: <874kksqbi8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issues:
 > - CVE-2020-15180: during SST a joiner sends an sst method name to the donor.
 >   Donor then appends it to the "wsrep_sst_" string to get the name of the
 >   sst script to use, e.g.  wsrep_sst_rsync.  There is no validation or
 >   filtering here, so if the malicious joiner sends, for example, "rsync `rm
 >   -rf /`" the donor will execute that too.

 > - CVE-2020-14812: Vulnerability in the MySQL Server product of Oracle MySQL
 >   (component: Server: Locking).  Supported versions that are affected are
 >   5.6.49 and prior, 5.7.31 and prior and 8.0.21 and prior.  Easily
 >   exploitable vulnerability allows high privileged attacker with network
 >   access via multiple protocols to compromise MySQL Server.  Successful
 >   attacks of this vulnerability can result in unauthorized ability to cause
 >   a hang or frequently repeatable crash (complete DOS) of MySQL Server.

 > - CVE-2020-14765: Vulnerability in the MySQL Server product of Oracle MySQL
 >   (component: Server: FTS).  Supported versions that are affected are 5.6.49
 >   and prior, 5.7.31 and prior and 8.0.21 and prior.  Easily exploitable
 >   vulnerability allows low privileged attacker with network access via
 >   multiple protocols to compromise MySQL Server.  Successful attacks of this
 >   vulnerability can result in unauthorized ability to cause a hang or
 >   frequently repeatable crash (complete DOS) of MySQL Server.

 > - CVE-2020-14776: Vulnerability in the MySQL Server product of Oracle MySQL
 >   (component: InnoDB).  Supported versions that are affected are 5.7.31 and
 >   prior and 8.0.21 and prior.  Easily exploitable vulnerability allows high
 >   privileged attacker with network access via multiple protocols to
 >   compromise MySQL Server.  Successful attacks of this vulnerability can
 >   result in unauthorized ability to cause a hang or frequently repeatable
 >   crash (complete DOS) of MySQL Server.

 > - CVE-2020-14789: Vulnerability in the MySQL Server product of Oracle MySQL
 >   (component: Server: FTS).  Supported versions that are affected are 5.7.31
 >   and prior and 8.0.21 and prior.  Easily exploitable vulnerability allows
 >   high privileged attacker with network access via multiple protocols to
 >   compromise MySQL Server.  Successful attacks of this vulnerability can
 >   result in unauthorized ability to cause a hang or frequently repeatable
 >   crash (complete DOS) of MySQL Server.

 > - CVE-2020-28912:
 >   https://www.usenix.org/system/files/conference/usenixsecurity18/sec18-bui.pdf
 >   describes a named pipe privilege vulnerability, specifically for MySQL,
 >   where an unprivileged user, located on the same machine as the server, can
 >   act as man-in-the-middle between server and client.

 > Additionally, 10.3.27 fixes a regression added in 10.3.26.

 > Drop weak md5/sha1 checksums.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2020.02.x and 2020.08.x, thanks.

-- 
Bye, Peter Korsgaard
