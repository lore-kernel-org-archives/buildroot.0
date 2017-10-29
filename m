From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Oct 2017 15:45:13 +0100
Subject: [Buildroot] [RESEND PATCH v4] libostree: new package
In-Reply-To: <p5pgcexorq.ln2@ID-313208.user.individual.net>
References: <20171029093756.23671-1-marcus.folkesson@gmail.com>
 <p5pgcexorq.ln2@ID-313208.user.individual.net>
Message-ID: <20171029154513.487050d8@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 29 Oct 2017 12:03:53 +0100, Bernd Kuhls wrote:
> Hi Marcus,

First of all Bernd, thanks a lot for your detailed review! Everything
is obviously correct in your review, and needs to be addressed by
Marcus. However, there is just one point that needs clarification.

> Please add openssl as optional dependency:
> 
> ifeq ($(BR2_PACKAGE_OPENSSL),y)
> LIBOSTREE_CONF_OPTS += --with-openssl
> LIBOSTREE_DEPENDENCIES += openssl
> else
> LIBOSTREE_CONF_OPTS += --without-openssl
> endif
> 
> Same for avahi, libarchive, libcurl, libsoup and systemd.

Adding support for optional dependencies is not a strict requirement,
as long as the corresponding features are explicitly disabled.

I.e, for each optional dependency, Marcus has the choice of:

 - Supporting it, by enabling the dependency if it's available in
   Buildroot

 - Disabling explicitly the optional dependency by passing the
   appropriate --disable-<foo>

Indeed, we don't want to ask our contributors to support all possible
optional dependencies. It might be a lot of work, and the contributor
may not necessarily care about such optional dependencies. Hence,
disabling a dependency explicitly is acceptable.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
