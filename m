From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Fri, 14 Oct 2016 09:56:38 +0200
Subject: [Buildroot] qt5webkit: host-python dependency issue in Python3
	environment
In-Reply-To: <CAGm1_ktbKzd7jbaTRryp27yZF94HMPZnZTfMw+sC1vCC8-mVvA@mail.gmail.com>
References: <CAGm1_ktbKzd7jbaTRryp27yZF94HMPZnZTfMw+sC1vCC8-mVvA@mail.gmail.com>
Message-ID: <CAGm1_ksAHMEYWSpdsdB9CD1soJkLyxppE=n=nokuN0ho-sktew@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Oct 14, 2016 at 9:53 AM, Yegor Yefremov
<yegorslists@googlemail.com> wrote:
> My project uses both Python3 and Qt5 including qt5webkit package. The
> problem in this particular constellation is, that
> output/target/usr/bin/python is a symlink to
> output/host/usr/bin/python2. i.e. host-python2 will be also built.
> This makes python usage on target impossible.
>
> I think this happens because qt5webkit has host-python dependency
> regardless of the selected Python flavor.
>
> Can qt5webkit be also built with host-python3?

I've just seen that Johan Derycke encounters this issue too.

Yegor
