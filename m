From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 28 Apr 2018 15:20:28 +0200
Subject: [Buildroot] [PATCH v2] linux-tool-perf: permit TUI build
In-Reply-To: <20180402150249.7f4e70f1.john@metanate.com>
References: <20180402125145.13431-1-john@metanate.com>
 <20180402130716.GM3625@scaer>
 <20180402150249.7f4e70f1.john@metanate.com>
Message-ID: <20180428152028.1f5236a5@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello John,

On Mon, 2 Apr 2018 15:02:49 +0100, John Keeping wrote:
> Since Linux 3.10, perf's NO_NEWT configuration option simply sets
> NO_SLANG=1 and there is no dependency on libnewt.
> 
> We already handle NO_SLANG correctly based on whether or not
> BR2_PACKAGE_SLANG is selected, so all we accomplish by setting NO_NEWT=1
> is disabling perf's TUI when all of the dependencies are available.
> 
> To simplify all of this, introduce a new config option to enable the
> perf TUI which depends on slang and add a check to prevent building the
> TUI on versions which are too old.  The check for NO_SLANG is equivalent
> to checking if NO_NEWT is required as NO_SLANG was added in the same
> commit that removed the libnewt dependency and deprecated NO_NEWT
> (6692c262df4f, "perf tools: Remove dependency on libnewt", 2013-03-28).
> 
> Signed-off-by: John Keeping <john@metanate.com>
> ---
> On Mon, 2 Apr 2018 15:07:16 +0200, Yann E. MORIN wrote:

Applied to master after adding the BR2_USE_MMU, as pointed out by Yann,
and after tweaking a bit the commit title. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
