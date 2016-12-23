From: Alistair Francis <alistair.francis@xilinx.com>
Date: Thu, 22 Dec 2016 17:09:42 -0800
Subject: [Buildroot] [PATCH v2] package/xen: Update to version 4.8.0
In-Reply-To: <20161222235936.018f7807@free-electrons.com>
References: <1482445317-9435-1-git-send-email-alistair.francis@xilinx.com>
 <20161222235936.018f7807@free-electrons.com>
Message-ID: <CAKmqyKOMOCfa3+BAsdOuAOSy+acQnSTjQOcr9H2XxQbd1e9t4w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Dec 22, 2016 at 2:59 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Thu, 22 Dec 2016 14:21:57 -0800, Alistair Francis wrote:
>
>> +TARGET_CONFIGURE_OPTS := $(subst CFLAGS=",APPEND_CFLAGS="-Wno-error ,$(TARGET_CONFIGURE_OPTS))
>
> You seem to miss the very important fact that the variable namespace in
> Buildroot is global. So when you change TARGET_CONFIGURE_OPTS here you
> change it for *all* packages, not just yours.

I did miss that. I should have done a clean build and test before I sent this.

>
> What are you trying to do here? If you want to override the CFLAGS just
> for Xen, you should do:
>
> XEN_CONF_ENV = \
>         CFLAGS="$(TARGET_CFLAGS) your custom cflags"

I need to do that as well as unset the CFLAGS (I need to replace it
with APPEND_CFLAGS).

If I did the same thing but stored it in a Xen specific variable would
that be ok?

Thanks,

Alistair

>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
