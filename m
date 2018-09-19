From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Wed, 19 Sep 2018 17:03:15 +0200
Subject: [Buildroot] [PATCH 1/8] libselinux: bump to version 2.8
In-Reply-To: <20180916184606.27835-1-fontaine.fabrice@gmail.com>
References: <20180916184606.27835-1-fontaine.fabrice@gmail.com>
Message-ID: <20180919150315.GA14081@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Sun, Sep 16, 2018 at 08:45:59PM +0200, Fabrice Fontaine wrote:
> - Remove second patch (already in version), see
>   https://github.com/SELinuxProject/selinux/commit/b24980ec07af66c4b419f8053aa65e97b36e558d
> - Update third patch
> - Pass SHLIBDIR=/usr/lib because by default it is set to /lib and LIBDIR is set to
>   $(PREFIX)/lib (with PREFIX=/usr)
> - Add hash for license file
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---

Thanks for doing this this bump!

It has been while since I was messing around with the build system for
SELinux, hopefully it got better.

I think you can omit the DESTDIR from the compilation
step for all these packages (semodule-utils and checkpolicy still use
it, even with this patchset).

Best regards,
Marcus Folkesson

-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 833 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180919/00e53801/attachment.asc>
