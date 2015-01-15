From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 15 Jan 2015 11:55:12 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2015-01-13
In-Reply-To: <20150114073013.B78E1100B35@stock.ovh.net>
References: <20150114073013.B78E1100B35@stock.ovh.net>
Message-ID: <54B79C90.4030102@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear all,

On 14/01/15 08:30, Thomas Petazzoni wrote:
> Build statistics for 2015-01-13
>      mips64el |      start-stop-daemon-1.16.15 | NOK | http://autobuild.buildroot.net/results/24e37550749dc15ed7223fd515fa4628803f341e/

On 15/01/15 08:30, Thomas Petazzoni wrote:
 > Build statistics for 2015-01-14
>      xtensa |        start-stop-daemon-1.16.15 | NOK | http://autobuild.buildroot.net/results/445bf4742d78a0bf93b4c75dc733c4315530031e/

this can be fixed by replacing this:

dpkg_arch=$($srcdir/run-script $PERL scripts/dpkg-architecture.pl 
-t$host -qDEB_HOST_ARCH 2>/dev/null)

with this:

dpkg_arch=$(uname -m)

in the configure script. Does anyone know a more elegant way to fix this?

Regards,

--
Vicente Olivert Riera
Graduate Software Engineer, MIPS Platforms
Imagination Technologies Limited
t: +44 (0)113 2429814
www.imgtec.com
