From: Alexander Lukichev <alexander.lukichev@gmail.com>
Date: Tue, 19 Mar 2013 07:42:20 +0200
Subject: [Buildroot] [PATCH] zeromq: add C++ bindings
In-Reply-To: <1363618617-2969-1-git-send-email-spdawson@gmail.com>
References: <1363618617-2969-1-git-send-email-spdawson@gmail.com>
Message-ID: <CAAHaz6E+7jgzJVcS4YXMEF=05yVsY5d-o=dxS0NFD5UOhptjUg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi, Simon!

2013/3/18 <spdawson@gmail.com>
> diff --git a/package/zeromq/Config.in b/package/zeromq/Config.in
> index b7dc8a6..db2384e 100644
> --- a/package/zeromq/Config.in
> +++ b/package/zeromq/Config.in
> @@ -1,9 +1,8 @@
> -comment "zeromq requires a toolchain with C++, LARGEFILE + WCHAR support"
> -       depends on !(BR2_INSTALL_LIBSTDCPP &&  BR2_LARGEFILE &&
BR2_USE_WCHAR)
> +comment "zeromq requires a toolchain with LARGEFILE and WCHAR support"
> +       depends on !(BR2_LARGEFILE && BR2_USE_WCHAR)

Doesn't zeromq 3.2.x also require BR2_INET_IPV6, like you posted earlier?

--
Best regards,
  Alexander Lukichev
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130319/d3ff5716/attachment.html>
