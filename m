From: Marco Pastorelli <mpastorelli@gmail.com>
Date: Wed, 10 Jun 2015 12:06:52 +0200
Subject: [Buildroot] BR variable that points the built kernel
In-Reply-To: <20150610103606.31b56e0b@free-electrons.com>
References: <CAFRxoJ=gnhumch8GfcSEp0ettOYaRQUhc8in3uwO3MaH1d4wyg@mail.gmail.com>
 <20150609140338.49987c19@free-electrons.com>
 <CAFRxoJnECac59y=bjeHYvXP4bDwU7Em9tcGm8kxixq_EjHr0MA@mail.gmail.com>
 <20150609160304.021d6edb@free-electrons.com>
 <CAFRxoJ=O5=UvmRJPu3+qn2zVu6dniym7qTAdvWSWMf9Dpozk0Q@mail.gmail.com>
 <20150610103606.31b56e0b@free-electrons.com>
Message-ID: <CAFRxoJnZEi83_Zj45gAXMvwxZ5x=Cp1o-iMMhU9jVFHWArzbEw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,

Thanks for your help, now it's more clear.
Just to give more details I'm trying to write a post-build script in order
to create a log file of the build. One information that is important for me
is the kernel version, so I wrote the following line:

LINUX_VERSION=$(cat $(LINUX_DIR)/include/config/kernel.release)

That's where I run into the error.

So far the only way I've found is to add a makefile based package, but I
guess using a post build script could be a better solution...

Regards,
Marco.

On 10 June 2015 at 10:36, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Dear Marco Pastorelli,
>
> On Wed, 10 Jun 2015 10:29:16 +0200, Marco Pastorelli wrote:
>
> > You're right, is there a way to use make variables inside the post-build
> > script? Or this is a wrong approach?
>
> Some of the make variables are passed in the environment of post build
> script, but clearly not all of them. Especially the <pkg>_DIR variable
> for each packages is not passed.
>
> You're probably trying to do something that should be done in a
> different way. You should have a package installing whatever you need
> from $(LINUX_DIR) to $(TARGET_DIR) rather than doing it from a
> post-build script.
>
> However, your provide so little details about what you're trying to do
> that it's quite impossible to give a good advice.
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150610/43e3041f/attachment.html>
