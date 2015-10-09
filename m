From: Peter Seiderer <ps.report@gmx.net>
Date: Sat, 10 Oct 2015 00:02:12 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2015-10-08
In-Reply-To: <20151009063017.B1789101629@stock.ovh.net>
References: <20151009063017.B1789101629@stock.ovh.net>
Message-ID: <20151010000212.22f6b063@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  9 Oct 2015 08:30:17 +0200 (CEST), Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

>       x86_64 |                   libv4l-1.6.3 | NOK | http://autobuild.buildroot.net/results/ba2f067734ce5da4f9198ceeb8647af4312e17fc/

Could not reproduce this one, but the failing build-end.log states:

  GEN      moc_qv4l2.cpp
/bin/bash: /ssd1/thomas/autobuild/instance-3/output/host/usr/x86_64-buildroot-linux-gnu/sysroot/ssd1/thomas/autobuild/instance-3/output/host/usr/bin/moc: No such file or directory


Would have expected something like

	/ssd1/thomas/autobuild/instance-3/output/host/usr/bin/moc

as moc path, MOC is calculated as (see configure.ac)

	MOC=`$PKG_CONFIG --variable=moc_location QtCore`

Any hints?

Regards,
Peter
