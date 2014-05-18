From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 18 May 2014 10:47:21 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-05-17
In-Reply-To: <20140518063007.3CDF6100CA6@stock.ovh.net>
References: <20140518063007.3CDF6100CA6@stock.ovh.net>
Message-ID: <20140518104721.188f17ed@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 18 May 2014 08:30:07 +0200 (CEST), Thomas Petazzoni wrote:

>    powerpc |                   cppcms-1.0.4 | NOK | http://autobuild.buildroot.net/results/3c42ccc16279f6dbdfe47a44da2fd49852f4286f/

Problem was analyzed a little bit in
http://lists.busybox.net/pipermail/buildroot/2014-April/094658.html,
but I'm still not sure how to fix it. Could some C++ person have a look?

>       bfin |                 elfutils-0.155 | NOK | http://autobuild.buildroot.net/results/92291286e86f9ea943ae7aa58cbd884c8db0c5d2/

Fixed by
http://git.buildroot.net/buildroot/commit/?id=b1cf2b21dd9e2283f9020e3a5ac9ac35f8855c1a.

> microblazeel |                     gpm-1.20.7 | NOK | http://autobuild.buildroot.net/results/19d93324caac8b4aad7abfe7b6c3d85612636368/

Fixed by
http://git.buildroot.net/buildroot/commit/?id=d5996197e2e28ca8d35776012ee7e08b8301de5c.

>     x86_64 |            imagemagick-6.8.9-0 | NOK | http://autobuild.buildroot.net/results/d34077ce582866c50bbd90de10bbe593e39463f1/

Problem unknown, and somewhat weird. Yann said he tried to reproduce,
and didn't manage to.

>       bfin |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/fc4ef4101a20e64eb52da56557d6996dd73b3d86/

Not sure how to solve that one. Exclude the Blackfin toolchains that
lack the GNU Glob features?

>        sh4 |                   python-2.7.6 | NOK | http://autobuild.buildroot.net/results/2b1016a610fd8855168844433652245e2d73882e/

Static linking problem. Could be a bug in uClibc.

>       bfin |           sane-backends-1.0.22 | NOK | http://autobuild.buildroot.net/results/136100c3a2d843b7915fdd83d23d8b301fee577e/

Fixed by
http://git.buildroot.net/buildroot/commit/?id=8989bfc8a6b88b56d7942a95d6e7517075ed8ffc

>    powerpc |                     sdl-1.2.15 | NOK | http://autobuild.buildroot.net/results/486344e7be38a07feda80bda5b95fedaad837581/
>    powerpc |                     sdl-1.2.15 | NOK | http://autobuild.buildroot.net/results/6a3287430f080b016c6b246bfbb19a61ec62b659/

I've added an exception in the autobuilder scripts to avoid building
SDL with this compiler version.

>       bfin |                   tstools-1_11 | NOK | http://autobuild.buildroot.net/results/4f611e085a3e21319a98f5383adf2caac77a0bd6/

Fixed by
http://git.buildroot.net/buildroot/commit/?id=0821b7521e5103ff71042d33b4e0f613e64914be

> microblazeel |            xapp_bdftopcf-1.0.4 | NOK | http://autobuild.buildroot.net/results/8c5423f63a3887f3b3d0c3e11f60beee6a20731a/

To be investigated.

>        arm |     xserver_xorg-server-1.15.1 | NOK | http://autobuild.buildroot.net/results/18c554d148fc00f85690c1638976dd6d0d7ff219/

Fixed by
http://git.buildroot.net/buildroot/commit/?id=9d50fe608f968a5cc81ec859259f6304c3bf83c6.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
