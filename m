From: Michael S. Zick <minimod@morethan.org>
Date: Thu, 1 Dec 2011 10:52:54 -0600
Subject: [Buildroot] LIBFOO_SITE in .mk file
In-Reply-To: <001201ccb046$f8ae6600$0400a8c0@dspcgrnzks9p98>
References: <003b01cca958$91486a00$0400a8c0@dspcgrnzks9p98>
 <001101ccb044$956d1340$0400a8c0@dspcgrnzks9p98>
 <001201ccb046$f8ae6600$0400a8c0@dspcgrnzks9p98>
Message-ID: <201112011052.56806.minimod@morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu December 1 2011, Jeff Krasky wrote:
> > > I went to run 'make linux-menuconfig' and I got this message:
> > > 
> > > package/igh-ethercat/igh-ethercat.mk:11: *** missing separator.  Stop.
> >
> > I have tried running just 'make' and that gives the same error.
> 
> Looks like those lines had to be on the same line as the 'if' that proceeded
> them:
> 
> IGH_ETHERCAT_CONF_OPT += $(if
> $(BR2_PACKAGE_IGH_ETHERCAT_8139TOO),--enable-8139too,--disable-8139too)
> 
> all one line.
> 
> Also, the endef's appearing later on had to be placed on their own line, at
> the beginning.
>
Ah, the joys of:
X-Mailer: Microsoft Office Outlook 11
In-Reply-To: <001101ccb044$956d1340$0400a8c0@dspcgrnzks9p98>

Have you ever considered running Linux on that box?
Or at least a sane e-mail client?

Mike 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
> 
