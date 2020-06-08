From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Mon, 8 Jun 2020 07:25:49 +0200
Subject: [Buildroot] [PATCH v2 6/7] package/systemd: add an option
 BR2_PACKAGE_SYSTEMD_GUEST
In-Reply-To: <CA+h8R2ocxhxuvL6Vu+rqjUifkKVJmJhfP6fdhsDEQq7LoKQo4Q@mail.gmail.com>
References: <20200530124735.1384078-1-francois.perrad@gadz.org>
 <20200530124735.1384078-7-francois.perrad@gadz.org>
 <CA+h8R2ocxhxuvL6Vu+rqjUifkKVJmJhfP6fdhsDEQq7LoKQo4Q@mail.gmail.com>
Message-ID: <CAB0FRsvY+=ueqzhTeDhTQy71VLe67oy+WpT7L_m8B7FH1iUFNg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le dim. 7 juin 2020 ? 00:57, Christian Stewart <christian@paral.in> a
?crit :

> Hi Francois,
>
> On Sat, May 30, 2020 at 5:48 AM Francois Perrad <fperrad@gmail.com> wrote:
> > this option allows a systemd tailored for a guest/container
>
> I don't see any changes other than disabling kmod. Actually, in my
> Docker containers I use the systemd feature of loading kernel modules,
> with the kernel modules directory mapped in. So I'm not certain that
> you want to disable kmod in all circumstances when a guest.
>
>
Currently, kmod is always selected, I want to give the choice to the user.

The host & guest share the same kernel.
In the guest, I want use it as it is configured by the host.
In my point of view, system stuff goes in the host side and the service
application goes in the guest.
At this time, my primary target is systemd-nspawn in the host, not
docker-engine
(I don't need a deployment model like with docker and the interaction
between a host systemd-nspawn and a guest systemd seems easy)

Fran?ois


> Given that this is the only effect of the flag, I don't think it's
> worth adding (too little impact for a new flag).
>
> Best,
> Christian
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200608/c96bf994/attachment-0001.html>
