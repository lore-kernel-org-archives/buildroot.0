From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 23 Dec 2016 22:44:52 +0100
Subject: [Buildroot] [PATCH 14/14] collectd: add write_prometheus plugin
	support
In-Reply-To: <20161222015921.6832-14-gustavo@zacarias.com.ar> (Gustavo
 Zacarias's message of "Wed, 21 Dec 2016 22:59:21 -0300")
References: <20161222015921.6832-1-gustavo@zacarias.com.ar>
 <20161222015921.6832-14-gustavo@zacarias.com.ar>
Message-ID: <87fulee2wb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Add explicit support for the write_prometheus plugin, it requires the
 > libmicrohttpd and protobuf-c libraries.

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 > ---
 >  package/collectd/Config.in   | 14 ++++++++++++++
 >  package/collectd/collectd.mk |  4 +++-
 >  2 files changed, 17 insertions(+), 1 deletion(-)

 > diff --git a/package/collectd/Config.in b/package/collectd/Config.in
 > index 02c02b7..fc60917 100644
 > --- a/package/collectd/Config.in
 > +++ b/package/collectd/Config.in
 > @@ -572,6 +572,20 @@ config BR2_PACKAGE_COLLECTD_WRITELOG
 >  	help
 >  	  Writes data to the log.
 
 > +config BR2_PACKAGE_COLLECTD_WRITEPROMETHEUS
 > +	bool "write_prometheus"
 > +	depends on BR2_INSTALL_LIBSTDCPP
 > +	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"

Committed after adding '# protobuf-c'. Also committed the remainder of
the series, thanks!

-- 
Bye, Peter Korsgaard
