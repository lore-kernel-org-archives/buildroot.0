From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 20 Mar 2012 09:46:48 +0100
Subject: [Buildroot] [PATCH 2/6] Add the systemd package
In-Reply-To: <4F68416B.50604@free-electrons.com> (Maxime Ripard's message of
 "Tue, 20 Mar 2012 09:35:55 +0100")
References: <cover.1332172636.git.maxime.ripard@free-electrons.com>
 <5edd6acafdb19b900e0bdb3eaf6f0796695ad09f.1332172636.git.maxime.ripard@free-electrons.com>
 <201203200032.19236.arnout@mind.be>
 <4F68416B.50604@free-electrons.com>
Message-ID: <87mx7blkw7.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Maxime" == Maxime Ripard <maxime.ripard@free-electrons.com> writes:

Hi,

 Maxime> Probably. I'll send a patch and see how it turns out.
 Maxime> In the meantime, maybe I can just put a patch here instead of
 Maxime> the whole file.

Or just run sed s/agetty/getty/g when you copy it to TARGET_DIR.

I'm trying to get systemd to build under uClibc, which so far meant I
had to bump the default to 0.9.33 (for new CLONE_* flags) and enable
utmpx support. Systemd also needs IPv6 support so needs to have a

depends on BR2_INET_IPV6

Line.

I'm still rebuilding my toolchain at the moment, but if you could resend
the patch with those fixes in the near future, that would be great.

-- 
Bye, Peter Korsgaard
