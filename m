From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 11 Nov 2014 21:47:11 +0100
Subject: [Buildroot] [PATCH] alsa-utils: fix linking with intl
In-Reply-To: <1415721082-15809-1-git-send-email-Vincent.Riera@imgtec.com>
 (Vicente Olivert Riera's message of "Tue, 11 Nov 2014 15:51:22 +0000")
References: <1415721082-15809-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <87ppctmpm8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:

 > alsa-utils needs to link with intl if the toolchain needs gettext and
 > locale is set. Otherwise we will see an error like this one:

 > option.o: In function `canonicalise_opt':
 > option.c:(.text+0x3bc): undefined reference to `libintl_gettext'

 > Fixes:
 >   http://autobuild.buildroot.net/results/276/276581f6dbbe330799c3a7eaa26b453e38a22907/

That autobuild link and the error message refers to an issue with
dnsmasq, but the patch seems OK so I've committed with a reference to
this autobuild issue instead:

http://autobuild.buildroot.net/results/707/707016a2490fc97b98d17e2b6a9c6423a56bb4a9/

-- 
Bye, Peter Korsgaard
