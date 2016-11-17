From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Nov 2016 09:32:39 +0100
Subject: [Buildroot] [PATCH 1/1] python-protobuf: Allow host building
In-Reply-To: <20161117061212.4638-1-wak@google.com>
References: <20161117061212.4638-1-wak@google.com>
Message-ID: <20161117093239.05721e0e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 16 Nov 2016 22:12:12 -0800, William A. Kennington III wrote:
> Currently python-protobuf does not allow the building as a host package
> during a cross compile. We would like to be able to build nanopb as a
> host package but can't without host-python-protobuf.
> 
> Google-Bug-Id: 28000875
> Change-Id: Id09f461bda3f9c7a0bd6b5c36a6a8fa92e4adb27
> Signed-off-by: William A. Kennington III <wak@google.com>

Thanks for this contribution!

However, we don't really like to have "orphan" host packages, i.e host
packages that are not a dependency of anything else in Buildroot.

Do you intend to submit a Buildroot package for nanopb? Even if it's a
host package, it would probably be OK to have it in
package/Config.in.host so that it appears in menuconfig.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
