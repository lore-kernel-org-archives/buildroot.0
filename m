From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Thu, 17 Mar 2011 20:21:44 +0000 (UTC)
Subject: [Buildroot] Buildroot in use
References: <1D6034426110564DA0DEA9EE9793B3835815AE17BF@NBE-MBX01.americas.swk.pri>
	<20110315180743.5e34890b@surf>
	<1D6034426110564DA0DEA9EE9793B3835815AE19D2@NBE-MBX01.americas.swk.pri>
	<20110315192211.3c59f861@surf>
	<1D6034426110564DA0DEA9EE9793B3835815AE1A1F@NBE-MBX01.americas.swk.pri>
	<20110315210538.1973f87f@surf>
	<779935.72384.qm@web161802.mail.bf1.yahoo.com>
	<4D81FB3E.7060307@carallon.com>
	<1D6034426110564DA0DEA9EE9793B3835815B51A9B@NBE-MBX01.americas.swk.pri>
Message-ID: <iltqgo$sv6$1@dough.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2011-03-17, Heyendal, Carl <CHeyendal@stanleyworks.com> wrote:

> If starting from scratch, downloading and building 2 Buildroots (one
> for the toolchain, and the other for the rest of the stuff) sounds
> reasonable. But refining the notion a bit more, if you have already
> built the entire Buildroot tree like I have done already, is it
> possible to break off the toolchain leg of the tree and move it
> somewhere else. Then of course configure the external toolchain
> option after that.

I used to try to do that with a complicated shell script that had one
option to use buildroot to build the toolchain, move it somewhere else
and fix it up. Another option would use buildroot to build the kernel
and a third would build the rootfs using that external toolchain.

After fighting with that for a month or two, I finally gave up.  Now I
use crosstool-ng to build the external toolchain; I build the kernel
separately; and I use buildroot to build only the rootfs.

It takes a little extra time to set up the three seperate build
scripts, but those three scripts are dead-simple and way easier to
maintain and use.

-- 
Grant Edwards               grant.b.edwards        Yow! I know things about
                                  at               TROY DONAHUE that can't
                              gmail.com            even be PRINTED!!
