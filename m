From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 04 Nov 2012 12:52:10 +0100
Subject: [Buildroot] [PATCH 2/3] Split target/Config.in.arch into
	multiple Config.in.* in arch/
In-Reply-To: <c251b8520aca36ac7b0b0573a25cc7763d9a056a.1351967245.git.thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sat, 3 Nov 2012 19:27:59 +0100")
References: <cover.1351967245.git.thomas.petazzoni@free-electrons.com>
 <cover.1351967245.git.thomas.petazzoni@free-electrons.com>
 <c251b8520aca36ac7b0b0573a25cc7763d9a056a.1351967245.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87mwyxr3f9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> target/Config.in.arch had become too long, and we want to remove the
 Thomas> target/ directory. So let's move it to arch/ and split it this way:

 Thomas>  * An initial Config.in that lists the top-level architecture, and
 Thomas>    sources the arch-specific Config.in.<arch> files, as well as
 Thomas>    Config.in.common (see below)

 Thomas>  * One Config.in.<arch> per architecture, listing the CPU families,
 Thomas>    ABI choices, etc.

 Thomas>  * One Config.in.common that defines the gcc mtune, march, mcpu values
 Thomas>    and other hidden options.

Committed with the issues noted by Arnout fixed, thanks.

-- 
Bye, Peter Korsgaard
