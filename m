From: Michael S. Zick <minimod@morethan.org>
Date: Tue, 6 Dec 2011 12:16:44 -0600
Subject: [Buildroot] buildroot with SquashFS root file system
In-Reply-To: <4EDE57E6.4040007@neotion.com>
References: <4EDE32C3.7020400@neotion.com>
 <201112060956.07523.minimod@morethan.org> <4EDE57E6.4040007@neotion.com>
Message-ID: <201112061216.46659.minimod@morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue December 6 2011, Emmanuel BOUAZIZ wrote:
> 
> On 12/06/2011 04:56 PM, Michael S. Zick wrote:
> > SquashFS is a read-only file system.
> > 
> > So which of the "device support" options did you choose?
> > You'll need one that puts devices in something writable, like tmpfs.
> > 
> Hi Michael,
> thank you for your answer.
> 
> I'm not sure what you mean by "device support" options.
>

That is what I meant.  Just didn't have the right name in mind.

> I enabled mdev and in the kernel's generic driver options,
> I checked "Maintain a devtmpfs filesystem to mount at /dev" 
> and "Automount devtmpfs at /dev after the kernel mounted the rootfs"
>

My next guess -

Was the kernel built by Buildroot or did you build it otherwise?
If the kernel wasn't built by Buildroot, it may not have the
required options set for tmpfs, devtmpfs, automount devtmpfs.

If built outside of Buildroot, what version kernel?

The usual thing for troubleshooting an initramFS system is:
rdinit=/bin/sh
(or whatever path/name you shell program is)

You could try that, but I expect if it can't open /dev/null
it will not be able to open /dev/console either.  ;-)

Mike
> regards,
> 
