From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 3 Jun 2019 08:20:18 -0500
Subject: [Buildroot] SELinux and buildroot
In-Reply-To: <CAKON4OyuQ2mR7LRdC1VS79C6Eo6oCLshXLX4b_hEHjnrYfopjQ@mail.gmail.com>
References: <CAKON4OyuQ2mR7LRdC1VS79C6Eo6oCLshXLX4b_hEHjnrYfopjQ@mail.gmail.com>
Message-ID: <CANQCQpb4UToSpY9TF=H78W+9YSQrTfCiJTfY7cD9uWh+qY1SbQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jon,


On Sun, Jun 2, 2019 at 9:41 AM jonsmirl at gmail.com <jonsmirl@gmail.com> wrote:
>
> Is there an example of a basic buildroot system properly locked down
> with selinux policies around somewhere that I can use as a guide?
>

I believe Thomas was working on a runtime test that captured a working
basic busybox configuration.  I've also CC'd Adam as he was supporting
IRC discussion on this topic last week.

Note, there were some patches as part of the original SELinux support
to Buildroot, however those are quite old and wouldn't apply to the
current refpolicy.  I believe the kernel and rootfilesystem config
also wouldn't be terribly beneficial.  Here are the links to those
patchsets.

Really old refpolicy changes we had to make for an embedded target.
Good example of what might need to be touched.
http://patchwork.ozlabs.org/patch/427128/

Example target defconfig and filesystem adjustments
http://patchwork.ozlabs.org/patch/641331/
http://patchwork.ozlabs.org/patch/641333/

Good luck!
Matt
