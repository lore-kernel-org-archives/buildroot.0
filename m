From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 2 Feb 2015 16:42:04 +0100
Subject: [Buildroot] [PATCH] odhcp6c: new package
In-Reply-To: <20150118165630.GS27361@marmot>
References: <20150118165630.GS27361@marmot>
Message-ID: <CAAXf6LXvzAbhH3S234HH8ptbXcddfTvFcfO2wkxeqrDZrtYgUQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Alexander,

Thanks a lot for your contribution.
I just sent a second version to the list with the fixes mentioned below:

On Sun, Jan 18, 2015 at 5:56 PM, Alexander Clouter
<alex+buildroot@digriz.org.uk> wrote:
> Signed-off-by: Alexander Clouter <alex+buildroot@digriz.org.uk>
> --
>  package/Config.in          |    1 +
>  package/odhcp6c/Config.in  |    7 +++++++
>  package/odhcp6c/odhcp6c.mk |   12 ++++++++++++
>  3 files changed, 20 insertions(+)
>
> diff --git a/package/Config.in b/package/Config.in
> index 266de13..b9805dc 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1123,6 +1123,7 @@ endif
>         source "package/noip/Config.in"
>         source "package/ntp/Config.in"
>         source "package/nuttcp/Config.in"
> +       source "package/odhcp6c/Config.in"
>         source "package/odhcploc/Config.in"
>         source "package/olsr/Config.in"
>         source "package/openntpd/Config.in"
> diff --git a/package/odhcp6c/Config.in b/package/odhcp6c/Config.in
> new file mode 100644
> index 0000000..8155f47
> --- /dev/null
> +++ b/package/odhcp6c/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_ODHCP6C
> +       bool "odhcp6c"
> +       help
> +         odhcp6c is a minimal DHCPv6 and RA-client for use in embedded
> Linux systems

This line should have been wrapped at 80 characters.

> +         especially routers.
> +
> +         https://github.com/sbyx/odhcp6c

Since the package is expecting IPv6 headers in the toolchain, the
Config.in file should express this dependency.
See http://buildroot.uclibc.org/downloads/manual/manual.html#_literal_config_in_literal_file
for details on this topic.


Best regards,
Thomas
