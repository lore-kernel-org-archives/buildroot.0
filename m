From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 11 Feb 2015 21:14:20 +0100
Subject: [Buildroot] [PATCH] pkg-cmake: reduce output when being silent
In-Reply-To: <1423677141-10912-1-git-send-email-fabio.porcedda@gmail.com>
References: <1423677141-10912-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <20150211211420.57208953@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Fabio Porcedda,

On Wed, 11 Feb 2015 18:52:21 +0100, Fabio Porcedda wrote:

> +ifdef QUIET
> +CMAKE_QUIET = -DCMAKE_RULE_MESSAGES=OFF -DCMAKE_INSTALL_MESSAGE=NEVER
> +else
> +CMAKE_QUIET =
> +endif

Use:

ifneq ($(QUIET),)
CMAKE_QUIET = -DCMAKE_RULE_MESSAGES=OFF -DCMAKE_INSTALL_MESSAGE=NEVER
endif

We generally don't use ifdef to test the value of a variable in
Buildroot.

The else part is unnecessary.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
