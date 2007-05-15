From: Mats Erik Andersson <mats.andersson64@comhem.se>
Date: Tue, 15 May 2007 11:57:59 +0200
Subject: [Buildroot] Busybox console wont show up
In-Reply-To: <1b0abb4c0705141717m43eeef65r4e0a593e21dc87e7@mail.gmail.com>
References: <1b0abb4c0705141717m43eeef65r4e0a593e21dc87e7@mail.gmail.com>
Message-ID: <1179223079.3613.12.camel@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

m?n 2007-05-14 klockan 17:17 -0700 skrev Ajay Sharma:
> Hi All,
> I have built successfully kernel and file system  image  for IXP425
> development board. When I try to boot the system, it boots till it
> shows 
> this screen and does not show the Busybox prompt on the screen . 
> I am trying to see that on the Serial Console. 
> I have also changed the line 
> 
> #ttyS0::respawn:/sbin/getty -L ttyS0 115200 vt100
> 
> to
> 
> ttyS0::respawn:/sbin/getty -L ttyS0 115200 vt100
> 

Somewhat naively on my side, try the conservative convention
of only allowing two letter names for actions in inittab:

S0::respawn:/sbin/getty -L ttyS0 115200 vt100

i.e., replace "ttyS0" by "S0" in the beginning. Some years ago
there was always a recommendation/demand two only use two letters.

Regards,   Mats Erik Andersson
