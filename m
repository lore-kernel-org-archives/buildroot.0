From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 1 Sep 2014 13:51:54 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2014-08-29
In-Reply-To: <20140830063010.D10AE101874@stock.ovh.net>
References: <20140830063010.D10AE101874@stock.ovh.net>
Message-ID: <54046BEA.7000303@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/30/2014 07:30 AM, Thomas Petazzoni wrote:
> Build statistics for 2014-08-29
> ===============================

>    mips64el |                  python3-3.4.1 | NOK | http://autobuild.buildroot.net/results/f6088f98372199bdf4fc02ea4e82818c68e30a54/
>    mips64el |                  python3-3.4.1 | NOK | http://autobuild.buildroot.net/results/940015d84ee574e785ef8aa7d4502f157399524f/

These failures are caused because the toolchain 
mips64el-ctng_n64-linux-gnu.tar.xz uses eglibc-2.18 which lacks the 
definition of SYS_getdents64 for MIPS64 n64.

Could be possible to upgrade that toolchain using a newer eglibc 
version, please?
-- 
Vincent
