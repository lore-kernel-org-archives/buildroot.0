From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 5 Aug 2019 22:21:44 +0200
Subject: [Buildroot] [PATCH] support/testing: fix hardening tests
In-Reply-To: <20190805012050.25311-1-ricardo.martincoski@gmail.com>
References: <20190805012050.25311-1-ricardo.martincoski@gmail.com>
Message-ID: <20190805222144.5a8d9bc3@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun,  4 Aug 2019 22:20:50 -0300
Ricardo Martincoski <ricardo.martincoski@gmail.com> wrote:

> Since "2467822c85 package/checksec: bump to version 2.1.0" the hardening
> tests fail because upstream slightly changed the way the script is
> called.
> According to README.md: "- All options now require `--$option=$value`
> instead of `--$option $value`"
> 
> Instead of just replacing '--output json' with '--output=json' take into
> account that upstream also changed the usage example to show --format
> instead of --output. Both options do exactly the same, but following the
> usage example seems to be more future-proof.
> 
> Upstream also improved the json output. Now when a file is passed as
> parameter, the json has the file name as the main key, instead of the
> string "file". Adjust the test cases accordingly.
> 
> Fixes:
> tests.core.test_hardening.TestFortifyConserv
> tests.core.test_hardening.TestFortifyNone
> tests.core.test_hardening.TestRelro
> tests.core.test_hardening.TestRelroPartial
> tests.core.test_hardening.TestSspNone
> tests.core.test_hardening.TestSspStrong
> 
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> Cc: Matt Weber <matthew.weber@rockwellcollins.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
> These failures were not caught by [1] yet.
> [1] https://gitlab.com/buildroot.org/buildroot/pipelines

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
