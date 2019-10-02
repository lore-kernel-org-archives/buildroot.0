From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 02 Oct 2019 08:10:24 +0200
Subject: [Buildroot] [PATCH] package/mongodb: security bump to version
 4.0.12
In-Reply-To: <20191001210421.8323-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Tue, 1 Oct 2019 23:04:21 +0200")
References: <20191001210421.8323-1-peter@korsgaard.com>
Message-ID: <877e5ny8xb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following (low severity) security vulnerabilities:
 > 4.0.9:

 > - CVE-2019-2386: After user deletion in MongoDB Server the improper
 >   invalidation of authorization sessions allows an authenticated user's
 >   session to persist and become conflated with new accounts, if those
 >   accounts reuse the names of deleted ones
 >   https://jira.mongodb.org/browse/SERVER-38984

 > 4.0.11:

 > - CVE-2019-2389: Incorrect scoping of kill operations in MongoDB Server's
 >   packaged SysV init scripts allow users with write access to the PID file
 >   to insert arbitrary PIDs to be killed when the root user stops the MongoDB
 >   process via SysV init
 >   https://jira.mongodb.org/browse/SERVER-40563

 > - CVE-2019-2390: An unprivileged user or program on Microsoft Windows which
 >   can create OpenSSL configuration files in a fixed location may cause
 >   utility programs shipped with MongoDB server versions less than 4.0.11
 >   https://jira.mongodb.org/browse/SERVER-42233

 > Plus a number of other bugfixes. For details, see the release notes:
 > https://docs.mongodb.com/manual/release-notes/4.0/

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
