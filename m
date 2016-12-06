From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 06 Dec 2016 14:20:29 +0100
Subject: [Buildroot] [git commit] arch/Config.in.arm: add Cortex-A57 and
	Cortex-A72
In-Reply-To: <20161205221749.B2CD87FEC4@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Mon, 5 Dec 2016 23:07:14 +0100")
References: <20161205221749.B2CD87FEC4@busybox.osuosl.org>
Message-ID: <87pol5jisi.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=2131f1b3817d594ce24ac9ba263f104077cf7c49
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Add two popular ARM64 cores to the list of supported cores: Cortex-A57
 > and Cortex-A72.

Hmm, do old toolchains know about these cores?

Looking around in gcc.git, it seems like they were added:

a53/a57 in 4.8 for aarch64 / 4.9 for arm
a72 in 5.1 for aarch64/arm

So we need to ensure the older gcc versions cannot be selected when
these variants are selected. We possibly also need to do something for
external toolchains.

-- 
Bye, Peter Korsgaard
