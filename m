From: Jeff Krasky <jeff.krasky@dspcg.com>
Date: Thu, 1 Dec 2011 12:15:06 -0600
Subject: [Buildroot] LIBFOO_SITE in .mk file
In-Reply-To: <201112011052.56806.minimod@morethan.org>
References: <003b01cca958$91486a00$0400a8c0@dspcgrnzks9p98>
 <001101ccb044$956d1340$0400a8c0@dspcgrnzks9p98>
 <001201ccb046$f8ae6600$0400a8c0@dspcgrnzks9p98>
 <201112011052.56806.minimod@morethan.org>
Message-ID: <001301ccb055$280e8250$0400a8c0@dspcgrnzks9p98>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Looks like those lines had to be on the same line as the 'if' that
> proceeded them:
> 
> IGH_ETHERCAT_CONF_OPT += $(if
$(BR2_PACKAGE_IGH_ETHERCAT_8139TOO),--enable-8139too,--disable-8139too)
> 
> all one line.
> 
> Also, the endef's appearing later on had to be placed on their own line, 
> at the beginning.

Ok, it built the image and filesystem now.  I put them in Nandflash where
the previous kernel image and jffs2 filesystem would go (0xA0000 and
0x400000 respectively).

Now I see this error:

Freeing init memory: 124K
JFFS2 error: (1) jffs2_do_read_inode_internal: Argh. Special inode #95 with
mode
 0x21b6 had more than one node
iget() failed for ino #95
Warning: unable to open an initial console.


Any ideas?  Is something different with 2011.11?  I am using the same
bootstrap and uboot that I have been using.

Two paths:

1) Can I just look at the new igh-ethercat.mk file and put that stuff in the
EtherCAT.mk file I was working on yesterday?  I'd like to see something
work.

2) Anyone have a clue about this latest error?


Thanks.
