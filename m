From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 30 Dec 2019 21:40:16 +0100
Subject: [Buildroot] [PATCH] package/gnupg: fix TAR path in gpg-zip
 script
In-Reply-To: <20191230132316.GQ26395@scaer>
References: <20191226221437.1301418-1-thomas.petazzoni@bootlin.com>
 <20191230132316.GQ26395@scaer>
Message-ID: <20191230214016.5b865216@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 30 Dec 2019 14:23:16 +0100
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> > So we just opt with a very simple solution: replace TAR=something by
> > TAR=/bin/tar, through a post-install target hook. We only do this if
> > gpg-zip is installed, since its installation is optional. Note that
> > the logic is still not ideal, because the installation (or not) of
> > gpg-zip depends on whether the system/host tar has ustar format or
> > not.  
> 
> But isn't that always the case, in practice? If the host has 
> 1.27 <= tar <= 1.29, then we use it, and that has support for ustar.
> Otherwise, we build tar 1.29, and that also has ustar.

That's true indeed. But it's still kind of a coincidence.

Thanks for reviewing and applying!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
