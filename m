From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Mar 2016 16:55:25 +0200
Subject: [Buildroot] [PATCH 1/1] buildroot-test: enable toolchains based
 on hostarch
In-Reply-To: <1459302445-1256-1-git-send-email-matt@thewebers.ws>
References: <1459302445-1256-1-git-send-email-matt@thewebers.ws>
Message-ID: <20160330165525.4378cef8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 29 Mar 2016 20:47:25 -0500, Matt Weber wrote:

> +http://autobuild.buildroot.org/toolchains/configs/br-aarch64-glibc.config,x86_64,glibc
> +http://autobuild.buildroot.org/toolchains/configs/br-arc-full-internal.config,x86_64,uclibc

This is not correct. The host arch should be empty, or some magic value
that says "any arch". Ditto for all "internal" toolchain configurations.

Also, I need to think about the deployment: if I deploy the new CSV
file on the server, but the build slaves have not yet updated their
autobuild-run script, what will happen.

I believe it *should* be fine: the old version of the autobuild-run
script will detect the host arch as "x86" so it will only use a subset
of the toolchains, but it will not fail badly or report errors. Then
when the script gets updated, it will properly detect the host arch as
x86_64 for the 64 bits machine, and it will restart using all possible
toolchains.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
