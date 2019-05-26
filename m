From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 26 May 2019 11:09:12 +0200
Subject: [Buildroot] [PATCH] package/postgresql: security bump to
 version 11.3
In-Reply-To: <20190509204528.18008-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Thu, 9 May 2019 22:45:28 +0200")
References: <20190509204528.18008-1-peter@korsgaard.com>
Message-ID: <87tvdhmvk7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issues:
 > CVE-2019-10129: Memory disclosure in partition routing

 > Prior to this release, a user running PostgreSQL 11 can read arbitrary bytes
 > of server memory by executing a purpose-crafted INSERT statement to a
 > partitioned table.

 > CVE-2019-10130: Selectivity estimators bypass row security policies

 > PostgreSQL maintains statistics for tables by sampling data available in
 > columns; this data is consulted during the query planning process.  Prior to
 > this release, a user able to execute SQL queries with permissions to read a
 > given column could craft a leaky operator that could read whatever data had
 > been sampled from that column.  If this happened to include values from rows
 > that the user is forbidden to see by a row security policy, the user could
 > effectively bypass the policy.  This is fixed by only allowing a
 > non-leakproof operator to use this data if there are no relevant row
 > security policies for the table.

 > For more details, see the release notes:
 > https://www.postgresql.org/about/news/1939/

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2019.02.x, thanks.

-- 
Bye, Peter Korsgaard
