From: Chris Packham <judge.packham@gmail.com>
Date: Mon, 20 Jan 2014 21:35:41 +1300
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2014-01-19
In-Reply-To: <20140120073009.9260E101682@stock.ovh.net>
References: <20140120073009.9260E101682@stock.ovh.net>
Message-ID: <52DCDFDD.3000303@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 20/01/14 20:30, Thomas Petazzoni wrote:
>        sh4 |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/c5791912f3d05c9c93e54e85989b25002aa9085f/
>    powerpc |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/4387ea6ddcda0ec72a3c1b1345a74f604ca9cc9c/
>        arm |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/abaa014eb74a140afb1ef48922f27d2aacd47885/
>    powerpc |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/918834dc396e5898ed902cd194546cd15801882b/
>        sh4 |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/624a11f8c5916336c3ee2a5d618344b80e61d3f8/
>       mips |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/103e7a17f815f77a51172c20f0862d32521b246b/
>    powerpc |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/e78cb0c352a954c10af90a5d55a59957508a9a85/
>       mips |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/059018fccfc5d05fee575143eeb488fead672fcb/
>       i686 |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/ca87135e3aa0b192b313b6782f379c0b622e39ef/
>       i686 |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/c59b8f9d93d77c8b75c02172ff6e6072e8f62228/

I'm feeling kind of bad about the tcpreplay failures that just seem to
be piling up. So far I've not been able to reproduce the issue. I think
the problem is that under some condition the __VA_ARGS__ macro is
unavailable.

Tcpreplay 4.0.2 was released a day or two ago. I know there are a number
of warnings fixes but I'm a little hesitant to update tcpreplay again
without understanding where these failures are coming from.
