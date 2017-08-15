From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 15 Aug 2017 18:16:10 +0200
Subject: [Buildroot] [PATCHv2] fs/iso9660: really create initrd temp dir
In-Reply-To: <20170814211824.6112-1-yann.morin.1998@free.fr>
References: <20170814211824.6112-1-yann.morin.1998@free.fr>
Message-ID: <c6de822b-f44a-d94a-392c-b2febf9bb925@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 14-08-17 23:18, Yann E. MORIN wrote:
> In case we're using an initrd, we create an empty "root" directory that
> will contain only the bootloader stuff, not the actual root filesystem,
> because it is in an initrd (standalone or initramfs).
> 
> We have to ensure that the directory is empty before assembling the
> filesystem (to avoid any file lingering from a previous run, like the
> sequence  "make; make"). So we first remove it before we create it, so
> that on each build (especially not-from-scratch builds) get the exact
> expected content without any leftover.
> 
> However, the macro responsible for that, although defined since was
> never called.
> 
> Fix that by registering it as a pre-gen hook.
> 
> Note: the directory need not be created, as there are quite a few
> "install -D" commands that ensure it is created. Yet, we prefer to
> create it explicitly to avoid any confusion.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

 Applied to master, thanks.

 Regards,
 Arnout
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
