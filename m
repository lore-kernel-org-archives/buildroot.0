From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 21 May 2017 23:57:43 +0200
Subject: [Buildroot] [PATCH 1/1] mariadb: security bump to version
	10.1.23
In-Reply-To: <049c9e3d-2262-476b-008a-12e53d0a8598@gmail.com> (Ryan Coe's
 message of "Fri, 19 May 2017 08:44:53 -0700")
References: <20170508153716.16809-1-bluemrp9@gmail.com>
 <87efvzno6c.fsf@dell.be.48ers.dk>
 <7f264a9b-c5cf-feaf-a8bf-929d112fb7f0@gmail.com>
 <87bmqugre8.fsf@dell.be.48ers.dk>
 <049c9e3d-2262-476b-008a-12e53d0a8598@gmail.com>
Message-ID: <87k25927qg.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ryan" == Ryan Coe <bluemrp9@gmail.com> writes:

Hi,

 >> Could you perhaps try to contact the mariadb developers?
 >> 
 > Below is the response that I received on this issue:

 > https://jira.mariadb.org/browse/MDEV-12297

 > This is the full story:

 > * All MySQL code, including libmysqlclient, is GPLv2
 > * When implementing async API for libmysqlclient, we have licensed it
 >   under LGPL. That's when COPYING.LESSER was added. Apparently someone
 >   thought that having both COPYING and COPYING.LESSER means that the
 >   project includes both GPL and LGPL components
 > * Then we got MDEV-12297, saying Github suddenly started showing MariaDB
 >   license as LGPL
 > * Github uses a library "licensee" to detect the license, and it was a
 >   recent bugfix in licensee to return "LGPL" when both COPYING and
 >   COPYING.LESSER are present.
 > * Indeed,https://www.gnu.org/licenses/gpl-howto.html  says that LGPL
 >   licensed projects should have both files. So licensee and Github were
 >   right.
 > * At that point in time we already have all async API code in
 >   MariaDB Connector/C library (which is LGPL as a whole), so the
 >   simplest solution was to remove COPYING.LESSER, basically relicensing
 >   async API for libmysqlclient under GPLv2.

 > Practically it changes nothing.
 > MariaDB server was and is GPLv2, we cannot change that.
 > libmysqlclient library was and is GPLv2, we cannot change that.
 > MariaDB Connector/C was and is LGPLv2.1

Ok, thanks for checking!

Committed after adding this link and dropping COPYING.LESSER from
_LICENSE_FILES, thanks.

-- 
Bye, Peter Korsgaard
