From: Christian Stewart <christian@paral.in>
Date: Sun, 19 Jul 2020 13:07:14 -0700
Subject: [Buildroot] [RFC] Buildroot running on the NVIDIA Tegra TX2
 devkit
In-Reply-To: <CALFsTFWLXgaHSSQg5AMb0j2dTvVGatwSLP2PHqa68-2W4q_9eA@mail.gmail.com>
References: <CA+h8R2qEcwbkWAT_deTkAKHdqPpvraskuOr3bnTvsYFu9YZY6A@mail.gmail.com>
 <CALFsTFWLXgaHSSQg5AMb0j2dTvVGatwSLP2PHqa68-2W4q_9eA@mail.gmail.com>
Message-ID: <CA+h8R2rJA15y_M_4tojYoRR8Jaa3GRbKXO1P8b2r6=LQqy4MeA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Asaf, all,

The Tegra TX2 support for Buildroot / Skiff is now stable and booting properly.

I have merged the latest version to the "master" branch of Skiff.

Additional Buildroot packages were added for container GPU support:

 - libnvidia-container
 - nvidia-modprobe
 - nvidia-container-toolkit
 - nvidia-container-runtime

The latest version is available here:

https://github.com/paralin/SkiffOS/tree/master/configs/nvidia/tegra

On Sun, Jul 19, 2020 at 11:23 AM Asaf Kahlon <asafka7@gmail.com> wrote:
> On Sat, Jul 18, 2020 at 9:31 AM Christian Stewart <christian@paral.in> wrote:
> > There is a buildroot package added as an extension which downloads
> > Linux4Tegra and marks the licenses correctly (I hope).
> >
> > The system can be flashed by booting it into recovery mode (holding
> > the REC button while starting) and running the "flash_usb.sh" script,
> > which calls into T4L's flash.sh script, pointed to the Buildroot
> > images output directory.
> >
> > The kernel, u-boot, and rootfs (as ext4) are flashed, and the
> > opportunity for custom kernel arguments or boot-up behavior is there
> > as well.
> >
> > RFC, if there's interest I can format into a Buildroot mainline defconfig.
> This work seems very nice!
> I also have interest in the Nvidia Jetson series, so If you want to
> create a mainline defconfig in Buildroot I'll be more than happy to
> review and help you maintain it.

I will work on an upstream series to merge these to Buildroot mainline.

Best regards,
Christian Stewart
