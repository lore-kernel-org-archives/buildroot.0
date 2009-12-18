From: Cyril HAENEL <chaenel@free.fr>
Date: Fri, 18 Dec 2009 13:10:41 +0100
Subject: [Buildroot] Strange behavior with shell redirection
Message-ID: <4B2B7141.90804@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all, sorry I don't know if I am in the good place to ask my 
question...
On an custom board based on the AT91SAM9260 processor, 
buildroot-2009.05, and jffs2 as root file system, I have an "autostart" 
script launched at board startup.
In this script (I use the true bash and not the busybox shell) I launch 
my application, and I redirect the output to a log file :

#!/bin/bash
cd /home/potentiostat
[...]
echo "Launching application"
./potentiostatApplication >> /var/log/potentiostat
# Reboot if application error
if [ $? -ne 0 ]
then
reboot
fi

I use ">>" for the redirection, thus normally each time this script is 
launched it should concatenate the new log after the older one.
But it's not the case, each time I startup the board I have a new log !!

I really don't understand this beahavior, any idea ?

Best Regards,
Cyril HAENEL

-- 

Cyril Haenel
Registered Linux User #332632
