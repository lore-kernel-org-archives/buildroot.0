From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 24 Jul 2019 00:13:59 +0200
Subject: [Buildroot] [PATCH 1/1] utils/test-pkg: add option to enable
 NLS support
In-Reply-To: <20190723172336.24010-1-vadim4j@gmail.com>
References: <20190723172336.24010-1-vadim4j@gmail.com>
Message-ID: <20190724001359.0a290cf1@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Vadim,

On Tue, 23 Jul 2019 20:23:36 +0300
Vadim Kochan <vadim4j@gmail.com> wrote:

> Sometimes the package or specific configuration should be build with and
> without NLS support which requires additionally append NLS related
> config options or to have separate config file or use additional shell
> script.
> 
> So add helper command line option which appends config file with NLS
> options to the final config file which is now always stored in temporary
> file before merge it with the default configuration (even only -c was
> specified).
> 
> Signed-off-by: Vadim Kochan <vadim4j@gmail.com>

Thanks for the patch. It seems like a good idea to test NLS-enabled
configurations in test-pkg indeed. However, I'm not sure it's a good
idea to make it conditional/optional. The idea of test-pkg is that
people run test-pkg, and it tells them if their new package seems to be
OK or not. Most people will not know which knobs/options to pass to
test-pkg to test all possible situations.

So I think we should instead ensure that test-pkg by default tests the
different combinations that we think are useful to test.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
