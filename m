From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Nov 2015 12:18:38 +0100
Subject: [Buildroot] defconfig build failure on cubieboard2_defconfig
In-Reply-To: <20151125092209.6e1bb1ff@free-electrons.com>
References: <20151125092209.6e1bb1ff@free-electrons.com>
Message-ID: <20151129121838.1ae8011d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

On Wed, 25 Nov 2015 09:22:09 +0100, Thomas Petazzoni wrote:

> The Travis build of all defconfigs failed last night, on the
> cubieboard2_defconfig:
> 
>    https://travis-ci.org/buildroot/buildroot-defconfig-testing/jobs/93053316
> 
> The error is:
> 
> /home/travis/build/buildroot/buildroot-defconfig-testing/buildroot/output/build/uboot-b4bca5e0651b460a4511582f07a935cb48f74948/spl/lib/vsprintf.o:
> file not recognized: File truncated

FWIW, two days later the problem did not reproduce, and then again two
days later, the same problem occurred on the same defconfig, while
building U-Boot, but just on a different file.

Bottom line: we have a parallel build issue happening here I believe.
This there is cubieboard2 support in mainline U-Boot it seems, so it
would probably be a good idea to use this instead of this custom
version.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
