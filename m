From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 02 Sep 2019 13:46:56 +0200
Subject: [Buildroot] [PATCH] package/mpg123: security bump to version
 1.25.11
In-Reply-To: <20190811094111.11814-1-joerg.krause@embedded.rocks>
 (=?utf-8?Q?=22J=C3=B6rg?=
 Krause"'s message of "Sun, 11 Aug 2019 11:41:11 +0200")
References: <20190811094111.11814-1-joerg.krause@embedded.rocks>
Message-ID: <875zmazzrj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "J?rg" == J?rg Krause <joerg.krause@embedded.rocks> writes:

 > From https://www.mpg123.de/cgi-bin/news.cgi:
 > Fixes a number of bugs found by OSS-Fuzz:
 >  * Fix out-of-bounds reads in ID3 parser for unsynced frames.
 >    (oss-fuzz-bug 15852)
 >  * Fix out-of-bounds read for RVA2 frames with non-delimited identifier.
 >    (oss-fuzz-bug 15852)
 >  * Fix implementation-defined parsing of RVA2 values.
 >    (oss-fuzz-bug 15862)
 >  * Fix undefined parsing of APE header for skipping. Also prevent endless loop
 >    on premature end of supposed APE header. (oss-fuzz-bug 15864)
 >  * Fix some syntax to make pedantic compiler happy.

 > The serious bugs trigger Denial of Service either via the nasty endless loop in
 > supposed APE tags or by crashes if the invalid reads hit a diagnostic by the OS
 > or, more likely, a security mechanism like the sanitizer instrumentation that
 > enabled finding the bugs.

 > I do not have CVE numbers for these bugs. I rather fix the bugs than name them.
 > Just update, will you?

 > Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>

Committed to 2019.02.x and 2019.05.x, thanks.

-- 
Bye, Peter Korsgaard
