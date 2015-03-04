From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 4 Mar 2015 12:13:02 +0100
Subject: [Buildroot] [PATCH] cmake: use system libzma when the xz
 package is enabled
In-Reply-To: <1425467236-27158-1-git-send-email-fabio.porcedda@gmail.com>
References: <1425467236-27158-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <20150304121302.34acc5c6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Fabio Porcedda,

On Wed,  4 Mar 2015 12:07:16 +0100, Fabio Porcedda wrote:

> +ifeq ($(BR2_PACKAGE_XZ),y)
> + HOST_CMAKE_DEPENDENCIES += host-xz
> + HOST_CMAKE_CONF_OPTS += -DCMAKE_USE_SYSTEM_LIBLZMA=ON
> +endif

This doesn't make any sense. Why would a dependency on host-xz be tied
to the activation of the target xz package ?

You have two choices here:

 * Ask host-cmake to *always* use its internal copy of the xz library,
   and to never look for a host-installed one.

 * Depend on host-xz unconditionally, and ask host-cmake to always use
   this system-provided host-xz.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
