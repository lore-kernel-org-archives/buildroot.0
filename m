From: Joachim Wiberg <troglobit@gmail.com>
Date: Sun, 24 Jan 2021 16:36:55 +0100
Subject: [Buildroot] [PATCH 1/1] package/ssdp-responder: new package
In-Reply-To: <20210124095108.GL926565@scaer>
References: <20210123231559.3036505-1-troglobit@gmail.com>
 <20210124095108.GL926565@scaer>
Message-ID: <87sg6quz1k.fsf@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Jan 24, 2021 at 10:51, "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> On 2021-01-24 00:15 +0100, Joachim Wiberg spake thusly:
>> Small (35k), and stand-alone, SSDP responder with built-in web server
>> (on port 1901) for serving description.xml when Windows scans for any
>> network devices on the LAN.  Also includes ssdp-scan (31k), similar to
>> the mdns-scan tool, to probe for SSDP capable devices.
> This package uses pkg-config, so it should have:
>
>     SSDP_RESPONDER_DEPENDENCIES = host-pkgconf

Noted!

> It also has an optional dependency on systemd, so maybe it needs:
>     ifeq ($(BR2_PACKAGE_SYSTEMD),y)
>     SSDP_RESPONDER_DEPENDENCIES += systemd
>     SSDP_RESPONDER_CONF_OPTS += --with-systemd
>     else
>     SSDP_RESPONDER_CONF_OPTS += --without-systemd
>     endif

Thanks, I'll give it a whirl.

> And since it comes with its systemd service unit, it would be nice to
> install it with SSDP_RESPONDER_INSTALL_INIT_SYSTEMD.

OK

> [--SNIP--]
>     $ make check-package

(This will be my new friend)

>     package/ssdp-responder/Config.in:2: should be indented with one tab (http://nightly.buildroot.org/#_config_files)
>     package/ssdp-responder/Config.in:3: should be indented with one tab (http://nightly.buildroot.org/#_config_files)
>     package/ssdp-responder/Config.in:4: should be indented with one tab (http://nightly.buildroot.org/#_config_files)
>     package/ssdp-responder/Config.in:5: help text: <tab><2 spaces><62 chars> (http://nightly.buildroot.org/#writing-rules-config-in)
>     package/ssdp-responder/Config.in:6: help text: <tab><2 spaces><62 chars> (http://nightly.buildroot.org/#writing-rules-config-in)
>     package/ssdp-responder/Config.in:7: help text: <tab><2 spaces><62 chars> (http://nightly.buildroot.org/#writing-rules-config-in)
>     package/ssdp-responder/Config.in:8: help text: <tab><2 spaces><62 chars> (http://nightly.buildroot.org/#writing-rules-config-in)
> Care to fixup and respin, please?

Yup, I'll post a v2 later tonight!

Cheers
 /Joachim
 
