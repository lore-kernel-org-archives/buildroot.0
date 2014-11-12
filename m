From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 12 Nov 2014 13:36:05 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/shairport-sync: fix avahi
	dependency
In-Reply-To: <1415106269-17526-1-git-send-email-jkrause@posteo.de>
 (=?utf-8?Q?=22J=C3=B6rg?=
 Krause"'s message of "Tue, 4 Nov 2014 14:04:29 +0100")
References: <1415106269-17526-1-git-send-email-jkrause@posteo.de>
Message-ID: <871tp8lhoq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "J?rg" == J?rg Krause <jkrause@posteo.de> writes:

 > shairport-sync uses mDNS to pubish its service. This task is implemented
 > (among others) in avahi and tinysvcmdns.

 > To use avahi as the mDNS backend, shairport-sync requires libavahi-client or
 > libdns_sd. Both will work, but libavahi-client is sufficient.

 > To get libavahi-client support from avahi BR2_PACKAGE_AVAHI_DAEMON and
 > BR2_PACKAGE_DBUS needs to be selected. Unfortunatly this is not immediately
 > obvious if you've not checked avahis configure file. A
 > BR2_PACKAGE_LIBAVAHI_CLIENT config symbol may help here for clarification,
 > but is not present yet.

 > Fixes autobuild errors:
 >   - http://autobuild.buildroot.net/results/a6a/a6ab7641a3cafcdaeffe11f08d5fcacbbb882d8d/
 >   - http://autobuild.buildroot.net/results/cb4/cb41980f2fb416d627bea0950e1dae727eae0ca6/
 >   - http://autobuild.buildroot.net/results/009/00929df01474813be576936e80e86374efdbc327/
 >   - http://autobuild.buildroot.net/results/a40/a40b8cf9aaa4ade4d96524219276cfad2920104c/
 >   - http://autobuild.buildroot.net/results/03f/03fff2805b3348f2557bbef73a716eadea3add03/

 > and some more.

 > Signed-off-by: J?rg Krause <jkrause@posteo.de>
 > ---
 > Changes v1 -> v2:
 >   - check for avahi-daemon and dbus instead of libdns_sd to enable avahi support

Committed, thanks.

-- 
Bye, Peter Korsgaard
