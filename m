From: Alvaro G. M. <alvaro.gamez@hazent.com>
Date: Thu, 19 Jan 2017 11:29:32 +0100
Subject: [Buildroot] Change to size_t makes gperf 3.1 incompatible with code
 written for 3.0.4
Message-ID: <20170119102932.c7xzz6ncm4iypi5p@collins.gmr.ssr.upm.es>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

I'm a user of gperf and I sometimes contribute to buildroot
(https://buildroot.org/), which allows for easy compilation of packages and
bundling them into a root filesystem.

When upgrading gperf to recent release, we've come to notice that gperf
users usually hardcode function prototypes, as (const char *str, unsigned len);

However, latest change from unsigned to size_t, even though perfectly
reasonable, produces a mismatch between function and its prototype, so code
written for gperf 3.0.4 output isn't able to compile using gperf 3.1 output.

I've searched on buildroot's package database and these packages require
modifications to work with gperf 3.1:

eudev, libsvgtiny, systemd, webkitgtk, libcap, qt5webkit, kodi

I was wondering if gperf could possibly include a compatibility option,
enabled by default, so that code generated maintains the old prototype and
only uses size_t when explicitly asked for.

Otherwise, I think this version could have been maybe named 4.0, so as to
make this incompatibility clearer?

Well, thanks for this new release anyway, I'm personally very happy with the
addition of --constants-prefix parameter!

Best regards!

-- 
Alvaro G. M.
