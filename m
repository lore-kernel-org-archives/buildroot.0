From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 Nov 2015 16:49:05 +0100
Subject: [Buildroot] [PATCH] protobuf: bump to 2.6.1
In-Reply-To: <1446626241-25745-1-git-send-email-steven@uplinklabs.net>
References: <1446626241-25745-1-git-send-email-steven@uplinklabs.net>
Message-ID: <20151108164905.27d41c84@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Steven Noonan,

On Wed,  4 Nov 2015 00:37:21 -0800, Steven Noonan wrote:
> Signed-off-by: Steven Noonan <steven@uplinklabs.net>
> ---
>  package/protobuf/protobuf.hash | 2 ++
>  package/protobuf/protobuf.mk   | 2 +-
>  2 files changed, 3 insertions(+), 1 deletion(-)
>  create mode 100644 package/protobuf/protobuf.hash

This is breaking the build of python-protobuf:
http://autobuild.buildroot.net/results/16e/16e8c41f3b6627ecee96fcf5ab3b22f1b7513ba4/build-end.log.

The problem is that python-protobuf now has some additional
dependencies, which setuptools tries to download automatically. You
probably haven't seen this on your machine because it automatically
downloads the needed dependencies. It appears on the autobuilders
because https:// downloads fail.

This should be fixed by:

 1/ Ensuring that setuptools does not download dependencies
    automatically

 2/ Packaging the appropriate python-protobuf dependencies.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
