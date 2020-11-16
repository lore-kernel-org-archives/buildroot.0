From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 16 Nov 2020 21:24:47 +0100
Subject: [Buildroot] [PATCH 1/1] package/dovecot-pigeonhole: fix build
 with per-package directories
In-Reply-To: <20201114221007.262746-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Sat, 14 Nov 2020 23:10:07 +0100")
References: <20201114221007.262746-1-bernd.kuhls@t-online.de>
Message-ID: <87o8jx3v8w.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Fix wrong path in usr/lib/dovecot-config which was copied from the
 > dovecot staging dir.

 > Fixes:
 > http://autobuild.buildroot.net/results/5fb/5fb1cd57bc3fdf4f75019c7b25d65ef887eea539/

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed, thanks.

It is a bit unfortunate that this is in usr/lib and not in usr/bin, so
we cannot use the normal _CONFIG_SCRIPTS logic to fixup paths and remove
from target, but OK.

-- 
Bye, Peter Korsgaard
