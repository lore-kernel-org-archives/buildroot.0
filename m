From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 23 Mar 2018 16:28:37 +0100
Subject: [Buildroot] [PATCH 1/2] efibootmgr: explicitly depend on
 host-pkgconf and popt
In-Reply-To: <20180323115343.45a24828@windsurf> (Thomas Petazzoni's message of
 "Fri, 23 Mar 2018 11:53:43 +0100")
References: <20180323095741.16512-1-peter@korsgaard.com>
 <20180323115343.45a24828@windsurf>
Message-ID: <87fu4q3j6i.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > Hello,
 > On Fri, 23 Mar 2018 10:57:40 +0100, Peter Korsgaard wrote:
 >> The efibootmgr build system uses host-pkgconf and popt, so explicitly add
 >> them to _DEPENDENCIES instead of relying on them getting pulled in by
 >> efivar.

 > Minor nit: if it's the efibootmgr *build system* that uses popt, then
 > one would expect to see a dependency on host-popt, not popt. I guess
 > it's not the *build system* that depends on popt, but efibootmgr
 > itself, no ?

Yes, the wording is maybe not super clear. What I meant is that the
Makefile (E.G. the build system) explicitly refers to pkg-config and
popt.

I'll reword and commit, thanks.

-- 
Bye, Peter Korsgaard
