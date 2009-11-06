From: Joachim Pihl <jpihl@nevion.com>
Date: Fri, 6 Nov 2009 10:54:21 +0100
Subject: [Buildroot] Upgrading from Buildroot 0.10 to 2009.08 (ARM)
In-Reply-To: <20091106104249.55983beb@surf>
References: <op.u2yqk2doyqa4qb@jap-lappis.nevion.com>
	<1257497536.1962.15.camel@bender>
	<op.u2ytxehoyqa4qb@jap-lappis.nevion.com>
	<20091106104249.55983beb@surf>
Message-ID: <op.u2ywgvjbyqa4qb@jap-lappis.nevion.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 06 Nov 2009 10:42:49 +0100, Thomas Petazzoni  
<thomas.petazzoni@free-electrons.com> wrote:

> I think you don't need pkg-config on the target, so disable
> BR2_PACKAGE_PKG_CONFIG. This should allow you to disable libglib2
> (BR2_PACKAGE_LIBGLIB2), which in turn will allow you to disable gettext
> (BR2_PACKAGE_GETTEXT), libintl (BR2_PACKAGE_LIBINTL), libiconv
> (BR2_PACKAGE_LIBICONV).
>
> Of course, this makes the assumption that your own internal
> applications do not use libglib2.

No, they don't, so I will try the above. I think it would well explain the  
library problems.

> Then, for the Boost packages, then don't exist in Buildroot, so we
> can't say what dependencies they pull. Could you submit a patch to add
> the Boost libraries into Buildroot ?

Makefile and config input file attached. We have several patches to make  
it compile on PXA255, I guess I could provide those if you need them.

> Finally, for the duplicated C++ library thing, could you put online
> your rootfs.tar (after removing your internal applications if they are
> sensitive) ?

It seems that is gone from the latest build I attempted. *blush* Can't  
remember what I changed that can have caused that.




-- 
Joachim Pihl
Senior R&D Engineer
Nevion

Tel: +47 33 48 94 66
Fax: +47 33 48 99 98
Mobile: +47 91 33 98 91
jpihl at nevion.com
www.nevion.com

-----------------------------------
The Global Video Transport Leader
-----------------------------------
-------------- next part --------------
A non-text attachment was scrubbed...
Name: Config.in
Type: application/octet-stream
Size: 3748 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20091106/e84d00e3/attachment-0002.obj>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: boost.mk
Type: application/octet-stream
Size: 5342 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20091106/e84d00e3/attachment-0003.obj>
