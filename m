From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 07 Apr 2020 17:59:19 +0200
Subject: [Buildroot] [PATCH 1/1] package/tslib: fix build with headers
 >= 4.16
In-Reply-To: <20200311201749.374631-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 11 Mar 2020 21:17:49 +0100")
References: <20200311201749.374631-1-fontaine.fabrice@gmail.com>
Message-ID: <87blo3qobs.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fixes:
 >  - http://autobuild.buildroot.org/results/bc8bc3f1d88f3b64765025fee7f941d30a81ee46

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

I was about to backport this to all the stable branches but I started
wondering why it hasn't triggered before giving that 4.16 is so old.

Digging further, I see this new kernel definition is only used if
__USE_TIME_BITS64 is defined by the C library, which is only the case
for the recently introduced musl 1.2.0.

But OK, the change is fairly small and people could end up using an
external musl 1.2.x based toolchain with the LTS branch, so I've applied
to 2020.02.x. (including the followup fix).

-- 
Bye, Peter Korsgaard
