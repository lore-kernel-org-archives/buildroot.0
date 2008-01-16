From: Kumar S <ps2kumar@yahoo.com>
Date: Wed, 16 Jan 2008 01:02:35 -0800 (PST)
Subject: [Buildroot] accept() issue while porting App to uclinux on ARM9
Message-ID: <681091.97691.qm@web55709.mail.re3.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
  I have a multi threaded application which is at present running on FC5 as well as Montavista 5.0. I have a problem in porting it to uclinux on ARM9 - Intel Rosedale 1 board. Socket calls are used in this application, and this path is used to initialize and spawn all other threads. The issue I have is with accept call(). Socket creation, bind, listen are successful. But accept() never returns. It is blocking infinitely. Just to know whether Socket stack is up and running I had created one small application with sockets. That works fine. Some where in the forum I found that stack size may not be sufficient. I tried increasing it up to 128k but no use. Is this some thing to do with the size of program? My application takes around 1.6MB. 
  I have also tried to put tftpd and telnetd. Telnetd is up and running, only thing is the authentication is failing (user/password). I think i can fix this by tweeking the code. But tftpd doesn't work. It doesn't respond to client requests. May be this could be same as what I'm experiencing with my application. Solving one might fix the other.
   
  Can some body please help me in resolving this?
   
  Regards
  Kumar

       
---------------------------------
Looking for last minute shopping deals?  Find them fast with Yahoo! Search.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080116/b5f6d807/attachment-0001.htm 
