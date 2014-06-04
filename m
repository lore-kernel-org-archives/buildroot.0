From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Wed, 4 Jun 2014 17:45:05 -0300
Subject: [Buildroot] [RFC/PATCH] linux: add external initramfs options
In-Reply-To: <5386131B.6090809@mind.be>
References: <1401138097-11024-1-git-send-email-guido@vanguardiasur.com.ar>
 <5386131B.6090809@mind.be>
Message-ID: <20140604204505.GA19703@arch.cereza>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Arnout,

On 28 May 06:47 PM, Arnout Vandecappelle wrote:
[..]
> > 
> > The path specified can be a cpio archive or a directory, just like
> > the kernel config. The path is specified w.r.t. BRs topdir, and made
> > absolute since the kernel builds in another directory.
> 
>  This patch does nothing more than update the kernel config. Since you can
> already supply a custom kernel config, I don't think there is much added value
> to moving these options to the buildroot config.
> 
>  The only feature you add is that the patch can be relative to the buildroot
> directory. Not enough to be relevant, IMHO, especially since the patch adds
> non-negligible complexity.
> 

Our software stack includes a kernel with an appended initramfs to take care
of software upgrade and find, check and switch to the "real" rootfs. Both
the initramfs and rootfs are Buildroot-based, but each of them with their
own configuration and history (in separate git repos).

Hence we came up with this solution: the initramfs would live in a different
repo, and after it's built we use this new option to append it in the kernel.

Maybe you have a better idea, and there's a cleaner way to accomplish this
with Buildroot?

Thanks for the feedback!
-- 
Ezequiel Garcia, VanguardiaSur
www.vanguardiasur.com.ar
