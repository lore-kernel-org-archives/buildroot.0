From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Nov 2016 21:51:11 +0100
Subject: [Buildroot] [PATCH v2] mplayer: disable for FLAT
In-Reply-To: <20161120164526.12576-1-arnout@mind.be>
References: <20161120164526.12576-1-arnout@mind.be>
Message-ID: <20161121215111.71ce807d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 20 Nov 2016 17:45:26 +0100, Arnout Vandecappelle
(Essensium/Mind) wrote:
> mplayer uses a homegrown configure script that calls 'gcc -v | tail -1'
> to find the gcc version. However, our toolchain wrapper adds
> -Wl,-elf2flt to the gcc arguments. This triggers gcc to do an actual
> compile (rather than just printing version info and exiting), and that
> compile fails because of the missing definition of main(). The last
> line of the output is therefore:
> collect2: error: ld returned 1 exit status
> and configure doesn't find a version in there. It then falls back to
> using the host gcc instead, which breaks things completely a bit
> further down the line.
> 
> Since mplayer probably isn't very useful on noMMU architectures anyway,
> just disable it completely for FLAT.
> 
> Fixes:
> http://autobuild.buildroot.net/results/58cf28a3acd518633a1d8ea719bc70aefbdfb311
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
> v2: added the fixes line
> ---
>  package/mplayer/Config.in | 3 +++
>  1 file changed, 3 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
