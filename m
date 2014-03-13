From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 13 Mar 2014 23:00:13 +0100
Subject: [Buildroot] [PATCH] libesmtp: not available for static builds
In-Reply-To: <1394718921-59546-1-git-send-email-Vincent.Riera@imgtec.com>
 (Vicente Olivert Riera's message of "Thu, 13 Mar 2014 13:55:21 +0000")
References: <1394718921-59546-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <87zjktn4ia.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:

 > This package requires libltdl and checks for it in the configure phase.
 > If it's not present, then the build process is stopped.

 > Fixes:
 >    http://autobuild.buildroot.net/results/5cf/5cf145d3f9c78bef1f66fe9b1831723de8b4969f/

 > Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
 > ---
 >  package/collectd/Config.in |    5 +++--
 >  package/libesmtp/Config.in |    4 ++++
 >  2 files changed, 7 insertions(+), 2 deletions(-)

 > diff --git a/package/collectd/Config.in b/package/collectd/Config.in
 > index 70b0439..ad44842 100644
 > --- a/package/collectd/Config.in
 > +++ b/package/collectd/Config.in
 > @@ -4,6 +4,7 @@ config BR2_PACKAGE_COLLECTD
 >  	depends on BR2_USE_MMU
 >  	depends on BR2_INET_IPV6
 >  	depends on BR2_TOOLCHAIN_HAS_THREADS
 > +	depends on !BR2_PREFER_STATIC_LIB # libesmtp

But libesmtp is only pulled in by BR2_PACKAGE_COLLECTD_NOTIFY_EMAIL, so
the dependency should only be on that suboption.

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
