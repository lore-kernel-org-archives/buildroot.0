From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 4 Mar 2018 23:02:13 +0100
Subject: [Buildroot] [PATCH next] uclibc: update to 1.0.29
In-Reply-To: <20180304101726.GA1833@waldemar-brodkorb.de>
References: <20180304101726.GA1833@waldemar-brodkorb.de>
Message-ID: <20180304230213.2858266d@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 4 Mar 2018 11:17:26 +0100, Waldemar Brodkorb wrote:
> This release adds a lot of bugfixes for x86_64 and aarch64.
> It allows to compile and use more desktop applications.
> For this gettext-tiny was integrated, but unfortunately it
> fails to build in the context of buildroot, so I have to
> disable UCLIBC_HAS_LIBINTL until this is fixed.

Disabling the libintl stub is going to break a *lot* of things in
Buildroot. Last summer, we did a major revamp of the gettext handling,
and one of the key thing that allowed this cleanup was the availability
of a libintl stub in uClibc.

Therefore, until UCLIBC_HAS_LIBINTL is fixed, I don't think we can
merge this bump, unless I missed something of course.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
