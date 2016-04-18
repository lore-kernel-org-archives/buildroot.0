From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Apr 2016 21:42:06 +0200
Subject: [Buildroot] [PATCH v3] ltp-testsuite: build kernel modules when
 appropriate
In-Reply-To: <57039CF4.5060902@free.fr>
References: <56F3F393.6020407@free.fr>
 <20160324222555.21f04320@free-electrons.com>
 <56F92840.9090206@free.fr> <56FAD38B.8040201@mind.be>
 <57026754.50205@free.fr> <57038409.20600@mind.be>
 <57039CF4.5060902@free.fr>
Message-ID: <20160418214206.3698cd79@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 5 Apr 2016 13:09:40 +0200, Mason wrote:

> +ifeq ($(BR2_LINUX_KERNEL),y)
> +LTP_TESTSUITE_DEPENDENCIES += linux
> +LTP_TESTSUITE_MAKE_ENV = $(LINUX_MAKE_FLAGS)

This should use += instead of = since we're in a conditional block.
While this is not needed right now, it is a bit more logical and future
proof.

Applied with this fixed!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
