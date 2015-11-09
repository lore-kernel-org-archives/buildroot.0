From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 9 Nov 2015 22:08:30 +0100
Subject: [Buildroot] [PATCH] package/python-protobuf: eliminate unneeded
 build-time dependencies
In-Reply-To: <1447002489-2373-1-git-send-email-steven@uplinklabs.net>
References: <CAKbGBLgXpMNaSOGgGg5nmLLdub=R44pDMWJNRGbMyErRz7NSoQ@mail.gmail.com>
 <1447002489-2373-1-git-send-email-steven@uplinklabs.net>
Message-ID: <20151109220830.4c64c607@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Steven,

On Sun,  8 Nov 2015 09:08:09 -0800, Steven Noonan wrote:
> This was causing unexpected HTTP requests by the setup.py script for
> python-protobuf. These "dependencies" aren't actually required for a successful
> build, and are not staged into the target install directory.

The reference to the autobuild is missing. It should contain:

Fixes:

	http://autobuild.buildroot.org/results/e44/e44694f30e39266491a1040e284e504d6d37ef9e/

> 
> Signed-off-by: Steven Noonan <steven@uplinklabs.net>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Tested-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

(I have verified that your patch fixes the build problem in the minimal
chroot I use for Buildroot testing in my autobuilder instance)

> +++ b/package/python-protobuf/protobuf-2.6.1-disable-unneeded-build-dependencies.patch

This file name is not correct according to our patch naming policy. It
should be 0001-disable-unneeded-build-dependencies.patch.

Also, can you submit this change upstream ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
