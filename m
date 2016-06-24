From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 24 Jun 2016 17:58:01 +0200
Subject: [Buildroot] [PATCH] package/rrdtool: add support for perl
 bindings
In-Reply-To: <1466665963-5543-1-git-send-email-yann.morin@orange.com>
References: <1466665963-5543-1-git-send-email-yann.morin@orange.com>
Message-ID: <20160624175801.569ad7c9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 23 Jun 2016 09:12:43 +0200, Yann E. MORIN wrote:

> +ifeq ($(BR2_PACKAGE_PERL),y)
> +RRDTOOL_DEPENDENCIES += host-perl

It is somewhat weird, one would expect to see a dependency on "perl"
here, not "host-perl".

However, maybe you simply need host-perl at *build* time to build the
bindings, and the target perl is only needed at *runtime*. If that's
the case, then a comment above this dependency would be good to have.

If you confirm my understanding, I can also just add the comment when
applying.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
