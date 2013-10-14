From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 14 Oct 2013 13:23:08 +0200
Subject: [Buildroot] [PATCHv2] toolchain-external: add a specific check
	to avoid Angstrom toolchains
In-Reply-To: <1381652900-12516-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 13 Oct 2013 10:28:20 +0200")
References: <1381652900-12516-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <878uxwrt9f.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> The Angstrom toolchains available at
 Thomas> http://www.angstrom-distribution.org/toolchains/ are not usable as
 Thomas> external toolchains in Buildroot, because they are not pure toolchains
 Thomas> with just the C library, but instead complete SDKs with many
 Thomas> cross-compiled libraries (Gtk, Qt, glib, neon, sqlite, X.org, and many
 Thomas> more, approximately 200 MB of libraries).

 Thomas> Buildroot cannot use such toolchains, and while this is documented in
 Thomas> our manual, some users still try to do this. Today, one such user came
 Thomas> on the IRC channel, reporting a build problem, which we started
 Thomas> investigating, only to realize after a long time that he was using an
 Thomas> Angstrom toolchain.

 Thomas> To avoid this problem in the future, we explicitly check if the
 Thomas> toolchain is from Angstrom by looking at the vendor part of the tuple
 Thomas> exposed by the toolchain: as soon as it is
 Thomas> <something>-angstrom-<something-else>, we reject the toolchain with an
 Thomas> explanation.

 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
