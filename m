From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 03 Nov 2020 09:15:18 +0100
Subject: [Buildroot] [PATCH 1/1] package/collectd: fix build with amqp
In-Reply-To: <20201031161421.231545-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 31 Oct 2020 17:14:21 +0100")
References: <20201031161421.231545-1-fontaine.fabrice@gmail.com>
Message-ID: <87wnz297qh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > collectd unconditionally uses amqp_ssl_socket.h since version 5.11.0 and
 > https://github.com/collectd/collectd/commit/e4808ad138de362fab5efa09648fbc101f97bd76

 > Fixes:
 >  - http://autobuild.buildroot.org/results/525abe0a5cca81ff517c9c07c092d85160c7eb62

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2020.08.x, thanks.

 > ---
 >  package/collectd/Config.in | 1 +
 >  1 file changed, 1 insertion(+)

 > diff --git a/package/collectd/Config.in b/package/collectd/Config.in
 > index 9723b1ae1c..39ecbcfe54 100644
 > --- a/package/collectd/Config.in
 > +++ b/package/collectd/Config.in
 > @@ -582,6 +582,7 @@ comment "Select at least one for collectd to be useful"
 
 >  config BR2_PACKAGE_COLLECTD_AMQP
 >  	bool "amqp"
 > +	select BR2_PACKAGE_OPENSSL

NIT: A comment stating something like "needs rabbitmq-c with ssl
support" would be helpful.

-- 
Bye, Peter Korsgaard
