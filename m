From: Steve Kenton <skenton@ou.edu>
Date: Sat, 10 Feb 2018 22:42:41 -0600
Subject: [Buildroot] Build creating empty directories in output/target/tmp
Message-ID: <f3393f02-41ae-bb78-25a2-27c17ca10c90@ou.edu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I noticed something odd on my embedded system rootfs when it was not 
running. There were empty directories in /tmp

/I checked my 2017.11 build and sure enough they were in 
output/target/tmp too/

/They are empty and get hidden by the tmpfs overmount of /tmp when 
running, but it seems odd if harmless.
/

hdi at hdi-H110N:/ssd/bcdist/buildroot-2017.11$ ls -l output/target/tmp
total 8
drwxr-xr-x 2 hdi hdi 4096 Feb 10 20:50 fontconfig
drwxr-xr-x 2 hdi hdi 4096 Feb 10 21:13 samba
hdi at hdi-H110N:/ssd/bcdist/buildroot-2017.11$


Steve Kenton


-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180210/6b120ba5/attachment.html>
