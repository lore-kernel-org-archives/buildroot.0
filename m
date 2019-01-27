From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 27 Jan 2019 20:52:14 +0100
Subject: [Buildroot] [PATCH 1/8] package/s6-networking: fix dependency
 when libressl is enabled
In-Reply-To: <20190127185943.1136-2-ricardo.martincoski@gmail.com>
References: <20190127185943.1136-1-ricardo.martincoski@gmail.com>
 <20190127185943.1136-2-ricardo.martincoski@gmail.com>
Message-ID: <20190127205214.274ecc14@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Ricardo,

On Sun, 27 Jan 2019 16:59:36 -0200
Ricardo Martincoski <ricardo.martincoski@gmail.com> wrote:

> Commit "c5b85231fb s6-networking: enable SSL if libressl is selected"
> actually dropped the dependency on s6-dns and s6 when libressl is
> enabled.
> Fix this by using += inside the conditional code.
> 
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> ---
> NOTE: I don't know why the autobuilders didn't caught this.

Because libressl is selected as part of a choice..endchoice, and such
choices are not randomized by "randpackageconfig". Therefore, only
OpenSSL is tested by the autobuilders, and LibreSSL is never tested.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
