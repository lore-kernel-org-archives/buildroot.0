From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 Mar 2015 23:04:30 +0100
Subject: [Buildroot] [PATCH 06/16] package/dosfstools: add missing
 symlinks
In-Reply-To: <1421684056-5266-7-git-send-email-maxtram95@gmail.com>
References: <1421684056-5266-1-git-send-email-maxtram95@gmail.com>
 <1421684056-5266-7-git-send-email-maxtram95@gmail.com>
Message-ID: <20150308230430.5b8edb9e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Maxim Mikityanskiy,

On Mon, 19 Jan 2015 18:14:06 +0200, Maxim Mikityanskiy wrote:
> Install alternative symlinks for dosfstools mkfs.fat, fsck.fat and
> fatlabel. Those symlinks are generally installed by make install, but
> buildroot does not use make install for dosfstools, but symlinks should
> be installed anyway.
> 
> Signed-off-by: Maxim Mikityanskiy <maxtram95@gmail.com>

Thanks, I've applied your patch, but I've basically rewritten entirely
the installation logic to use makefile code instead of shell code. See
http://git.buildroot.net/buildroot/commit/?id=cef6a787cad4d5417b8672c8fd4c200bf29655ac.

To be honest, I wonder why dosfstools provides such sub-options to
select which binaries should be installed. The binaries are really
small:

-rwxr-xr-x 1 thomas thomas 40780 mars   8 22:59 fatlabel
-rwxr-xr-x 1 thomas thomas 42816 mars   8 22:59 fsck.fat
-rwxr-xr-x 1 thomas thomas 24432 mars   8 22:59 mkfs.fat

So I believe we could probably just install all of them unconditionally.

But oh, well, this is for another patch.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
