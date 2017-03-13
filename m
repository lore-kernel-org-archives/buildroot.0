From: daggs <daggs@gmx.com>
Date: Mon, 13 Mar 2017 15:17:00 +0100
Subject: [Buildroot] [PATCH 1/2] odroid-mali: fix broken headers.
In-Reply-To: <20170313133345.36d712f4@free-electrons.com>
References: <20170313090834.13715-1-daggs@gmx.com>,
 <20170313133345.36d712f4@free-electrons.com>
Message-ID: <trinity-929fc1a7-02df-4b8f-b623-1a623d2a9f58-1489414620167@3capp-mailcom-bs04>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Greetings,

> Hello,
> 
> On Mon, 13 Mar 2017 11:08:33 +0200, Dagg Stompler wrote:
> 
> > upstream has updated the headers, (https://github.com/mdrjr/c2_mali/issues/1)
> > it should fix failures such as http://autobuild.buildroot.net/results/ed8/ed8d562ae5fdb472a83f9a07b2f755c80c972c34/
> 
> Did you actually test building libepoxy with this bump, to verify that
> not only it "should fix", but that it "really fixes".
> 
> Thanks!
> 
> Thomas

yes, I did verified.
what I did encountered (not sure it is a bug), is the following:
1. checkout a clean buildroot.
2. run make odroidc2_defconfig.
3. run make menuconfig
    1. set libc to glibc.
    2. select odroid-mali.
    3. select libepoxy.
4. run build.

the above will fail libepoxy on Xlib.h no such file or directory found.
for that xorg + libX11 needs to be enabled.

Dagg.
