From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 Jul 2016 00:26:59 +0200
Subject: [Buildroot] [PATCH 2/6] qemu: make qemu and host-qemu packages'
 version (separately) configurable
In-Reply-To: <1462348079-7631-2-git-send-email-simonn.maes@gmail.com>
References: <1462348079-7631-1-git-send-email-simonn.maes@gmail.com>
 <1462348079-7631-2-git-send-email-simonn.maes@gmail.com>
Message-ID: <20160704002659.6956c2b6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Simon,

On Wed,  4 May 2016 09:47:55 +0200, Simon Maes wrote:

> +config BR2_PACKAGE_QEMU_VERSION
> +	string "qemu version"
> +	default "2.5.0"

Making the version selectable will break badly with the hash file: it
will only work if you use a version for which a hash is listed in the
hash file.

For now, we'd prefer to stick to a single supported version, and see if
we really have situations where using an older version is mandatory.

Therefore, I've marked this patch as Rejected in our patch tracking
system.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
