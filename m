From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 27 Jan 2020 10:59:51 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/nodejs: use system-icu for
 host-nodejs when available
In-Reply-To: <20200127005539.125369-1-james.hilliard1@gmail.com>
References: <20200127005539.125369-1-james.hilliard1@gmail.com>
Message-ID: <20200127105951.11716eea@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 26 Jan 2020 17:55:39 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Removed LDFLAGS.host as it doesn't appear to be needed.

LDFLAGS.host is definitely needed, see commit
f4abcbe112a0a45b87545f32981be87212116e94. At least, you must verify
that the issue fixed by this commit no longer exists if you drop
LDFLAGS.host. You must check that the host tools built by nodejs have a
correct RPATH. If they don't, then LDFLAGS.host is still needed.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
