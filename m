From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 8 Apr 2013 23:31:56 +0200
Subject: [Buildroot] Including wine package - Reg
In-Reply-To: <CAGK4xy5fzi5F0C_CaAq0e2JJmdUhNKD3ZuBqE8cBw8dsV+HQrw@mail.gmail.com>
References: <CAGK4xy6eXjG7MzWS81uNmthwd5ODBB_ae+DQMSFfPkX6_GfQiw@mail.gmail.com>
 <20130408231204.0b30b7df@skate>
 <CAGK4xy5fzi5F0C_CaAq0e2JJmdUhNKD3ZuBqE8cBw8dsV+HQrw@mail.gmail.com>
Message-ID: <20130408233156.0ab27a38@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arunkumar Vijayakumar,

On Tue, 9 Apr 2013 02:53:44 +0530, Arunkumar Vijayakumar wrote:

> Thanks for your quick reply.
> Im using i386 architecture and the variant to be i686 and creating a
> package wine with version 1.5.23. I also used the X Server package for GUI
> and followed steps as one in the below link
> http://agentoss.wordpress.com/2011/03/06/building-a-tiny-x-org-linux-system-using-buildroot/
> 
> 
> Please find the attachment for the config.in & wine.mk file for your
> reference.
> 
> Let me know if you need any additional details ?
> Also let me know why i couldn't able to use file, ldd, readelf commands in
> the prompt.

The problem is pretty clear in your wine.mk. You should use the
autotools-package infrastructure since Wine uses the autotools. This
will ensure the appropriate arguments and environment variables are
passed to the configure script. At the moment you're just calling it
using './configure --prefix=/usr', so it uses your glibc-based native
compiler to build wine... which generates a wine binary that cannot
work, because it doesn't match the C library you have on your target.

Could you submit a real patch for the wine package once you've made
some progress with this? Thanks!

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
