From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 6 Oct 2020 14:41:19 -0500
Subject: [Buildroot] [PATCH] package/libselinux: fix the selinuxfs mount
 point
In-Reply-To: <20201006154430.792940-1-antoine.tenart@bootlin.com>
References: <20201006154430.792940-1-antoine.tenart@bootlin.com>
Message-ID: <CANQCQpaLwGXxNeVM8zA4URbCAmYOuUwA+JVsgKboozgibuXBgQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Antoine,

On Tue, Oct 6, 2020 at 10:46 AM Antoine Tenart
<antoine.tenart@bootlin.com> wrote:
>
> For 9 years the recommended mount point for selinuxfs has been
> /sys/fs/selinux, as stated in Linux kernel commit 7a627e3b9a2b:
>
> """
> For selinuxfs, this mount point should be in /sys/fs/selinux/
> """
>
> As other projects follow this convention, not doing so result in
> potential issues. One of them is the refpolicy not correctly labelling
> and supporting the mount point.
>
> Fix this by using /sys/fs/selinux as of now in Buildroot.
>
> Signed-off-by: Antoine Tenart <antoine.tenart@bootlin.com>

I just asked Clayton Shotwell why we originally set it to /selinux and
our best guess was that we were following the pattern WindRiver had
done on their Secure Linux 1.0 (Fedora based?).

Reviewed-by: Matthew Weber <matthew.weber@rockwellcollins.com>
