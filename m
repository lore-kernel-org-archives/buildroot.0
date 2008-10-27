From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 27 Oct 2008 10:48:26 +0100
Subject: [Buildroot] [PATCH] libglib2: remove $(DISABLE_NLS) from
	configure options
In-Reply-To: <20081027103049.47ef9fd4@surf> (Thomas Petazzoni's message of
	"Mon\, 27 Oct 2008 10\:30\:49 +0100")
References: <200810250216.21072.markus.heidelberg@web.de>
	<87fxmjdt0t.fsf@macbook.be.48ers.dk>
	<200810270807.15968.markus.heidelberg@web.de>
	<87ej22bdu7.fsf@macbook.be.48ers.dk> <20081027103049.47ef9fd4@surf>
Message-ID: <87bpx6pdw5.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 >> Probably it's handled with the libintl stuff when !BR2_ENABLE_LOCALE.

 Thomas> Concerning libglib2 and iconv, I have the following workaround/patch in
 Thomas> my tree to disable pulling libiconv when !BR2_ENABLE_LOCALE. The
 Thomas> problem is that I'm using an external toolchain (having too many
 Thomas> troubles with buildroot-generated toolchains). Because the toolchain is
 Thomas> external, BR2_ENABLE_LOCALE is not set. But the toolchain already
 Thomas> contains libiconv, so I don't want to add it as a dependency. But the
 Thomas> following patch is just a workaround, I haven't thought about a proper
 Thomas> fix for now.

Yeah, we should probably figure out a proper way to set those uclibc
settings when using an external toolchain.

What problems do you have with the buildroot toolchains?

-- 
Bye, Peter Korsgaard
