From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 26 Nov 2020 17:06:32 +0100
Subject: [Buildroot] [PATCH 1/1] package/linux-pam: security bump to
 version 1.5.1
In-Reply-To: <20201126192950.135871-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Thu, 26 Nov 2020 20:29:50 +0100")
References: <20201126192950.135871-1-fontaine.fabrice@gmail.com>
Message-ID: <87v9dsrtkn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix CVE-2020-27780 - authentication bypass when a user doesn't exist and
 > root password is blank

 > https://github.com/linux-pam/linux-pam/releases/tag/v1.5.1

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 >  package/linux-pam/linux-pam.hash | 4 ++--
 >  package/linux-pam/linux-pam.mk   | 2 +-
 >  2 files changed, 3 insertions(+), 3 deletions(-)

 > diff --git a/package/linux-pam/linux-pam.hash b/package/linux-pam/linux-pam.hash
 > index 15e67a5e4c..10cd7be9c4 100644
 > --- a/package/linux-pam/linux-pam.hash
 > +++ b/package/linux-pam/linux-pam.hash
 > @@ -1,6 +1,6 @@
 >  # Locally computed hashes after checking signature at
 > -# https://github.com/linux-pam/linux-pam/releases/download/v1.5.0/Linux-PAM-1.5.0.tar.xz.asc
 > +# https://github.com/linux-pam/linux-pam/releases/download/v1.5.1/Linux-PAM-1.5.1.tar.xz.asc
 >  # signed with the key 8C6BFD92EE0F42EDF91A6A736D1A7F052E5924BB
 > -sha256  02d39854b508fae9dc713f7733bbcdadbe17b50de965aedddd65bcb6cc7852c8  Linux-PAM-1.5.0.tar.xz
 > +sha256  201d40730b1135b1b3cdea09f2c28ac634d73181ccd0172ceddee3649c5792fc  Linux-PAM-1.5.1.tar.xz
 >  # Locally computed
 >  sha256  133d98e7a2ab3ffd330b4debb0bfc10fea21e4b2b5a5b09de2e924293be5ff08  Copyright
 > diff --git a/package/linux-pam/linux-pam.mk b/package/linux-pam/linux-pam.mk
 > index 176830c1d3..61d9542c02 100644
 > --- a/package/linux-pam/linux-pam.mk
 > +++ b/package/linux-pam/linux-pam.mk
 > @@ -4,7 +4,7 @@
 >  #
 >  ################################################################################
 
 > -LINUX_PAM_VERSION = 1.5.0
 > +LINUX_PAM_VERSION = 1.5.1

Ehh, we only have 1.4.0 in master and next?

It would be good to notice that this security issue only exists in pam
1.5.0.

-- 
Bye, Peter Korsgaard
