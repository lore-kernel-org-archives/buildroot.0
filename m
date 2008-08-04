From: Dirk Vermaak <dirk.vermaak@ntlworld.com>
Date: Mon, 4 Aug 2008 10:43:35 +0100
Subject: [Buildroot] Difficulties with dynamically linking to
	libasound.so.2.0.0
Message-ID: <200808041043.36165.dirk.vermaak@ntlworld.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

We are trying to run a program using the libasound.so.2.0.0 shared library on 
a sam9260. We have compiled the program on our host machine and it works ok.

We compile for our target and compilation is OK but when we run it we get a 
seg fault.

We are pretty sure it is to do with linking to the libasound module as we have 
stripped own some code  so it only has a couple of printfs in it and this 
works ok, but as soon as we add the libasound in the linking we get the seg 
fault again.

our complie line is 

arm-linux-gcc -Wall -fPIC -D -oramps 
DAudio1.1.c -l:libasound.so.2.0.0 -L/home/dirk/diarre/linux/build6/buildroot/project_build_arm/at91sam9260dfc/root/usr/lib

(Sorry about the long paths but we have been trying to eliminate all problems.

Does anyone have any suggestions as to what we are doing wrong here? 

Thanks 

Dirk.
