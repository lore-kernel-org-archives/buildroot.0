From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 8 Sep 2014 21:01:52 +0200
Subject: [Buildroot] Trying to configure barebox
In-Reply-To: <CANqHzhgYBGs6OFE98dWE=N9pBFMYPakKyvC0=8nkqqAfQrs5rw@mail.gmail.com>
References: <CANqHzhgYBGs6OFE98dWE=N9pBFMYPakKyvC0=8nkqqAfQrs5rw@mail.gmail.com>
Message-ID: <CAAXf6LVf-X_CJ67f5HnrUt4uB+m8FSHdrP+_rT0jXN08pUR3Xg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Sun, Sep 7, 2014 at 8:49 PM, MC Potgieter <bluscape@gmail.com> wrote:
> I'm using buildroot 2014.08.0 and try to configure barebox using:
>
> make barebox-menuconfig
>
> but get an error:
>
> cp: cannot stat
> ?/home/jdoe/local/buildroot/output/build/barebox-2014.08.0/arch/arm/configs/_defconfig?:
> No such file or directory

It looks like you indicated in the buildroot configuration that you
want to use a defconfig for barebox, but did not actually specify
which defconfig. Please double-check the settings for Barebox in the
Buildroot configuration (make menuconfig).

We should probably add a check for this situation in Buildroot, just
as we do for the kernel. I will take this along in the kconfig-package
infrastructure when I get to improving that.

Best regards,
Thomas
