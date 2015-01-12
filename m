From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Jan 2015 22:18:27 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/nodejs: fix hard float error
In-Reply-To: <1421095921-2816-1-git-send-email-jkrause@posteo.de>
References: <1421095921-2816-1-git-send-email-jkrause@posteo.de>
Message-ID: <20150112221827.7ed3765d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?rg Krause,

On Mon, 12 Jan 2015 21:52:01 +0100, J?rg Krause wrote:

> +# V8 needs to know what floating point ABI the target is using.
> +NODEJS_ARM_FP = $(BR2_GCC_TARGET_FLOAT_ABI)

Since this variable is a string, I've added a $(call qstrip,...), for
good measure. And then applied your patch, thanks!

Since you're looking at nodejs, can you have a look at the thread
http://lists.busybox.net/pipermail/buildroot/2014-November/112880.html
(which contains one patch), and send an updated patch series to make
the necessary modifications? They looked good in principle, but not
nicely separated in multiple patches.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
