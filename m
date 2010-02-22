From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 22 Feb 2010 22:09:53 +0100
Subject: [Buildroot] problem with execution ./mai -sh: ./main not found
In-Reply-To: <3ce6ccff1002221213o212936c2ub3937bedbb55f7e@mail.gmail.com>
References: <3ce6ccff1002221213o212936c2ub3937bedbb55f7e@mail.gmail.com>
Message-ID: <20100222220953.0b9fa22b@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 22 Feb 2010 17:13:06 -0300
Miguel Angel Brintrup <mbrintrup@tecnocal.cl> wrote:

> Hi to all I have a big but dummy problem. I have a main file compiled
> with gcc (usr/local/arm/3.4.1/bin/arm-linux-gcc) but when I try to
> run the program appears this problem:
> 
> # ./main
> -sh: ./main: not found

It is usually the error displayed when the shared library loader cannot
be found.

Run arm-linux-readelf -a on your program, and check what the "Program
Interpreter" is. Then verify that it exists with this *exact* same name
on your target.

Sincerely,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
