From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Tue, 15 Nov 2016 08:49:28 +0100
Subject: [Buildroot] [BUG] missing file with an overlay
Message-ID: <CAB0FRsvLBALu3YW27JOgxdG0CG7vmyeD8Tkmxs+3jHSgbMExKw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With an overlay which contains a file var/spool/cron/crontabs/root,
the file is copied in output/target/var/spool/cron/crontabs/root.
But the file is not present in rootfs, because spool (like cache,
lock, log) stay a symbolic link to ../tmp

Fran?ois
