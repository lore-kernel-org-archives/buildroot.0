From: ANDY KENNEDY <ANDY.KENNEDY@adtran.com>
Date: Thu, 12 Jan 2012 20:48:02 +0000
Subject: [Buildroot] Error in patch file
Message-ID: <F9C551623D2CBB4C9488801D14F864C60F0F51@ex-mb1.corp.adtran.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I had an error in an file I was working with, so I searched via:

grep -rI '\\[        ][      ]*$' .

In case LookOut morphs this, the [ 	] is <space><tab>.

It returns:
./package/java/jamvm/jamvm-1.5.0.patch.avr32:
+//        printf("compare and swap %d %d %s:line%d\n",oldval,newval,__FILE__,__LINE__);   \ 

Note:  there is a space at the end of this line, negating the \ for line continuation.

I don't know whether this patch is even used.  There are no sigs in the patch file either.

Andy
