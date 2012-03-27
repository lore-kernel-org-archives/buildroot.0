From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 27 Mar 2012 09:12:53 +0200
Subject: [Buildroot] [PATCH 2/2] microperl: install host-microperl in
 $(HOST_DIR)/opt/perl
In-Reply-To: <cb1e211a5de6c88c39cd9890dbf823c0ff1766c3.1332831974.git.thomas.petazzoni@free-electrons.com>
References: <cover.1332831974.git.thomas.petazzoni@free-electrons.com>
 <cb1e211a5de6c88c39cd9890dbf823c0ff1766c3.1332831974.git.thomas.petazzoni@free-electrons.com>
Message-ID: <20120327091253.777d527d@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Tue, 27 Mar 2012 09:06:18 +0200,
Thomas Petazzoni <thomas.petazzoni@free-electrons.com> a ?crit :

> This commit is a tentative at fixing some Perl-related build problems
> we are having nowadays, due to the fact that microperl now depends on
> host-microperl. Since the perl binary from host-microperl is installed
> in $(HOST_DIR)/usr/bin, it gets picked up when we run host tools like
> host-intltool, which were normally meant to be used against the
> distribution-provided Perl.
> 
> This problem currently causes between a third to half of the failures
> in our random build tests.
> 
> Another, cleaner, option would be to make host-intltool depend on
> host-microperl, but this would require every user needing intltool to
> build a host Perl interpreter, even if the real reason for build the
> host Perl interpreter is only needed for those who want to build the
> Perl interpreter for the target. This commit is really a test at
> trying another solution than adding this dependency, to see whether it
> turns out to be a reasonable trade-off or not. Later developments and
> improvements in the Perl area may require to switch to a different
> solution than the one implemented by this patch.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

I have tested
http://autobuild.buildroot.org/results/9980055bf8ebc1ea442f5affc3418eb869c4c90d/defconfig
without the patch, in which case we have the host-intltool problem.
With this patch, this problem disappears and this defconfig builds
until the end with no problem.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
