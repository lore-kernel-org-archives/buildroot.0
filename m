From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 7 Mar 2020 16:08:40 +0100
Subject: [Buildroot] [PATCH v5 09/12] support/scripts/pkg-stats: add
 support for license hash check
In-Reply-To: <20200307075633.7514-10-heiko.thiery@gmail.com>
References: <20200307075633.7514-1-heiko.thiery@gmail.com>
 <20200307075633.7514-10-heiko.thiery@gmail.com>
Message-ID: <20200307160840.2321dbf1@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat,  7 Mar 2020 08:56:30 +0100
Heiko Thiery <heiko.thiery@gmail.com> wrote:

> Store the names of license files and check if they are in the hash file.
> 
> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>

Checking that the license files are in the hash file should not be done
in pkg-stats. pkg-stats is about statistics, not about error reporting.
If anything, this should be checked by check-package, whose results are
anyway taken into account by pkg-stats.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
