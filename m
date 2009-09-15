From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 15 Sep 2009 13:21:27 +0200
Subject: [Buildroot] Building buildroot without U-boot
In-Reply-To: <330EC2471BF24E48B513AF1A6975EB69B00909@MAIL-UA.ccs.local> (Teemu
	Keskinarkaus's message of "Tue\, 15 Sep 2009 12\:43\:43 +0200")
References: <330EC2471BF24E48B513AF1A6975EB69B00909@MAIL-UA.ccs.local>
Message-ID: <87vdjk1miw.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Teemu" == Teemu Keskinarkaus <Teemu.Keskinarkaus@cc-systems.com> writes:

 Teemu> Hi,

 Teemu> In older version there was selection in menuconfig if to build
 Teemu> U-boot or not, but in latest stable version that selection is
 Teemu> removed and U-boot is build everytime. Problem is that I don?t
 Teemu> need it and more importantly it won?t compile okay. What is the
 Teemu> correct way to disable U-boot from building if there is any?

 Ehh, Target filesystem options -> Das U-Boot Boot Monitor is here just
 like it used to be. Just disable that option and it won't get built.

What might get built (depending on config) is the mkimage tool for the
host if you have selected to build a kernel and stick it in an uimage.

-- 
Bye, Peter Korsgaard
