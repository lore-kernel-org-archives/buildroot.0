From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 02 Jan 2012 14:57:41 +0100
Subject: [Buildroot] [PATCH v3] Add package for Gnome NetworkManager
In-Reply-To: <1322827989-25501-1-git-send-email-zonque@gmail.com> (Daniel
 Mack's message of "Fri, 2 Dec 2011 13:13:09 +0100")
References: <4ED8C00D.7070004@gmail.com>
 <1322827989-25501-1-git-send-email-zonque@gmail.com>
Message-ID: <87hb0e2omi.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Daniel" == Daniel Mack <zonque@gmail.com> writes:

 Daniel> Even though it's most commonly used on desktops, this piece of software
 Daniel> also works well on embedded devices.

 Daniel> The package file only resolved mandatory dependencies. Things like
 Daniel> iptables and dnsmasq are only required if 'shared' connections are used,
 Daniel> and have hence not been made hard prerequisites.

 Daniel> There are probably too many i18n related files installed to the target.
 Daniel> That might need some more tweaking.

Committed with some modifications, thanks.

uClibc doesn't have backtrace support by default, so we need to build
with --disable-crashtrace, and a patch was needed (sent upstream) to
ensure execinfo.h wasn't used in that config. It furthermore depends on
IPv6 support in toolchain, and ended up using the host libgcrypt-config
if available.

-- 
Bye, Peter Korsgaard
