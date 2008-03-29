From: Hamish Moffatt <hamish@cloud.net.au>
Date: Sun, 30 Mar 2008 01:00:04 +1100
Subject: [Buildroot] initramfs doesn't need root to create an image
In-Reply-To: <1206773941.3224.126.camel@nigel-x60>
References: <1206773941.3224.126.camel@nigel-x60>
Message-ID: <20080329140004.GA25949@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Mar 29, 2008 at 06:59:01AM +0000, Nigel Kukard wrote:
> Attached a patch which removes the requirement on fakeroot & makedevs
> and prevents files from being created in /dev instead of devices when
> one builds buildroot as a non-priv user.

Why? Was there a problem with fakeroot?

The ext2 and jffs2 targets both use fakeroot, although the generator
tools can do privilege squashing and handle device tables themselves.
Next week I need to add ubifs support, and currently the generator tool
does not have device table support fwiw.

Thanks,
Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
