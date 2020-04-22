From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 22 Apr 2020 10:24:04 +0200
Subject: [Buildroot] [PATCH] package/linux-tools: selftests: add numactl
 dependency for net tests
In-Reply-To: <20200422112336.6cwyac5wim5i43n2@vkochan-ThinkPad-T470p>
References: <20200325164240.22747-1-vadim4j@gmail.com>
 <20200411152649.3830039d@windsurf.home>
 <20200421175140.n5l3vn7rh642widp@vkochan-ThinkPad-T470p>
 <20200421165510.0616fc36@windsurf.home>
 <20200422112336.6cwyac5wim5i43n2@vkochan-ThinkPad-T470p>
Message-ID: <20200422102404.05b99229@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 22 Apr 2020 14:23:36 +0300
Vadim Kochan <vadim4j@gmail.com> wrote:

> My only concern is that user should guess which packages are needed for
> particular test suites (I mean at least per sub-system), or document it
> somewhere ?

This is pretty common in Buildroot that we have automatic optional
dependencies: we enable a feature if the necessary dependencies are
available. Having sub-options for everything would be a nightmare.

In addition, if a user had to build the selftests manually, he would
also have to figure out "aaah, I need numactl to build the network
tests".

In any case, the Buildroot .mk clearly documents the fact that package
ABC is needed to get a given feature in package XYZ.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
