From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 26 Jan 2013 10:45:08 +0100
Subject: [Buildroot] can I build two copies of uboot in buildroot?
In-Reply-To: <1359148418.7974.65.camel@genx> (John Stile's message of "Fri, 25
 Jan 2013 13:13:38 -0800")
References: <1359148418.7974.65.camel@genx>
Message-ID: <87wqv0ffbv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "John" == John Stile <john@stilen.com> writes:

 John> I have hacked at91bootstrap to select and boot one of two copies of
 John> uboot+env on a NAND flash, but I had to compile the second uboot my
 John> self, since the environment address is set at compile time, and
 John> buildroot only builds one copy of uboot.

Yes, you can (currently) only build a single u-boot in buildroot.

 John> How might I hack uboot to build two different copies of uboot?  I'm just
 John> changing the address location of the uboot environment, and saving the
 John> image as a different name.

Why not just use redundant u-boot environment and let both u-boots use
both? That way both environments are in sync and you gain redundancy.

-- 
Bye, Peter Korsgaard
