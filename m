From: Johnnie Peters <johnnie123@verizon.net>
Date: Tue, 04 Sep 2007 08:51:03 -0700
Subject: [Buildroot] Serial port loging
In-Reply-To: <46D5CEF5.8070605@verizon.net>
References: <46D5CEF5.8070605@verizon.net>
Message-ID: <46DD7EE7.8060000@verizon.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All,

The problem was /dev/ttySA0 was not in the /etc/securetty file.

Johnnie

Johnnie Peters wrote:
> Hi All,
>
> I am building a buildroot environment for the CM-X270 board.  I have it 
> defined to use "arm" "xscale" and "EABI".  I have added a getty for 
> ttySA0 into the inittab and now I get a login prompt on the serial 
> port.  I see that the "root" login has a blank password field int he 
> /etc/shadow file so I expected it to just login in when I enter root.
>
> Instead it pauses for a few seconds and displays the login prompt 
> again.  I then set up the shutdown login to run reboot.  When I tried 
> this I got an error that indicated it was not being ran as root so I set 
> the owner ID of shutdown in the /etc/passwd file to be 0.  Now when I 
> try to login as shutdown it also pauses for a few seconds and then 
> displays the login prompt again.
>
> Any ideas?
>
> Thanks for any info,
>
> Johnnie
>
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
>
>   
