From: Romain Naour <romain.naour@openwide.fr>
Date: Sun, 08 Mar 2015 22:39:54 +0100
Subject: [Buildroot] [PATCH 1/2] openvmtools: add patch to use KVERS
 instead of shell exec.
In-Reply-To: <1424902476-24448-1-git-send-email-kaszak@gmail.com>
References: <1424902476-24448-1-git-send-email-kaszak@gmail.com>
Message-ID: <54FCC1AA.8060804@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Karoly,

Le 25/02/2015 23:14, Karoly Kasza a ?crit :
> Add patch to use $(KVERS) instead of shell exec uname.
> Originally from Debian.
> 
> Signed-off-by: Karoly Kasza <kaszak@gmail.com>
> ---

This patch will be necessary once the kernel module support will be available in
Buildroot.

I have collected several patches which fix some build issues for latest stable
3.2 kernel up to 3.14.
But this requires some invasive fixes that I don't think we want to maintain in
openvmtools package...
At least, openvmtools kernel module build and works fine with 3.2 kernel.

I will do a runtime test with all patches I have and send them to the list.
(probably next weekend)

Best regards,
Romain

>  package/openvmtools/0008-kvers.patch |   75 ++++++++++++++++++++++++++++++++++
>  1 file changed, 75 insertions(+)
>  create mode 100644 package/openvmtools/0008-kvers.patch
> 
> diff --git a/package/openvmtools/0008-kvers.patch b/package/openvmtools/0008-kvers.patch
> new file mode 100644
> index 0000000..f432dbb
> --- /dev/null
> +++ b/package/openvmtools/0008-kvers.patch
> @@ -0,0 +1,75 @@
> +Use KVERS instead of shell exec uname.
> +
> +Patch from Debian.
> +
> +Original author: Cyril Brulebois <cyril.brulebois@enst-bretagne.fr>
> +Original description: Replacing uname call with KVERS, overwriting seemed not to work.
> +
> +Signed-off-by: Karoly Kasza <kaszak@gmail.com>
> +
> +--- a/modules/linux/vmblock/Makefile
> ++++ b/modules/linux/vmblock/Makefile
> +@@ -43,7 +43,7 @@ INCLUDE      += -I$(SRCROOT)/shared
> + endif
> + 
> + 
> +-VM_UNAME = $(shell uname -r)
> ++VM_UNAME = $(KVERS)
> + 
> + # Header directory for the running kernel
> + ifdef LINUXINCLUDE
> +--- a/modules/linux/vmci/Makefile
> ++++ b/modules/linux/vmci/Makefile
> +@@ -43,7 +43,7 @@ INCLUDE      += -I$(SRCROOT)/shared
> + endif
> + 
> + 
> +-VM_UNAME = $(shell uname -r)
> ++VM_UNAME = $(KVERS)
> + 
> + # Header directory for the running kernel
> + ifdef LINUXINCLUDE
> +--- a/modules/linux/vmhgfs/Makefile
> ++++ b/modules/linux/vmhgfs/Makefile
> +@@ -43,7 +43,7 @@ INCLUDE      += -I$(SRCROOT)/shared
> + endif
> + 
> + 
> +-VM_UNAME = $(shell uname -r)
> ++VM_UNAME = $(KVERS)
> + 
> + # Header directory for the running kernel
> + ifdef LINUXINCLUDE
> +--- a/modules/linux/vmsync/Makefile
> ++++ b/modules/linux/vmsync/Makefile
> +@@ -43,7 +43,7 @@ INCLUDE      += -I$(SRCROOT)/shared
> + endif
> + 
> + 
> +-VM_UNAME = $(shell uname -r)
> ++VM_UNAME = $(KVERS)
> + 
> + # Header directory for the running kernel
> + ifdef LINUXINCLUDE
> +--- a/modules/linux/vmxnet/Makefile
> ++++ b/modules/linux/vmxnet/Makefile
> +@@ -43,7 +43,7 @@ INCLUDE      += -I$(SRCROOT)/shared
> + endif
> + 
> + 
> +-VM_UNAME = $(shell uname -r)
> ++VM_UNAME = $(KVERS)
> + 
> + # Header directory for the running kernel
> + ifdef LINUXINCLUDE
> +--- a/modules/linux/vsock/Makefile
> ++++ b/modules/linux/vsock/Makefile
> +@@ -43,7 +43,7 @@ INCLUDE      += -I$(SRCROOT)/shared
> + endif
> + 
> + 
> +-VM_UNAME = $(shell uname -r)
> ++VM_UNAME = $(KVERS)
> + 
> + # Header directory for the running kernel
> + ifdef LINUXINCLUDE
> 
