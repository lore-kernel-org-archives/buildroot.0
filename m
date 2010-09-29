From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Sep 2010 09:03:19 +0200
Subject: [Buildroot] [PATCH 4/7] bison: add host rules
In-Reply-To: <1284832789-22631-5-git-send-email-llandwerlin@gmail.com>
References: <1284832789-22631-1-git-send-email-llandwerlin@gmail.com>
	<1284832789-22631-5-git-send-email-llandwerlin@gmail.com>
Message-ID: <20100929090319.70706501@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 18 Sep 2010 19:59:46 +0200
llandwerlin at gmail.com wrote:

> +$(eval $(call AUTOTARGETS,package,bison,host))

Bison is part of our set of mandatory dependencies on the host, as
checked in toolchain/dependencies/dependencies.sh. Therefore,
host-bison shouldn't be needed.

However, flex is also part of the mandatory dependencies on the host,
but we still have a couple of package that depend on host-flex.
Interesting.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
