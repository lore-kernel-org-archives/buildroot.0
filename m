From: Marcel <korgull@home.nl>
Date: Mon, 10 May 2010 20:40:46 +0200
Subject: [Buildroot] mdev
Message-ID: <201005102040.46995.korgull@home.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I'm trying to create a couple of device nodes in /dev and somehow doing this 
manually seems not preferred so I'm trying to do this via mdev. 

My first question is whether I'm on the right track by using mdev?

I tried mdev but I can't make it work. Probably this is because I have 
something wrong in either the startup code , the mdev.conf file or whatever. 
Second I wonder how mdev works because I think it needs MAKEDEV or something 
else) which I may be missing and can't find in my buildroot. mknod is on my 
system though.
mdev -s starts and returns after a second or so, I see no errors and no other 
feedback.

I am looking for an example that works with spidev. My guess is that the entry 
in mdev.conf should be something like :

spidev 0:153 0660

Would my kernel need hotplug enabled ? (I guess it does).

I'm using a 2.6.33 kernel with a sam9g45 Atmel processor if that matters.

Best regards,
Marcel
