From: Antoine Caurier <antoine.caurier@gmail.com>
Date: Wed, 17 Oct 2012 13:03:26 +0200
Subject: [Buildroot] BuildRoot not starting with Udev
In-Reply-To: <20121016194117.2ed3a609@skate>
References: <loom.20121015T104727-737@post.gmane.org>
 <20121016194117.2ed3a609@skate>
Message-ID: <CA+mmYj1=cP3p24SnQ3HsRxQUo_gJBQidGXv5EiVKZc2D7kfjZQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I found one of your previous post, where you said that if kernel was
build by buildroot, it should be ok. So I was thinking that it should
be ok just activating udev as I am building kernel with buildroot.

I tried to manually set DEVTMPFS in linux-menuconfig, and then
recompile the kernel (with buildroot), and it is now working.

Is it normal to have manualy to set DEVTMPFS in kernel configuration
in order to have udev working?

Thanks for your answer.



On Tue, Oct 16, 2012 at 7:41 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Antoine Caurier,
>
> On Mon, 15 Oct 2012 08:55:00 +0000 (UTC), Antoine Caurier wrote:
>
>> Any ideas on what can causes my trouble?
>
> Are letting Buildroot build your kernel, or are you building your
> kernel outside of Buildroot? If you're building the kernel outside of
> Buildroot, make sure that you have CONFIG_DEVTMPFS and
> CONFIG_DEVTMPFS_MOUNT enabled in your kernel configuration/
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
