From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Tue, 1 Oct 2019 01:14:41 +0200
Subject: [Buildroot] [PATCH 10/10] package/mdevd: bump version to 0.1.1.0
In-Reply-To: <87wodp1npl.fsf@dell.be.48ers.dk>
References: <20190929171017.26831-1-eric.le.bihan.dev@free.fr>
 <20190929171017.26831-11-eric.le.bihan.dev@free.fr>
 <20190930225757.44578f50@windsurf.home>
 <87wodp1npl.fsf@dell.be.48ers.dk>
Message-ID: <20190930231441.GB11114@itchy>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

On 2019-09-30 23:25, Peter Korsgaard wrote:
> >>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:
>
>  > On Sun, 29 Sep 2019 19:10:17 +0200
>  > Eric Le Bihan <eric.le.bihan.dev@free.fr> wrote:
>
>  >> This new package provides mdevd, a small daemon managing kernel hotplug
>  >> events similar to udevd.
>  >>
>  >> Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
>
>  > We have a choice between static /dev, devtmpfs, devtmpfs + Busybox
>  > mdev, devtmpfs + eudev, should we add a choice of devtmpfs + mdevd ?
>
>  > What happens if we have both Busybox mdev *and* mdevd in the same
>  > configuration ?
>
> What is the advantage of mdevd over mdev now that we use the daemon mode
> of mdev?

I did not know about the daemon mode of mdev, but mdevd was created to
overcome the mdev forking issue [1] and predates the daemon option [2].

So in the end, they provide the same features, with mdevd also complying
with s6 notification mechanism [3], making it more tightly coupled with
this init system.

Given that there is no option in menuconfig to use a s6-based init
system [4], I see no reason to add a "devtmpfs+mdevd" option ATM.

Users should select the mdevd package when implementing their own custom
s6-based init.

[1] https://skarnet.org/software/mdevd/mdevd.html
[2] https://git.skarnet.org/cgi-bin/cgit.cgi/mdevd/tag/?h=v0.0.1.0
[3] https://skarnet.org/software/s6/notifywhenup.html
[4] http://buildroot-busybox.2317881.n4.nabble.com/RFC-0-3-init-Add-s6-as-init-system-tp213980p216232.html

Regards,

--
ELB
