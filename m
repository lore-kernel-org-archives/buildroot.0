From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Tue, 20 Mar 2012 10:42:36 +0100
Subject: [Buildroot] [PATCH 5/6] Fix installation for the lighttpd
	package
In-Reply-To: <201203200051.48409.arnout@mind.be>
References: <cover.1332172636.git.maxime.ripard@free-electrons.com>
 <30bfa1684abbd7aabf536fdff545b06f26a70f35.1332172636.git.maxime.ripard@free-electrons.com>
 <201203200051.48409.arnout@mind.be>
Message-ID: <4F68510C.2030306@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le 20/03/2012 00:51, Arnout Vandecappelle a ?crit :
> On Monday 19 March 2012 16:59:39 Maxime Ripard wrote:
>>  package/lighttpd/lighttpd.conf |  445 ++++++++++++++++++++++++++++++++++++++++
> 
>  Same remark as for systemd: wouldn't it be better to patch the upstream
> file instead of copying it?  Also, why did you revert the disabling of
> range requests for pdf documents?

Well, here, the default values are sensible.
I mean, for a default configuration file, it is a normal behaviour for a
modern webserver to start it with its own UID/GID and to enable ipv6.
I don't see why they would accept a patch that disable these.

For PDF ranges option, it relies on a regex, and we don't always compile
with pcre, so I turned it down. Moreover, it's to fix a broken behaviour
of Adobe Acrobat's plugin that don't display the correct file size from
what I can understand, so nothing really critical here.

Here, same thing, maybe a patch against the source would be more
convenient and lightweight for us, I don't know.

-- 
Maxime Ripard, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
