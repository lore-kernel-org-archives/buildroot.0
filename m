From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 30 Aug 2015 22:05:26 +0200
Subject: [Buildroot] [PATCH] package/dropbear: add warning about
	volatile keys
In-Reply-To: <1440539013-23389-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Tue, 25 Aug 2015 23:43:33 +0200")
References: <1440539013-23389-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <87si70tud5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > When the rootfs is read-only, keys will be generated in a volatile
 > location, which is inherently bad as host keys will change on each boot,
 > rendering virtually useless.

+them

 > Add a warning so the user is at least aware of the issue.

 > Consign the rm output to oblivion, to avoid noisy output, now that we
 > have a proper warning.

Is consign a English word? I changed it to 'hide' as I think that is clearer.

 > Move the starting message after the symlink-block, to avoid messages
 > collision. Move the umask as well, sicne /etc/dropbear/ may be world
 > readable; just the private host keys should be ?00 (and dropbear handles
 > that by itself).

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Peter Korsgaard <jacmet@uclibc.org>

Committed, thanks.

-- 
Bye, Peter Korsgaard
