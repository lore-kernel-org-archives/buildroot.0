From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 14 Apr 2010 09:45:50 +0200
Subject: [Buildroot] [PATCH 14/41] directfb: added support for lirc
In-Reply-To: <1271199974-30434-15-git-send-email-llandwerlin@gmail.com>
	(llandwerlin@gmail.com's message of "Wed, 14 Apr 2010 01:05:47 +0200")
References: <1271199974-30434-1-git-send-email-llandwerlin@gmail.com>
	<1271199974-30434-15-git-send-email-llandwerlin@gmail.com>
Message-ID: <878w8qiij5.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "llandwerlin" == llandwerlin  <llandwerlin@gmail.com> writes:

 llandwerlin> From: Lionel Landwerlin <llandwerlin@gmail.com>
 llandwerlin> Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
 llandwerlin> ---
 llandwerlin>  package/directfb/Config.in   |    5 +++++
 llandwerlin>  package/directfb/directfb.mk |    4 ++++
 llandwerlin>  2 files changed, 9 insertions(+), 0 deletions(-)

 llandwerlin> diff --git a/package/directfb/Config.in b/package/directfb/Config.in
 llandwerlin> index 7c41cdf..6c78597 100644
 llandwerlin> --- a/package/directfb/Config.in
 llandwerlin> +++ b/package/directfb/Config.in
 llandwerlin> @@ -65,6 +65,11 @@ config BR2_PACKAGE_DIRECTFB_KEYBOARD
 llandwerlin>  	bool "compile keyboard input driver"
 llandwerlin>  	default y
 
 llandwerlin> +config BR2_PACKAGE_DIRECTFB_LIRC
 llandwerlin> +	bool "compile lirc input driver"
 llandwerlin> +	select BR2_PACKAGE_LIRC
 llandwerlin> +	default n

N is default, so you don't need to explicitly list it.

-- 
Bye, Peter Korsgaard
