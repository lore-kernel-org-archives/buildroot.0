From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 26 Nov 2014 22:47:27 +0100
Subject: [Buildroot] [PATCH next 1/3] package/liburiparser: New package
In-Reply-To: <1416772613-13447-1-git-send-email-bernd.kuhls@t-online.de>
References: <1416772613-13447-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20141126224727.281b35e3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 23 Nov 2014 20:56:51 +0100, Bernd Kuhls wrote:

> diff --git a/package/Config.in b/package/Config.in
> index 796c9f9..6f32b71 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -829,6 +829,7 @@ menu "Networking"
>  	source "package/libupnpp/Config.in"
>  	source "package/libvncserver/Config.in"
>  	source "package/libwebsockets/Config.in"
> +	source "package/liburiparser/Config.in"

Alphabetic ordering issue.

> +ifneq ($(BR2_USE_WCHAR),y)

We prefer positive logic here: ifeq ($(BR2_USE_WCHAR),)

Committed to next with those issues fixed. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
