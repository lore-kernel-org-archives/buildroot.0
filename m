From: Bernhard Fischer <rep.nop@aon.at>
Date: Tue, 28 Nov 2006 21:15:14 +0100
Subject: [Buildroot] Buildroot, NAND flash and missing mkfs.jffs2 option
In-Reply-To: <1164737384.456c7b6809f9d@imp3-g19.free.fr>
References: <1164737384.456c7b6809f9d@imp3-g19.free.fr>
Message-ID: <20061128201514.GC27344@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Nov 28, 2006 at 07:09:44PM +0100, julien.boibessot at free.fr wrote:
>Hi !
>
>I have found that on my NAND flash, if I want to burn a JFFS2 rootfs image
>generated with buildroot, I need to add "-n" option to JFFS2_OPTS variable in
>target/jffs2/jffs2.mk Makefile.
>
>Otherwise when mounting my rootfs, I have a lot of warning messages like this
>one:
>    CLEANMARKER node found at 0x00...... has totlen 0xc != normal 0x0
>
>Was anybody aware of that special case ?

>Should I send you a patch to support NAND flash ?

I think there is at least one report at bugs.busybox.net about jffs2,
namely an endian fix and maybe another report. It would be great if you
could verify that the endian patch does break nothing for you, so that i
can apply it safely and check if there is already a report WRT jffs2 and
-n. If there is already such a report, then i ask you to be so kind and
to point me to it and also point out further problems you did encounter
with jffs2 (like the -n you mentioned above).

TIA,
Bernhard
