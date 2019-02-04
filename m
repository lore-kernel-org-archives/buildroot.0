From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 04 Feb 2019 18:07:12 +0100
Subject: [Buildroot] [PATCH v5] package/pamtester: new package
In-Reply-To: <1549290835-14995-1-git-send-email-matthew.weber@rockwellcollins.com>
 (Matt Weber's message of "Mon, 4 Feb 2019 08:33:55 -0600")
References: <1549290835-14995-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <87lg2vtrcv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Matt" == Matt Weber <matthew.weber@rockwellcollins.com> writes:

 > From: Carlos Santos <casantos@datacom.com.br>
 > Utility for testing pluggable authentication modules (PAM) facility.

 > While specifically designed to help PAM module authors to test their
 > modules, that might also be handy for system administrators interested
 > in building a centralised authentication system using common standards
 > such as NIS, SASL and LDAP.

 > One patch was included from the Debian bugtracker which fixes a
 > spelling error.

I still don't understand why we need to carry such patch.

 > Signed-off-by: Carlos Santos <casantos@datacom.com.br>
 > Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
 > ---
 > Changes
 > v4 -> v5
 >  - fixed title of patch to be package/
 >  - Added signed-offs in Debian patch
 >  - Added license file hash
 >  - Spelling of pamtester in kconfig comment
 >  - DEVELOPERS entry needed fixup
 > ---

 > +++ b/package/pamtester/Config.in
 > @@ -0,0 +1,15 @@
 > +config BR2_PACKAGE_PAMTESTER
 > +	bool "pamtester"
 > +	depends on BR2_PACKAGE_LINUX_PAM
 > +	help
 > +	  A tiny utility for testing pluggable authentication modules
 > +	  (PAM) facility. While specifically designed to help PAM module
 > +	  authors to test their modules, that might also be handy for
 > +	  system administrators interested in building a centralised
 > +	  authentication system using common standards such as NIS, SASL
 > +	  and LDAP.
 > +
 > +	  http://pamtester.sourceforge.net/
 > +
 > +comment "pamtester depends on linux-pam"
 > +	depends on !BR2_PACKAGE_LINUX_PAM

I'm not sure this comment is really helpful, but OK.

Committed with the spelling fix patch dropped, thanks.

-- 
Bye, Peter Korsgaard
