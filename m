From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 26 Jan 2017 21:00:02 +1300
Subject: [Buildroot] [PATCH 1/1] ucl: Use -std=iso9899:1990 instead of
 -std=c90
In-Reply-To: <5e956d07-4799-a49b-f813-e92318e1f872@att.net>
References: <20170125192020.27140-1-stilor@att.net>
 <20170126110122.1f420135@free-electrons.com>
 <5e956d07-4799-a49b-f813-e92318e1f872@att.net>
Message-ID: <20170126210002.3b5860ae@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 25 Jan 2017 15:56:06 -0800, Alexey Neyman wrote:

> Issue observed on a CentOS6.x build machine, which has GCC 4.4. The 
> --std=c90 appeared in 4.5.

OK. I was surprised because my autobuilder instance also uses GCC 4.4
as the host compiler, and the build failure was never detected.

But host-ucl is only used as a dependency of host-upx, which itself is
also only used as a dependency of syslinux. Since syslinux is a
bootloader, it does not get build tested by the autobuilders.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
