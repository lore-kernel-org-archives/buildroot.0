From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 20 Jul 2020 22:52:04 +0200
Subject: [Buildroot] [PATCH] package/sqlite: bump version 3.32.3
In-Reply-To: <20200709215759.53406-1-sam.voss@rockwellcollins.com> (Sam Voss's
 message of "Thu, 9 Jul 2020 16:57:59 -0500")
References: <20200709215759.53406-1-sam.voss@rockwellcollins.com>
Message-ID: <87wo2xoqob.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sam" == Sam Voss <sam.voss@rockwellcollins.com> writes:

 > Fixes the following CVEs:
 > - CVE-2019-19923 (Fixed in 3.31.0)

 > SQLite is vulnerable to denial-of-service condition because of a NULL
 > pointer dereferencing while handling `SELECT DISTINCT`statements.

 > - CVE-2019-19924 (Fixed in 3.31.0)

 > The SQLite mishandles certain SQL commands due to improper error
 > handling by ` sqlite3WindowRewrite() ` function.

 > - CVE-2020-13435 (Fixed in 3.32.1)

 > SQLite is vulnerable to denial-of-service (DoS) due to improper handling
 > of query rewriting. An attacker could exploit this vulnerability by
 > supplying a system with maliciously crafted input.

 > - CVE-2020-13632 (Fixed in 3.32.0)

 > SQLite is vulnerable to denial-of-service (DoS) due to improper pointer
 > management in the FTS3 virtual table module. An attacker could exploit
 > this vulnerability by supplying a system with maliciously crafted input.

 > - CVE-2020-13434 (Fixed in 3.32.1)

 > SQLite is vulnerable to denial-of-service (DoS) due to improper handling
 > of floating-point operations. An attacker could exploit this
 > vulnerability by supplying a system with maliciously crafted input.

 > - CVE-2020-13871 (Fixed in 3.32.3)

 > SQLite 3.32.2 has a use-after-free in resetAccumulator in select.c
 > because the parse tree rewrite for window functions is too late.

 > - CVE-2020-13630 (Fixed in 3.32.0)

 > SQLite is vulnerable to denial-of-service (DoS) due to a use after free
 > issue in the FTS3 virtual table module. An attacker could exploit this
 > vulnerability by supplying a system with maliciously crafted input.

 > - CVE-2020-15358 (Fixed in 3.32.3)

 > SQLite is vulnerable to a heap-based buffer overflow flaw in part of an
 > optimization feature. An attacker able to issue specially crafted
 > queries could cause the application to crash, resulting in a
 > denial-of-service (DoS).

 > - CVE-2020-9327 (Fixed in 3.32.0)

 > SQLite is vulnerable to a Null pointer dereference flaw. A remote
 > attacker able to issue specially crafted SQL statements may be able to
 > cause a segmentation fault and application crash, resulting in a
 > denial-of-service (DoS).

 > - CVE-2019-19645 (Fixed in 3.31.0)

 > It was discovered that SQLite contains an denial-of-service (DoS)
 > vulnerability. An attacker could exploit this to trigger an infinite
 > recursion resulting in excessive resource consumption leading to a DoS
 > condition.

 > - CVE-2019-19926 (Fixed in 3.31.0)

 > The SQLite allows denial-of-service attack due to improper input
 > validation of user-supplied input.

 > - CVE-2020-11655 (Fixed in 3.32.0)

 > SQLite contains a memory corruption vulnerability. Successfully
 > exploiting this issue may allow attackers to cause a denial-of-service
 > (DoS). This allows an attacker to cause SQLite to crash by issuing a
 > crafted SQL query to the database.

 > - CVE-2019-19925 (Fixed in 3.31.0)

 > The INSERT statement fails when the zip file path is `NULL`.

 > - CVE-2019-19242 (Fixed in 3.31.0)

 > SQLite is vulnerable to a denial-of-service (DoS). An attacker could
 > exploit this vulnerability by supplying a maliciously crafted query to
 > cause an application crash.

 > - CVE-2019-19244 (Fixed in 3.31.0)

 > SQLite is vulnerable to a denial-of-service. An attacker could exploit
 > this vulnerability by providing a crafted SELECT statement to the SQL
 > server, resulting in an application crash.

 > - CVE-2020-13631 (Fixed in 3.32.0)

 > SQLite is vulnerable to data manipulation due to improper management of
 > virtual tables. An attacker could exploit this vulnerability by
 > supplying a system with maliciously crafted input.

 > - CVE-2020-11656 (Fixed in 3.32.0)

 > SQLite contains a Use-After-Free vulnerability. Successfully exploiting
 > this issue may allow attackers to cause a denial-of-service (DoS). This
 > allows an attacker to cause SQLite to crash by issuing a crafted SQL
 > query to the database.

 > - CVE-2019-19880 (Fixed in 3.31.0)

 > SQLite is vulnerable to denial-of-service (DoS) due to the mismanagement
 > of memory resources. A remote attacker could cause a victim's instance
 > of the application to crash by submitting crafted request that will lead
 > to the application parsing problematic integer values.

 > - CVE-2019-20218 (Fixed in 3.31.0)

 > SQLite is vulnerable to denial-of-service (DoS) due to improper
 > exception handling which could lead to unwinding of the `WITH` stack
 > following parsing errors. An attacker could exploit this vulnerability
 > by supplying a system with maliciously crafted input.

 > - CVE-2019-19603 (Fixed in 3.31.0)

 > It was discovered that SQLite contains a denial-of-service (DoS)
 > vulnerability. An authenticated attacker could exploit this
 > vulnerability by creating tables with the same name as shadow table
 > names.

 > - CVE-2019-19959 (Fixed in 3.31.0)

 > SQLite is vulnerable to denial-of-service (DoS) due to the mismanagement
 > of system memory resources. A remote attacker could cause a victim's
 > instance of the application to crash by causing it to process a SQL
 > statement that references a maliciously crafted file name.

 > - CVE-2019-19646 (Fixed in 3.31.0)

 > SQLite is vulnerable to a denial-of-service (DoS). An attacker could
 > exploit this vulnerability by supplying malicious SQL in order to crash
 > the application.

 > - CVE-2019-19317 (Fixed in 3.31.0)

 > SQLite contains a denial-of-service (DoS) vulnerability due to incorrect
 > logic in name lookups. An attacker could exploit this to cause a
 > application crash.

 > Signed-off-by: Sam Voss <sam.voss@rockwellcollins.com>
 > CC: Peter Korsgard <peter@korsgaard.com>

 > ---

 > Peter: Can this be put onto the 2020.02 LTS as it carries a lot of
 > security fixes?

Committed to 2020.02.x and 2020.05.x, thanks.

-- 
Bye, Peter Korsgaard
