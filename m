From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 30 Dec 2020 09:42:49 +0100
Subject: [Buildroot] [RFC v1 1/6] package/vulkan-headers: new package
In-Reply-To: <20201223224553.8570-2-ps.report@gmx.net>
References: <20201223224553.8570-1-ps.report@gmx.net>
 <20201223224553.8570-2-ps.report@gmx.net>
Message-ID: <20201230084249.GF1680670@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2020-12-23 23:45 +0100, Peter Seiderer spake thusly:
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
[--SNIP--]
> diff --git a/package/vulkan-headers/vulkan-headers.mk b/package/vulkan-headers/vulkan-headers.mk
> new file mode 100644
> index 0000000000..a20f4d789c
> --- /dev/null
> +++ b/package/vulkan-headers/vulkan-headers.mk
> @@ -0,0 +1,13 @@
> +################################################################################
> +#
> +# vulkan-headers
> +#
> +################################################################################
> +
> +VULKAN_HEADERS_VERSION = 1.2.165

As stated in there READ:E:

    Marked version releases have undergone thorough testing but do not
    imply the same quality level as SDK tags. SDK tags follow the
    sdk-<version>.<patch> format (e.g., sdk-1.1.92.0).

Shouldn't we use SDK tags, rather than mere versions?

(Comment valid for the three Vulkan-related packages in your series).

Regards,
Yann E. MORIN.

> +VULKAN_HEADERS_SITE = $(call github,KhronosGroup,Vulkan-Headers,v$(VULKAN_HEADERS_VERSION))
> +VULKAN_HEADERS_LICENSE = Apache-2.0 License
> +VULKAN_HEADERS_LICENSE_FILES = LICENSE.txt
> +VULKAN_HEADERS_INSTALL_STAGING = YES
> +
> +$(eval $(cmake-package))
> -- 
> 2.29.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
