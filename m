From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Mon, 26 Jun 2017 00:34:42 -0300
Subject: [Buildroot] [PATCH 1/5] support/check-package: don't check
 filenames of hashes
References: <eafeec501266452fc7973871c7853bf6d016dfce.1498428166.git.yann.morin.1998@free.fr>
Message-ID: <595080d26a59c_8bc1c339488471@ultri3.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, Jun 25, 2017 at 07:03 PM, Yann E. MORIN wrote:

> Currently, we check that the filenames in hash lists do not contain
> a slash '/' character, because all we are checking so far are the
> downloaded archives, and we explicitly need the filename to not contain
> a directory component at all.
> 
> However, we're soon to also check the hashes of the license files in
> packages sources, and those license files may be at any arbitrary
> directory-depth in the packages source tree, and thus two or more

Small nit: the explanation could end at "source tree". The removed code was
testing only for the presence of a slash, so having 2 entries with the same
basename shouldn't matter.

> license files may have the same basename.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Either with the nit fixed or not,
Acked-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>

Regards,
Ricardo
