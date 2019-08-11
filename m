From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 11 Aug 2019 14:18:33 +0200
Subject: [Buildroot] [PATCH] package/mpg123: security bump to version
 1.25.11
In-Reply-To: <20190811094111.11814-1-joerg.krause@embedded.rocks>
References: <20190811094111.11814-1-joerg.krause@embedded.rocks>
Message-ID: <20190811141833.472120e6@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 11 Aug 2019 11:41:11 +0200
J?rg Krause <joerg.krause@embedded.rocks> wrote:

> From https://www.mpg123.de/cgi-bin/news.cgi:
> 
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
> 
> The serious bugs trigger Denial of Service either via the nasty endless loop in
> supposed APE tags or by crashes if the invalid reads hit a diagnostic by the OS
> or, more likely, a security mechanism like the sanitizer instrumentation that
> enabled finding the bugs.
> 
> I do not have CVE numbers for these bugs. I rather fix the bugs than name them.
> Just update, will you?
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  package/mpg123/mpg123.hash | 8 ++++----
>  package/mpg123/mpg123.mk   | 2 +-
>  2 files changed, 5 insertions(+), 5 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
