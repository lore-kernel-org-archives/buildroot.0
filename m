From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 06 Sep 2017 11:08:57 +0200
Subject: [Buildroot] [PATCHv2] fs/iso9660: really create initrd temp dir
In-Reply-To: <20170814211824.6112-1-yann.morin.1998@free.fr> (Yann E. MORIN's
 message of "Mon, 14 Aug 2017 23:18:24 +0200")
References: <20170814211824.6112-1-yann.morin.1998@free.fr>
Message-ID: <877exci47q.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > In case we're using an initrd, we create an empty "root" directory that
 > will contain only the bootloader stuff, not the actual root filesystem,
 > because it is in an initrd (standalone or initramfs).

 > We have to ensure that the directory is empty before assembling the
 > filesystem (to avoid any file lingering from a previous run, like the
 > sequence  "make; make"). So we first remove it before we create it, so
 > that on each build (especially not-from-scratch builds) get the exact
 > expected content without any leftover.

 > However, the macro responsible for that, although defined since was
 > never called.

 > Fix that by registering it as a pre-gen hook.

 > Note: the directory need not be created, as there are quite a few
 > "install -D" commands that ensure it is created. Yet, we prefer to
 > create it explicitly to avoid any confusion.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

 > ---
 > Changes v1 -> v2:
 >   - expand commit log; explain why it was seemingly working  (Thomas)

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
