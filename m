From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 09 Aug 2011 16:18:36 +0200
Subject: [Buildroot] util-linux compile problems
In-Reply-To: <1312883451.1593.3.camel@sven> (Sven Neumann's message of "Tue,
 09 Aug 2011 11:50:49 +0200")
References: <1312804690-21977-1-git-send-email-s.neumann@raumfeld.com>
 <87fwlblqxr.fsf@macbook.be.48ers.dk>
 <87y5z3k92i.fsf@macbook.be.48ers.dk> <1312883451.1593.3.camel@sven>
Message-ID: <87hb5qk6rn.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sven" == Sven Neumann <s.neumann@raumfeld.com> writes:

Hi,

 Sven> Well, it works for me in that configuration as well. But it
 Sven> doesn't work for the configuration that has locale support
 Sven> enabled and gettext/libintl:

 Sven> BR2_ENABLE_LOCALE=y
 Sven> BR2_NEEDS_GETTEXT=y
 Sven> BR2_NEEDS_GETTEXT_IF_LOCALE=y
 Sven> BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
 Sven> BR2_PACKAGE_GETTEXT=y
 Sven> BR2_PACKAGE_LIBINTL=y

 Sven> I've tried the following patch, but it doesn't seem to help:

Ahh, ok - That's easy to fix, similar to how we do it E.G. with
avahi. I've committed a fix doing that.

-- 
Bye, Peter Korsgaard
