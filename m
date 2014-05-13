From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 13 May 2014 10:24:29 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-05-12
In-Reply-To: <20140513063008.8B2BB100F96@stock.ovh.net>
References: <20140513063008.8B2BB100F96@stock.ovh.net>
Message-ID: <20140513102429.2a1ff222@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 13 May 2014 08:30:08 +0200 (CEST), Thomas Petazzoni wrote:

>        arm |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/2851069d6964aa46d26b4aabe7d84e8c0c6c72ce/

Multiple OpenGL providers problem. This is a major design problem with
our implementation of virtual packages: nothing prevents several
providers to be selected. And then you have a mess, with 3 different
OpenGL implementations enabled for a given build.

>    aarch64 |           glibc-2.18-svnr23787 | NOK | http://autobuild.buildroot.net/results/1a2b066af2aadcae5bb01b7bc676f3fe12b48355/
>    aarch64 |           glibc-2.18-svnr23787 | NOK | http://autobuild.buildroot.net/results/e53ea1087af00e5a8964d10680ed4f0c356e87ee/

I still don't have a clue what's going on here. All AArch64 builds fail
because of this, but I'm not able to reproduce on the same machine...

>       i686 |            host-protobuf-2.5.0 | NOK | http://autobuild.buildroot.net/results/5eb6186bb088bf096e5b1af0dc3577a37e0d5166/
>       i686 |            host-protobuf-2.5.0 | NOK | http://autobuild.buildroot.net/results/9b9b20b0e4694b11425cdc2382650cdc2774e400/
>       i686 |            host-protobuf-2.5.0 | NOK | http://autobuild.buildroot.net/results/0dce9520156c41233d58799d647b311af5f70687/
>       i686 |            host-protobuf-2.5.0 | NOK | http://autobuild.buildroot.net/results/518d72b16c0c288f200a1919bbc29d62c32e8625/

Fixed by
http://git.buildroot.net/buildroot/commit/?id=0f6fca606134b81c13a9cd03169158a24e3346f5.

>       sh4a | jack2-ab409a65df95bc261ff72... | NOK | http://autobuild.buildroot.net/results/4ba02f50e67ada93681be15146f7024b704b9dc3/

Same 'waf' issue as the one pointed in yesterday build failures.

>       bfin |                libbluray-0.5.0 | NOK | http://autobuild.buildroot.net/results/3fae35ebcf14d6f38284d8318f61f9b99998794c/

Fixed by
http://git.buildroot.net/buildroot/commit/?id=952f3dfb54d3424225edaa78fe6b107f045aa29b.

>      avr32 |     libcec-libcec-2.1.4-repack | NOK | http://autobuild.buildroot.net/results/1be1d23b52b698841ea74dbb2316c5069916bd1f/
>      avr32 |     libcec-libcec-2.1.4-repack | NOK | http://autobuild.buildroot.net/results/89d8165b455cd7131e4c0729cec50dad8980ceb1/

Both fixed by
http://git.buildroot.net/buildroot/commit/?id=a5dbc10a7fc1d707b277fd8a961ffb97a3e74af9

>        arm |                  libmbus-0.8.0 | NOK | http://autobuild.buildroot.net/results/1816a0f4bf1f3345041efef733a5e25239eb6cba/
>   mips64el |                  libmbus-0.8.0 | NOK | http://autobuild.buildroot.net/results/e985b180a683d2e391725d69c2a7f9ee3e5bb959/

Fixed by
http://git.buildroot.net/buildroot/commit/?id=24e164403214847b6cb1993e9d3cd46ae86f64c7

>   mips64el |                  libnss-3.14.5 | NOK | http://autobuild.buildroot.net/results/e800f40af02c1a8bddf8504708ba6f282a4b36c9/

Vincente, can you have a look?

>        arm |              lttng-tools-2.4.1 | NOK | http://autobuild.buildroot.net/results/4a9e3bfa381dded76aa1b630ecef3ce5cbbbc81a/

Fixed by
http://git.buildroot.net/buildroot/commit/?id=85082cab93b282021006ddee63793403b90ffe1f.

>        arm |              lttng-tools-2.4.1 | NOK | http://autobuild.buildroot.net/results/6b342c2d101348e4d39285f45481e2aafa3d8b3f/

Ditto.

>        arm |              lttng-tools-2.4.1 | NOK | http://autobuild.buildroot.net/results/37d61e2b06b352b6f44cf5bc185d6fd5e223e83c/

Buildroot external toolchain. Will be fixed once -rc1 is released and I
rebuild all the Buildroot external toolchains.

>        arm |                   pango-1.28.4 | NOK | http://autobuild.buildroot.net/results/ab57dd3729d529366808cbfc802f49360b2ec2b9/

To be investigated by some X.org person. Bernd maybe?

>       i686 |                   pango-1.28.4 | NOK | http://autobuild.buildroot.net/results/23f1178838e32832b24354ba99dbb7b53763291c/

Fixed by
http://git.buildroot.net/buildroot/commit/?id=b11289752e5f862afeced9f34bfab2e6a521b776
and
http://git.buildroot.net/buildroot/commit/?id=c95a30471da61bd8b1396d85fd4401c0cf7901c8.

>       bfin |                 pciutils-3.2.1 | NOK | http://autobuild.buildroot.net/results/c78e5cbf1b6f2ec25f34f752d2fd58a6a38b55b7/

Some symbol prefix issue, specific to Blackfin.

>        arc |                 pulseaudio-5.0 | NOK | http://autobuild.buildroot.net/results/6a378aacf903af5f348c2c4b3d269c90202077a7/

checking for atomic_ops.h... no
configure: error: *** libatomic-ops headers not found
make: *** [/home/test/test/3/output/build/pulseaudio-5.0/.stamp_configured] Error 1

>      avr32 |                   radvd-1.10.0 | NOK | http://autobuild.buildroot.net/results/f0367a30e8d772eb5e955a85b853ec3e43fe54b3/

"Fixed" by
http://git.buildroot.net/buildroot/commit/?id=e37f97527e4aeb8a4b3b34002dadc5a55b808455.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
