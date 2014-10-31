From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 31 Oct 2014 09:26:17 +0100
Subject: [Buildroot] [PATCH 1/2] package/shairport-sync: fix avahi
	dependency
In-Reply-To: <1414712544.9427.1.camel@posteo.de>
References: <1414659789-16887-1-git-send-email-jkrause@posteo.de>	
 <20141030211121.3a97a88b@free-electrons.com> <54529F2B.8080707@mind.be>
 <1414712544.9427.1.camel@posteo.de>
Message-ID: <545347A9.4040805@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 31/10/14 00:42, J?rg Krause wrote:

[snip]

> shairport-sync uses mDNS to pubish its service. This task is implemented
> (among others) in avahi and tinysvcmdns.
> 
> To use avahi as the mDNS backend, shairport-sync requires
> libavahi-client, and not necessarily libdns_sd as I thought. Both will
> work, but libavahi-client is enough.
> 
> Before submitting this patch I have run a test with
> BR2_PACKAGE_AVAHI_DAEMON enabled, which gaves my the same error about
> the missing libavahi-client.
> 
> I've checked the sources of avahi and noticed that libavahi-client
> depends not only on avahi-daemon, but also on dbus, which was not
> selected.
> 
> Selecting BR2_PACKAGE_AVAHI_LIBDNSSD_COMPATIBILITY selects
> BR2_PACKAGE_DBUS, that's why it builds successfully.
> 
> To get libavahi-client support shairport-sync needs to select
> BR2_PACKAGE_AVAHI_DAEMON and BR2_PACKAGE_DBUS which is not quite obvious
> if you've not checked avahis configure file.
> 
> How about a patch for avahi to add BR2_PACKAGE_LIBAVAHI_CLIENT?

 Sounds good to me!

 Thanks for the detailed analysis.


 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
