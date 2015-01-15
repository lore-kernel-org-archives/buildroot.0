From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 15 Jan 2015 08:03:04 -0300
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2015-01-13
In-Reply-To: <54B79C90.4030102@imgtec.com>
References: <20150114073013.B78E1100B35@stock.ovh.net>
 <54B79C90.4030102@imgtec.com>
Message-ID: <54B79E68.9010403@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/15/2015 07:55 AM, Vicente Olivert Riera wrote:

> this can be fixed by replacing this:
> 
> dpkg_arch=$($srcdir/run-script $PERL scripts/dpkg-architecture.pl
> -t$host -qDEB_HOST_ARCH 2>/dev/null)
> 
> with this:
> 
> dpkg_arch=$(uname -m)
> 
> in the configure script. Does anyone know a more elegant way to fix this?

Yes, patching the cputable (xtensa).
For mips64el i don't know why it's failing, probably the regex in
ostable isn't enough to catch it according to the tuple.
Regards.
