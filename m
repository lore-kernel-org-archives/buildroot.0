From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 09 Mar 2013 21:07:31 +0100
Subject: [Buildroot] [PATCH] pcre: always enable the 8-bits version
In-Reply-To: <1362840035-9883-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sat, 9 Mar 2013 15:40:35 +0100")
References: <1362840035-9883-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87ip502v7g.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Commit 7154798a461a8b2c (pcre: add support for 16 bits and 32 bits
 Thomas> variants), added in preparation to the introduction of the Qt5
 Thomas> packages, could break other packages that use pcre.

 Thomas> Even though by default the pcre 8 bits library is selected if no other
 Thomas> variant is selected, a randpackageconfig, or an user, could
 Thomas> potentially enable the 16 bits variant even if a package requires the
 Thomas> 8 bits variant.

 Thomas> This has caused a number of build breakage on packages like ngrep,
 Thomas> cegui, nmap and others in the autobuilders.

 Thomas> In older to solve this, we simply unconditionally build the 8-bits
 Thomas> variant. Since each variant is only ~90k in size, it's probably not
 Thomas> worth the effort giving the possibility of building the 16 bits
 Thomas> variant only.

Committed, thanks.

-- 
Bye, Peter Korsgaard
