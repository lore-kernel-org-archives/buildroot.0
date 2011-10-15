From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 15 Oct 2011 23:01:17 +0200
Subject: [Buildroot] [PATCH 1/1] dependencies: additional check for
	PERL_MM_OPT
In-Reply-To: <099241d4a1d158c57663ffbeb12c34aa1ad2f58a.1318578597.git.thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Fri, 14 Oct 2011 09:50:02 +0200")
References: <cover.1318578597.git.thomas.petazzoni@free-electrons.com>
 <cover.1318578597.git.thomas.petazzoni@free-electrons.com>
 <099241d4a1d158c57663ffbeb12c34aa1ad2f58a.1318578597.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87obxirmua.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> When the user has Perl local::lib installed, its environment contains
 Thomas> a PERL_MM_OPT variables which defines
 Thomas> INSTALL_BASE="/some/location". Unfortunately, having this makes the
 Thomas> build of libxml-parser-perl (and probably other Perl related packages)
 Thomas> fail, because it complains that both PREFIX (passed in our .mk file)
 Thomas> and INSTALL_BASE (passed from the PERL_MM_OPT environment variable)
 Thomas> are defined. Since in Buildroot we want our PREFIX to be considered,
 Thomas> we error out when the user has PERL_MM_OPT defined.

Committed, thanks.

-- 
Bye, Peter Korsgaard
