From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Jun 2015 09:38:16 +0200
Subject: [Buildroot] [PATCH] directfb: add an option for debugging
 support
In-Reply-To: <1434398565-3061-1-git-send-email-cedric.marie@openmailbox.org>
References: <1434398565-3061-1-git-send-email-cedric.marie@openmailbox.org>
Message-ID: <20150621093816.3e3d85ad@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear C?dric Marie,

On Mon, 15 Jun 2015 22:02:45 +0200, C?dric Marie wrote:
> DirectFB provides two options for debug:
> * --enable-debug-support (default is yes)
> * --enable-debug (default is no)
> The first one provides the functions to print debug information. These
> functions can be called inside DirectFB, or by an external DirectFB
> driver in another package.
> The second one enables verbose mode in DirectFB, using these functions.
> 
> Buildroot currently provides an option for the second one only. The
> first one - which is necessary for the second one - is always enabled,
> because this is the default value.
> 
> The new option (BR2_PACKAGE_DIRECTFB_DEBUG_SUPPORT) makes it possible
> to disable debugging support (--disable-debug-support) in order to
> build the library with no debug feature at all.
> 
> When debugging support is disabled, the target installation path of
> drivers (/usr/lib/directfb-<version>) is suffixed with -pure. The
> public library (/usr/lib/libdirectfb.so) remains unchanged.
> 
> Some external DirectFB drivers will install into
> /usr/lib/directfb-<version>-pure in release mode. For that reason, it
> is important that DirectFB can be configured to use this directory.
> 
> Signed-off-by: C?dric Marie <cedric.marie@openmailbox.org>
> ---
>  package/directfb/Config.in   | 14 ++++++++++++++
>  package/directfb/directfb.mk |  5 +++++
>  2 files changed, 19 insertions(+)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
