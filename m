From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 10 Dec 2016 15:38:17 +0100
Subject: [Buildroot] [PATCH 1/3] python-protobuf: Allow host building
In-Reply-To: <20161209011313.9549-2-wak@google.com>
References: <20161209011313.9549-1-wak@google.com>
 <20161209011313.9549-2-wak@google.com>
Message-ID: <20161210153817.485b25d3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  8 Dec 2016 17:13:11 -0800, William A. Kennington III wrote:
> Currently python-protobuf does not allow the building as a host package
> during a cross compile. We would like to be able to build nanopb as a
> host package but can't without host-python-protobuf.

This patch looks good, but also doesn't apply:

thomas at skate:~/projets/buildroot (master)$ git pwam 704278
Applying patch #704278 using 'git am -s -3'
Description: [1/3] python-protobuf: Allow host building
Applying: python-protobuf: Allow host building
fatal: sha1 information is lacking or useless (package/python-protobuf/python-protobuf.mk).
error: could not build fake ancestor
Patch failed at 0001 python-protobuf: Allow host building
The copy of the patch that failed is found in: .git/rebase-apply/patch
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.

> Google-Bug-Id: 33072942
> Change-Id: Id09f461bda3f9c7a0bd6b5c36a6a8fa92e4adb27

Please remove those two lines.

> Signed-off-by: William A. Kennington III <wak@google.com>
> ---
>   package/python-protobuf/python-protobuf.mk | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/package/python-protobuf/python-protobuf.mk  
> b/package/python-protobuf/python-protobuf.mk
> index d8be76d..d46bda2 100644
> --- a/package/python-protobuf/python-protobuf.mk
> +++ b/package/python-protobuf/python-protobuf.mk
> @@ -13,4 +13,5 @@ PYTHON_PROTOBUF_DEPENDENCIES = host-protobuf
>   PYTHON_PROTOBUF_SETUP_TYPE = setuptools
>   PYTHON_PROTOBUF_SUBDIR = python
> 
> +$(eval $(host-python-package))
>   $(eval $(python-package))

The way the added line is indented compared to the context lines make
it look weird. It's probably why it doesn't apply.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
