From: =?utf-8?Q?Pongr=C3=A1cz_Istv=C3=A1n?= <pongracz.istvan@gmail.com>
Date: Thu, 26 Oct 2017 14:57:02 +0200
Subject: [Buildroot] gtk binary application - pango_layout_set_text
	assertion - empty strings on the UI
Message-ID: <47b140fe1a82a32fdc6fc867e1b931ef@www.startit.hu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


 Hi,

I have an issue with buildroot, when I run a gtk application built for debian/i386 over ssh/X forwarding.

The GUI shows empty strings instead of texts, even fonts are available.

Here is an image where you can see the issue exactly: https://imagebin.ca/v/3f78XVw6bLW2

In parallel, I can see the following in the console:

 

Lot of messages, exactly the same:

(pwr_rtmon:354): Pango-CRITICAL **: pango_layout_set_text: assertion 'length == 0 || text != NULL' failed

On startup of the applicaion I can see some of this (image loading for icons):

(pwr_rtmon:354): GdkPixbuf-WARNING **: Couldn't convert text chunk value to UTF-8.

What I tried:

 
Adding more and more fonts from the desktop -> the already exists texts changed a little bit, depending the used font, otherwise no effect
 
Deleting all fonts -> the characters on the shown buttons changed to black boxes, so, no texts but only bloxes (no fonts found)
 
I tried to add more and more X related applications, even xorg-server -> no effect
 
Using strace -f -ff -e open,read -o log.log whatever -> I can see the opened fonts etc.
 
Now I try to add gtk3 and gtk-demos to see, what happens with the demo applications.


Buildroot background:

 
2016.2, glibc (wchar)), busybox, gtk_engines, X.org X Window System (without X11R7 Servers), 


I am pretty sure, the problem is not a missing font, but I cannot step forward at this moment. I suspect some UTF-8 issue, but I have no proof except I already provided.

Do you have any hints, how to catch the problem? 

Thank you!

Istv?n
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20171026/d4dfd4b5/attachment.html>
