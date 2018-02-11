From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 11 Feb 2018 22:30:53 +0100
Subject: [Buildroot] [PATCH 0/6] use RUSTC_{HOST,TARGET}_NAME
In-Reply-To: <20180211165824.20213-1-eric.le.bihan.dev@free.fr>
References: <20180211165824.20213-1-eric.le.bihan.dev@free.fr>
Message-ID: <20180211223053.4ce19e9b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 11 Feb 2018 17:58:18 +0100, Eric Le Bihan wrote:

> Eric Le Bihan (6):
>   rustc: use RUSTC_{HOST,TARGET}_NAME
>   rust-bin: use RUSTC_{HOST,TARGET}_NAME
>   cargo-bin: use RUSTC_{HOST,TARGET}_NAME
>   rust: use RUSTC_{HOST,TARGET}_NAME
>   cargo: use RUSTC_{HOST,TARGET}_NAME
>   docs/manual: use RUSTC_{HOST,TARGET}_NAME in cargo howto

Thanks for working on this. However, all those patches should be
squashed into one, otherwise the series is not bisectable. Indeed, if
only PATCH 1/6 is applied, everything is broken, because packages
continue to use RUST_{HOST,TARGET}_NAME.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
