From: Tony Mozi <spooflinux@hotmail.fr>
Date: Fri, 19 Feb 2010 16:31:45 +0100
Subject: [Buildroot] create device nodes,
 edit mini_device_table.txt (cross compilation for an ARM)
Message-ID: <SNT129-W625BE919D415C537295C37B9460@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi,
In fact, if I modify the mini_device_table.txt there is no effect.
But if I modify device_table.txt, it's ok, the node is created.
What is the difference between the two files??

BR

From: spooflinux@hotmail.fr
To: buildroot at busybox.net
Subject: create device nodes, edit mini_device_table.txt (cross compilation for an ARM)
Date: Tue, 16 Feb 2010 10:11:55 +0100













Hi,
In order to create nodes for my device, I edit /buildroot-2009.11/target/generic/mini_device_table.txt

In the bottom, I add :
/dev/lba        b       660     0       0       207     0       -       -       -
/dev/lba        b       660     0       0       207     0       0       1       4

And I rebuild my linux and my buildroot.

I search this directory by serial console :
# cat /proc/partitions                                                          
major minor  #blocks  name                                                      
                                                                                
 207     0    3906560 lba                                                       
 207     1     204800 lba1                                                      
 207     2    3701760 lba2 

# ls /dev/lba                                                                   
ls: /dev/lba: No such file or directory

An idea?

BR
 		 	   		  
Faites une bonne action avec Bing Solidaire ! C'est ici ! 		 	   		  
_________________________________________________________________
Tchattez en direct en en vid?o avec vos amis !  
http://www.windowslive.fr/messenger/
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100219/9907344e/attachment.htm>
