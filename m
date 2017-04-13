From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 13 Apr 2017 23:05:57 +0200
Subject: [Buildroot] [PATCHv2] mpir: new package
In-Reply-To: <1492115521-3293-1-git-send-email-semenak94@mail.ru>
References: <mpir: new package>
 <1492115521-3293-1-git-send-email-semenak94@mail.ru>
Message-ID: <20170413230557.16ed46fb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 13 Apr 2017 23:32:01 +0300, Semyon Kolganov wrote:

> +	  MPIR is a highly optimised library for bignum arithmetic forked 

This line had a trailing slash, and was too long, so I rewrapped the
Config.in help text.

> +MPIR_DEPENDENCIES = gmp

A dependency on host-yasm was missing, so I've added it here.
Otherwise, the build fails if yasm is not installed on your system.

> +MPIR_MAKE_OPTS = RANLIB=$(TARGET_RANLIB)

Everything build successfully without this line for me, so I dropped
it. Let me know which problem it solved for you.

I've applied after fixing the above issues.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
