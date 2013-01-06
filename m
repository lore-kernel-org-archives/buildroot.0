From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 06 Jan 2013 21:43:13 +0100
Subject: [Buildroot] [pull request] Pull request for branch
	pre-built-packages
In-Reply-To: <cover.1356797653.git.thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sat, 29 Dec 2012 17:14:47 +0100")
References: <cover.1356797653.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87mwwmf3fi.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Hello,
 Thomas> Recently, we have had a number of users having issues with external
 Thomas> toolchains because those are built for 32 bits Linux, and most
 Thomas> developers know use 64 bits build machines. The error message such
 Thomas> users get so far is very cryptic "Cannot execute cross-compiler".

 Thomas> So, this set of patches adds a small infrastructure in the form of a
 Thomas> Kconfig option and a check in dependencies.sh. The Kconfig option
 Thomas> allows packages to tell whether they need 32 bits compatibility
 Thomas> libraries, and the check in dependencies.sh verifies that those
 Thomas> libraries are installed (simply by checking the presence of the 32
 Thomas> bits dynamic loader).

 Thomas> Then, all pre-built external toolchains as well as the sam-ba tool are
 Thomas> modified to use this mechanism.

 Thomas> As a preliminary patch, all the pre-built external toolchains are
 Thomas> changed to be visible only if the host architecture is x86 or x86-64.

The microblaze ext toolchains are 64bit, so I've fixed that up and
committed the series, thanks.

-- 
Bye, Peter Korsgaard
