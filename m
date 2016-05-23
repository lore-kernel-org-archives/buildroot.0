From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 23 May 2016 16:08:38 +0200
Subject: [Buildroot] GTK NOT WORKING
In-Reply-To: <CAG7w3ykc6-Uc-aXWbabxBPVyJKVoA=gjz+0O6xCWaqJTcBGyYA@mail.gmail.com>
References: <CAG7w3ykc6-Uc-aXWbabxBPVyJKVoA=gjz+0O6xCWaqJTcBGyYA@mail.gmail.com>
Message-ID: <20160523160838.7e38c8c4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Please stop sending multiple messages for the same problem. Also,
please don't write e-mails subjects entirely in capital letters.

On Mon, 23 May 2016 18:24:34 +0530, gdbabu Krishnan wrote:

>      i have working with buildroot for raspberry pi i want to run gtk3+
> based application, i alredy selected libgtk3 and build successfully when i
> run demo application i got the following warning message
> 
> Unable to init server: could not connect : connection refused
> 
> (gtk3-demo :136) : Gtk-warning **: cannot open display

You need to run an X server.


> after this warrning message i have select some packages under,
> 
> target packages---->
>          |
>     |------>Graphic libraries and application
>         |
>         |---------->x.org xwindow system
>                 |
>                 |-------->xorg server
>                     |
>                     |---> x window system system type
>                                 (modular x.org)

Sounds good.

> but i got following error
> 
> Making all in xwayland
>   CC       Xwayland-xwayland.o
> xwayland.c:33:26: fatal error: compositeext.h: No such file or directory
>  #include <compositeext.h>

Please make sure to rebuild from scratch:

	make clean all

If you still have this compilation issue, please send your
Buildroot .config file.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
