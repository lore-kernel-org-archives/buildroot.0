From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 08 Dec 2018 23:38:49 +0100
Subject: [Buildroot] [PATCH 1/1] libmpd: fix build with strndup
In-Reply-To: <20181208125815.5716-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 8 Dec 2018 13:58:15 +0100")
References: <20181208125815.5716-1-fontaine.fabrice@gmail.com>
Message-ID: <87d0qb3apy.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Retrieve a patch from upstream to include config.h otherwise build will
 > fail when trying to redefine strndup:
 > libmpd-internal.h:210:10: error: expected identifier or '(' before '__extension__'
 >  char *   strndup     (const char *s, size_t n);

 > Indeed, without an include on config.h, HAVE_STRNDUP won't be defined

 > Fixes:
 >  - http://autobuild.buildroot.org/results/a174818fa768b029d19b033139f9c5e0aaaed149

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
