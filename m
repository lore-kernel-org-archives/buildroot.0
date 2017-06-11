From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Jun 2017 15:52:28 +0200
Subject: [Buildroot] [PATCH] intltool: add patch to fix compatibility
 with Perl 5.26
In-Reply-To: <20170608070344.30718-1-joerg.krause@embedded.rocks>
References: <20170608070344.30718-1-joerg.krause@embedded.rocks>
Message-ID: <20170611155228.6cda31e2@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  8 Jun 2017 09:03:44 +0200, J?rg Krause wrote:
> When Perl 5.26 is installed on the host, building some packages like
> avahi fail, because of intltool-update:
> 
> ```
> Unescaped left brace in regex is illegal here in regex; marked by <-- HERE in m/^(.*)\${ <-- HERE ?([A-Z_]+)}?(.*)$/@$BUILDROOT/host/usr/bin/intltool-update line 1065.
> ```
> 
> Apparently, this has been a warning before Perl 5.26, but now it is an
> error.
> 
> Fetch from:
> https://github.com/Alexpux/MSYS2-packages/blob/master/intltool/perl-5.22-compatibility.patch
> 
> Reported upstream:
> https://bugs.launchpad.net/intltool/+bug/1696658
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  .../intltool/0001-perl-5.26-compatibility.patch    | 53 ++++++++++++++++++++++
>  1 file changed, 53 insertions(+)
>  create mode 100644 package/intltool/0001-perl-5.26-compatibility.patch

Applied to master, thanks.

FWIW, the bug was already reported upstream at
https://bugs.launchpad.net/intltool/+bug/1490906.

Peter: this is a build fix, we perhaps want it in the LTS branches?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
