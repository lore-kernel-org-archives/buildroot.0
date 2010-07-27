From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 27 Jul 2010 20:21:43 +0200
Subject: [Buildroot] question on gcc compile options
In-Reply-To: <159319.72678.qm@web57206.mail.re3.yahoo.com>
References: <159319.72678.qm@web57206.mail.re3.yahoo.com>
Message-ID: <20100727202143.59c750a1@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Arun,

On Fri, 16 Jul 2010 00:20:53 -0700 (PDT)
Salvat <slvt1234@yahoo.com> wrote:

> Hello,?? ? ? ?I am using buildroot-2009.02 to build a toolchain for
> mips platform. When I compile my code with the toolchain, I notice
> that there are many options passed to mipsel-linux-gcc; specifically
> the -ffunction-sections option. I would like to turn off that option.
> Can anyone point to me how to control the options sent to gcc.
> thanks,arun

Buildroot 2009.02 is very old, are you able to use a more recent
version, such as 2010.05 ?

Nothing in Buildroot is passing -ffunction-sections. So it is a
particular package that adds this option to the CFLAGS.

In particular, Busybox makes use of this -ffunction-sections. So if you
really don't want this option to be used, you have to look at each
package individually. Do you have any strong reason for not wanting
this option ?

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
