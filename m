From: =?UTF-8?Q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>
Date: Sat, 19 Nov 2011 22:42:21 +0100
Subject: [Buildroot] need help making bootable image
In-Reply-To: <FE2CFD94-31A4-4D5D-B6B0-634C6358BE93@jakesullivan.com>
References: <FE2CFD94-31A4-4D5D-B6B0-634C6358BE93@jakesullivan.com>
Message-ID: <CAEYzJUGZSNDiNXmngFvy+M_RX9o6wcSrye7=V+sOiAkD=ntc1w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 19 November 2011 21:51, Jacob Sullivan <mail@jakesullivan.com> wrote:
[...]
> Questions:
> 1) is this the right approach, or am I missing an obvious step?

I haven't worked with ISO images + Buildroot, so I don't really have
any comments.

> 2) is there a reason that the inittab file only has getty on a serial port by default?

I think Buildroot is used most often on headless systems.

> 3) what is the recommended way of making changes to buildroot so that when a new version comes out I don't lose all my changes. ?I thought that I would just need to put my .configs into source control, but it looks like I need to change the inittab file in the skeleton. How do other people handle configuration changes that aren't covered by any of the .configs (or the various make menuconfigs)?

I personally use git branches.

For your .config file: make savedefconfig && cp defconfig
configs/myconfig_defconfig

Now Buildroot will list your config file when "make help" and load the
configuration when "make myconfig_defconfig".

Best regards,
Bj?rn Forsman
