From: Alex Suykov <alex.suykov@gmail.com>
Date: Tue, 7 Nov 2017 13:19:38 +0200
Subject: [Buildroot] [PATCH v2] vboot-utils: fix ARCH detection
In-Reply-To: <20171107114037.3ac35009@windsurf>
References: <20171107101715.GA26991@latitude.localdomain>
 <20171107114037.3ac35009@windsurf>
Message-ID: <20171107111938.GA445@latitude.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Tue, Nov 07, 2017 at 11:40:37AM +0100, Thomas Petazzoni wrote:

> Thanks for this new version. However, you still didn't reply to me
> about what happens when HOST_ARCH != ARCH. The vboot-utils Makefile
> seems to have some logic to use Qemu in that case. Do you understand
> what it does exactly with Qemu, and that we won't have a problem by
> having HOST_ARCH != ARCH ?

Qemu is only used to run cross-compiled tests. Buildroot package
neither builds nor runs tests, so it doesn't really matter whether
qemu gets configured there or not.
