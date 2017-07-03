From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 3 Jul 2017 16:59:48 +0200
Subject: [Buildroot] [PATCH] uftrace: new package
In-Reply-To: <a744ab11-02b0-6ed6-c975-b3816ca3bf50@smile.fr>
References: <20170625193743.8424-1-vincent.stehle@laposte.net>
 <a744ab11-02b0-6ed6-c975-b3816ca3bf50@smile.fr>
Message-ID: <7d0c8056-d6cf-cff7-0a4b-7a11c7a033c0@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 03-07-17 16:45, Romain Naour wrote:
> Use $(TARGET_CONFIGURE_OPTS) instead of defining CC, CFLAGS etc on the command
> line. Also add parenthesis
> Something like:
> 
> 	(cd $(@D) && \
> 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) \
> 	ARCH="$(ARCH)" \
> 	./configure --prefix=/usr)

 No, don't add parenthesis. Somebody a long time ago started doing that but
there is absolutely no reason for it, it just creates an additional shell level
that serves no purpose whatsoever.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
