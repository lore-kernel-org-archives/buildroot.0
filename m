From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 10 Mar 2013 14:58:51 +0100
Subject: [Buildroot] [PATCH 2/6] fs/ext2: add ability to build ext3/4 too
In-Reply-To: <b55a35d2b1dc1f5bb2598cc8bb29f787407250bc.1362693453.git.yann.morin.1998@free.fr>
References: <cover.1362693453.git.yann.morin.1998@free.fr>
 <b55a35d2b1dc1f5bb2598cc8bb29f787407250bc.1362693453.git.yann.morin.1998@free.fr>
Message-ID: <20130310145851.4f1f6539@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Thu,  7 Mar 2013 23:04:39 +0100, Yann E. MORIN wrote:

> +    # e2fsck will force a UUID, which we do not want
> +    tune2fs -U clear "${IMG}"

I think you already explained that you're removing the UUID to make the
filesystem creation reproducible (i.e avoid having random bits in the
filesystem image). Even though I'm not it's entirely feasible (some
binaries inside the filesystem may contain build dates and things like
that), I think it's an interesting goal. So my only suggestion here
would be to extend a bit your comment, to explain *why* you do not want
this UUID.

Maybe we could set the volume name to 'buildroot' ? I.e:

	tune2fs -L buildroot "${IMG}"

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
