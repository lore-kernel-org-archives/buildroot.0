From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Tue, 10 Apr 2007 14:08:50 +0200
Subject: [Buildroot] [patch] sysroot support in toolchain,
	use correct pathes in staging_dir
In-Reply-To: <461B73CD.7040009@cs.helsinki.fi>
References: <20070410103901.GC15274@aon.at> <461B73CD.7040009@cs.helsinki.fi>
Message-ID: <20070410120850.GB16257@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Apr 10, 2007 at 02:23:57PM +0300, Heikki Lindholm wrote:
>Bernhard Fischer kirjoitti:
>>Hi,
>>
>>This is a heads-up that i mean to correct the pathes to includes and
>>libs in the staging dir as suggested in bug 
>>http://busybox.net/bugs/view.php?id=1290
>>Doing so is ment to ease moving the staging-dir (and it's
>>cross-compiler) to a different machine for re-use.
>
>What was the original purpose of putting all headers under /include anyway?

I don't know. Could be that the intention was to keep the cross-compiler
dir hierarchy as flat as possible. The fact that usr/lib is symlinked to
lib would also hint at that, so initially there was, perhaps, only
packages being installed into /

We would have to ask eric, but i don't see any benefit at all for this
layout of the staging dir.

Folks that want to do away with /usr on their targets can easily symlink
/usr/* down to ../ if they feel like, but that proposed patch doesn't
touch the target layout much (IIRC).
