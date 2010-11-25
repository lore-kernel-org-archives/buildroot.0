From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 25 Nov 2010 14:00:00 +0100
Subject: [Buildroot] AT91SAM9G20 Buildroot Hangs
In-Reply-To: <0C11C5BF0B29FD43A8D0250F711D497F7FB01A662F@ex01-ubitronix.ubitronix.local>
	(Abhishek Ashtekar's message of "Thu, 25 Nov 2010 13:38:37 +0100")
References: <0C11C5BF0B29FD43A8D0250F711D497F7FB01A662F@ex01-ubitronix.ubitronix.local>
Message-ID: <87mxox36en.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Abhishek" == Abhishek Ashtekar <Abhishek.Ashtekar@ubitronix.com> writes:

 Abhishek> Hello,
 Abhishek> With the AT91sam9G20ek board and buildroot-2010.08, I am able to mount the
 Abhishek> rootfs jffs2 onto the Nand.

 Abhishek> But I am unable to get the uClibc (Erik?s uClibc development platform) login
 Abhishek> prompt and the boot process hangs after Starting Network and Starting dropbear
 Abhishek> sshd:

 

 Abhishek> What could be the possible cause? and workaround of course ?

 

 Abhishek> For reference, pasted below is the Boot Log

So from the serial port.

 Abhishek> Freeing init memory: 3972K
 Abhishek> Initializing random number generator... done.
 Abhishek> Starting network...
 Abhishek> Starting dropbear sshd: generating rsa key... generating dsa key... OK

So the rootfs gets mounted and init runs. By default no getty (login)
program is running on ttyS0, but you can change that under 'Target
Options -> Generic serial port config'.

-- 
Bye, Peter Korsgaard
