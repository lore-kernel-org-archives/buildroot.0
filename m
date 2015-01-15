From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 15 Jan 2015 13:26:32 -0300
Subject: [Buildroot] [PATCH v3] Allow a single DHCP configuration via
 the system configuration submenu
In-Reply-To: <CABbD_XCR9JPtU3FV2tb-D17G0J+i_buXdt=5=cU3XPsdAkzVcg@mail.gmail.com>
References: <1420709805-13040-1-git-send-email-jeremy.rosen@openwide.fr>
 <CABbD_XCR9JPtU3FV2tb-D17G0J+i_buXdt=5=cU3XPsdAkzVcg@mail.gmail.com>
Message-ID: <54B7EA38.8010006@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/09/2015 07:28 AM, K?roly Kasza wrote:

Hi J?r?my, K?roly, the rest.

> Tested-by: Karoly Kasza <kaszak at gmail.com <mailto:kaszak@gmail.com>>
> Reviewed-by: Karoly Kasza <kaszak at gmail.com <mailto:kaszak@gmail.com>>
> 
> Tested with uClibc, successfully built different rootfs.ext images and
> booted them.
> Tested with master branch, x86_64 arch in QEMU, internal toolchain GCC
> 4.9.2 w/ uclibc, Linux 3.18.1.
> 
> I recommend maybe adding a dependency in Config.in later for package
> ifupdown (not yet merged, proposed by Gustavo), if no Busybox is present
> in the system.

I wouldn't go as far as selecting ifupdown, but possibly depending on
BR2_PACKAGE_BUSYBOX | BR2_PACKAGE_IFUPDOWN because the option will
always be "set" (it's a string) and you can't do that easily.
That way the option will vanish if there's no proper provider of
ifupdown which is the interpreter of /etc/network/interfaces.
Of course busybox may lack ifupdown for custom configs, but that's the
case for so many things (a shell, for example) that we can't cover weird
scenarios in a sane way, and it might just be intended.
Other than that:

Tested-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

(qemu-arm-versatile-defconfig default busybox init and systemd).
Regards.
