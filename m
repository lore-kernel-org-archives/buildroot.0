From: Mike Sander <msander@ripnet.com>
Date: Fri, 09 May 2008 15:13:41 -0400
Subject: [Buildroot] Unable to login with slow clock & MTD enabled
Message-ID: <4824A265.4050708@ripnet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

To all,

My target is an at91sam9260EK.  I have enabled MTD so I can mount data 
flash.  At the "normal" (~200 mhz) processor speed everything works well.  

We intend to run the target at a slower speed.   With a clock speed of a 
leisurly 18 mhz the system boots to a command prompt.     However after 
entering "root" at the login prompt,  I get the normal "login from 
ttyS0" message but then within a couple of seconds the system puts up 
the login prompt once more. 

If I simply rebuild the kernel with MTD disabled I can boot and login 
normally at the slow clock speed.

Anyone have any ideas how a slow processor speed, and MTD can affect the 
login process?    I have some suspicion that the SPI is not configured 
(or operating) correctly with the slow clock speed.  How this relates to 
login problems is what has me intrigued.   Any suggestions on how to 
debug failed login?

Cheers,

Mike
