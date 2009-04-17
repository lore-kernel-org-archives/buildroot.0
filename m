From: Sven Neumann <s.neumann@phase-zero.de>
Date: Fri, 17 Apr 2009 12:44:14 +0200
Subject: [Buildroot] autoreconf fails
In-Reply-To: <1239964392.6397.11.camel@sven>
References: <1239964392.6397.11.camel@sven>
Message-ID: <1239965054.6397.13.camel@sven>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Fri, 2009-04-17 at 12:33 +0200, Sven Neumann wrote:

> with the latest buildroot snapshot, all packages that use autoreconf
> fail to compile with this error:
> 
> Can't locate Autom4te/ChannelDefs.pm in @INC (@INC
> contains: /home/sven/buildroot/build_arm/host_dir/usr/share/autoconf /etc/perl /usr/local/lib/perl/5.10.0 /usr/local/share/perl/5.10.0 /usr/lib/perl5 /usr/share/perl5 /usr/lib/perl/5.10 /usr/share/perl/5.10 /usr/local/lib/site_perl .) at /home/sven/buildroot-new/build_arm/host_dir/usr/bin/autoreconf line 42.
> BEGIN failed--compilation aborted

Looks like autoconf and automake need to be enabled in the .config file
in order to build packages that use host-autoconf and host-automake.
Shouldn't this option be selected automagically then?


Sven
