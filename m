From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 15 Aug 2013 07:41:12 -0300
Subject: [Buildroot] [PATCH] libsecret: New package
In-Reply-To: <1376562685-17191-1-git-send-email-markos.chandras@imgtec.com>
References: <1376562685-17191-1-git-send-email-markos.chandras@imgtec.com>
Message-ID: <520CB048.6060707@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/15/2013 07:31 AM, Markos Chandras wrote:

> +config BR2_PACKAGE_LIBSECRET
> +	bool "libsecret"
> +	select BR2_PACKAGE_LIBGLIB2
> +	help
> +	  libsecret is a library for storing and retrieving passwords and other
> +	  secrets. It communicates with the "Secret Service" using DBus.
> +	  gnome-keyring and ksecretservice are both implementations of a Secret
> +	  Service.
> +
> +	  https://wiki.gnome.org/Libsecret

You forgot to inherit LIBGLIB2 depends (WCHAR, THREADS) and add a
comment on why it's unavailable when both aren't available.
Other than that it looks good in principle (untested).
Regards.
