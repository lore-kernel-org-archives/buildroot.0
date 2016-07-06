From: ANDY KENNEDY <ANDY.KENNEDY@adtran.com>
Date: Wed, 6 Jul 2016 17:54:01 +0000
Subject: [Buildroot] Interesting circular dependency, how to solve?
In-Reply-To: <20160706175617.67b0e1ea@free-electrons.com>
References: <20160706175617.67b0e1ea@free-electrons.com>
Message-ID: <F9C551623D2CBB4C9488801D14F864C6EE83C112@ex-mb1.corp.adtran.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> 
>  - When cryptodev-linux is enabled, OpenSSL will depend on it to use
>    crypto accelerators supported in the kernel via cryptodev-linux.

If I understand you correctly, this builds TWO things, right?

If this is the case, make it separate packages to build the
kernel module then the userspace package.

Would that remove the dependency loop?

Andy
