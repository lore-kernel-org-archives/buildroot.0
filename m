From: ANDY KENNEDY <ANDY.KENNEDY@adtran.com>
Date: Fri, 18 Feb 2011 10:59:50 -0600
Subject: [Buildroot] device_table question
Message-ID: <9AC3F0E75060224C8BBC5BA2DDC8853A1F559B74@EXV1.corp.adtran.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

the comment:

#<name> <type> <mode> <uid> <gid> <major> <minor> <start> <inc> <count>

implies to me that if I want the device nodes:

crwxrwxrwx 1 root root 254,  0 2010-12-22 23:27 mydev1
crwxrwxrwx 1 root root 254,  1 2010-12-22 23:27 mydev2
crwxrwxrwx 1 root root 254,  2 2010-12-22 23:27 mydev3


I should be able to create an entry in the file along the lines of:

mydev    c      666    0           254     0        1      1     24

My assumption is:

Name = base name of the device
Type = type of file (char special)
mode = permissions
uid  = owner of the file
gid  = group associated with the file
major= Device major number
minor= Start of the minor numbers (in this case minor 0 = mydev1)
start= Start of the named numbers (in this case mydev1)
inc  = iteration of both minor numbers and named numbers
count= how many device to make.

FYI I have tried it this way as well as

mydev    c      666    0           254     1        0      1     24

What I end up with is

crwxrwxrwx 1 root root 254,  0 2010-12-22 23:27 mydev0
crwxrwxrwx 1 root root 254,  1 2010-12-22 23:27 mydev1
crwxrwxrwx 1 root root 254,  2 2010-12-22 23:27 mydev2

Which is undesirable for me.

Question:  Are my expectations wrong are is fakeroot/make_devs 
wrong?

Thanks,
Andy
