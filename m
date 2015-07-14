From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Jul 2015 13:56:37 +0200
Subject: [Buildroot] [PATCH] snappy: disable tests
In-Reply-To: <1436873471-25780-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1436873471-25780-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20150714135637.3f63604c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Tue, 14 Jul 2015 13:31:11 +0200, Vicente Olivert Riera wrote:
> This will also fix an unsafe header path problem:
> 
> /br/output/host/usr/bin/mips-linux-gnu-g++ -DHAVE_CONFIG_H -I.
> -I/usr/include -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
> -D_FILE_OFFSET_BITS=64  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
> -D_FILE_OFFSET_BITS=64   -Os  -c -o snappy_unittest-snappy-test.o `test
> -f 'snappy-test.cc' || echo './'`snappy-test.cc
> mips-linux-gnu-g++: ERROR: unsafe header/library path used in
> cross-compilation: '/usr/include'
> Makefile:730: recipe for target 'snappy_unittest-snappy_unittest.o'
> failed
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  package/snappy/snappy.mk | 3 +++
>  1 file changed, 3 insertions(+)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
