From: Hamish Moffatt <hamish@cloud.net.au>
Date: Thu, 9 Oct 2008 11:42:28 +1100
Subject: [Buildroot] Both cramfs + jffs2 in buildroot?
In-Reply-To: <48ECAD04.6070209@timeterminal.se>
References: <48ECAD04.6070209@timeterminal.se>
Message-ID: <20081009004228.GA12878@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Oct 08, 2008 at 02:52:20PM +0200, Daniel Nystr?m wrote:
> (Sorry if this has been a topic earlier, but it's really hard to search
> the mailing archive)
> 
> Is it possible in Buildroot to make both a read-only rootfs and a second
> writable filesystem?
> 
> A common setup is using cramfs for / and mounting a jffs2 on /mnt/flash,
> and then make a symlink of /etc to point at /mnt/flash/etc where all
> config files are writable.
> 
> Is this possible to achive with Buildroot?

No, there's no support for building two file systems with different
contents.

There might be better ways to handle this anyway, like copying /etc from
the cramfs to the rw jffs2 on the first bootup?

With regard to mounting /mnt/flash/etc onto /etc, I don't think a
symlink will work - you need to use/run stuff from /etc before the
second file system can be mounted. I suggest a minimal /etc in the root,
enough to get the other file system mounted, and then "mount --bind" the 
new /etc over the top.


Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
