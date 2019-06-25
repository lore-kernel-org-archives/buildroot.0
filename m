From: Vivien Didelot <vivien.didelot@gmail.com>
Date: Tue, 25 Jun 2019 11:14:03 -0400
Subject: [Buildroot] [PATCH] initramfs: drop comment against multiple
 formats
In-Reply-To: <20190623180932.09bb8cfe@windsurf>
References: <20190126001901.3090-1-vivien.didelot@gmail.com>
 <20190623180932.09bb8cfe@windsurf>
Message-ID: <20190625111403.GB8166@t480s.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sun, 23 Jun 2019 18:09:32 +0200, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:
> Hello Vivien,
> 
> On Fri, 25 Jan 2019 19:19:01 -0500
> Vivien Didelot <vivien.didelot@gmail.com> wrote:
> 
> > This patch removes an old comment against having multiple filesystem
> > formats which doesn't bring any value.
> > 
> > It is also wrong per-se: one may want to use Buildroot to prepare a
> > custom distribution containing a kernel+initramfs and a persistent
> > default rootfs to pivot to.
> > 
> > Signed-off-by: Vivien Didelot <vivien.didelot@gmail.com>
> 
> I understand your point, but I think we need to keep a comment. Indeed,
> the use-cases for generating both an initramfs and another rootfs image
> are very specific, and users (especially newcomers!) should still
> understand that when building an initramfs with Buildroot, it's the
> entire root filesystem that goes in the initramfs.
> 
> Perhaps we should reword it like this:
> 
> 	Note that enabling this initramfs option together with another
> 	filesystem format may not make sense: you would end up having
> 	two identical root filesystems, one embedded inside the kernel
> 	image (initramfs) and one separately. Indeed, Buildroot is
> 	unable to generate an initramfs with different contents than
> 	the root filesystem. However, we still allow generating both an
> 	initramfs and a normal rootfs image in the same configuration
> 	as they are some specific use-cases for it.
> 
> Would that work for you ?

Yes, that would work.


Thanks,
Vivien
