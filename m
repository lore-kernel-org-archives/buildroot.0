From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 15 Jun 2018 13:14:16 +0200
Subject: [Buildroot] [PATCH] autossh: fix manual set of ssh path
In-Reply-To: <20180614190022.vwi5uhvcskp253mt@tarshish> (Baruch Siach's
 message of "Thu, 14 Jun 2018 22:00:22 +0300")
References: <48dfa0b109e0ae3b807a77444106a0aa6d8768d6.1529001528.git.baruch@tkos.co.il>
 <20180614190022.vwi5uhvcskp253mt@tarshish>
Message-ID: <878t7g47zr.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Hi List,
 > On Thu, Jun 14, 2018 at 09:38:48PM +0300, Baruch Siach wrote:
 >> The configure script that is bundled with autossh does not generate the
 >> correct code for the AC_ARG_WITH() macro of --with-ssh. As a result, the
 >> configure scripts always check the host location, and fails with ssh is
 >> not found.
 >> 
 >> Restore the autoreconf that has been removed in the last bump to fix the
 >> --with-ssh configure option.
 >> 
 >> Fixes:
 >> http://autobuild.buildroot.net/results/25d/25d681f9df22c07cdf5a6b8756bfc2d5ecf36247/
 >> http://autobuild.buildroot.net/results/f0a/f0ae62d0ed6bac011c507cfea7cd7157671baf39/
 >> http://autobuild.buildroot.net/results/b15/b1546bb3e861c14771bdd03cda9ce2e9176a2069/
 >> 
 >> Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
 >> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
 >> ---
 >> package/autossh/autossh.mk | 1 +
 >> 1 file changed, 1 insertion(+)
 >> 
 >> diff --git a/package/autossh/autossh.mk b/package/autossh/autossh.mk
 >> index 1538a4c8bcfb..9b0df3a34b4a 100644
 >> --- a/package/autossh/autossh.mk
 >> +++ b/package/autossh/autossh.mk
 >> @@ -9,6 +9,7 @@ AUTOSSH_SITE = http://www.harding.motd.ca/autossh
 >> AUTOSSH_SOURCE = autossh-$(AUTOSSH_VERSION).tgz
 >> AUTOSSH_LICENSE = Modified BSD
 >> AUTOSSH_LICENSE_FILES = autossh.c

 > I forgot to add a comment here. Should be something like

 > # Fix AC_ARG_WITH code generation for --with-ssh

Committed after adding this comment, thanks.

-- 
Bye, Peter Korsgaard
