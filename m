From: Will Bickford <WBickford@efji.com>
Date: Tue, 22 Jan 2013 23:58:50 +0000
Subject: [Buildroot] Question about Buildroot-Based External Toolchains
 with 2012.11.1
In-Reply-To: <CAHXCMM+tZ_BFH6ZkE1sAzaDbyb+0NH67COk1QG5bR=Eek=uKHg@mail.gmail.com>
References: <9A206D81F45CAE4EB5A38D7E602F5AEA0B772447@TRANSXCH01.transcrypt.local>
 <CAHXCMM+tZ_BFH6ZkE1sAzaDbyb+0NH67COk1QG5bR=Eek=uKHg@mail.gmail.com>
Message-ID: <9A206D81F45CAE4EB5A38D7E602F5AEA0B77257E@TRANSXCH01.transcrypt.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> -----Original Message-----
> >
> > Related discussion:
> > http://permalink.gmane.org/gmane.comp.lib.uclibc.buildroot/45427
>
> This discussion deals with making relocatable a toolchain built using
> internal Buildroot toolchain backend, to be able to use it as an
> external one later (i.e. in another build configuration).

This is what I've done in the past (with the exception that in 2010.05 the produced toolchain didn't have the usr/ problem). I have one configuration marked to build an internal toolchain. I then use that as an external toolchain when configuring and building my target. I don't actually need it to be relocatable.

Would it make more sense to archive the state of our buildroot directory immediately after building the toolchain? I was under the impression that using Buildroot to build external toolchains would be a common operation. So far it looks like more time has been spent supporting third-party toolchains like crosstool-NG.

Our solution right now is relatively cheap in terms of disk space (a 50 MiB bz2 archive of the installed toolchain). A typical working directory for our toolchain is 3.3 GiB.

Doing a quick grep on the source tree it looks like there are 290 instances of 'HOST_DIR)/usr'. If I patch Buildroot to use the old path (via a config option), would it make sense to contribute that change? I'd prefer not to re-patch the next time we need to update.

--Will
This e-mail transmission, and any documents, files or previous e-mail messages attached to it, may contain confidential information. If you are not the intended recipient, or a person responsible for delivering it to the intended recipient, you are hereby notified that any disclosure, distribution, review, copy or use of any of the information contained in or attached to this message is STRICTLY PROHIBITED. If you have received this transmission in error, please immediately notify us by reply e-mail, and destroy the original transmission and its attachments without reading them or saving them to disk. Thank you.
