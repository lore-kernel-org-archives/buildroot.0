From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 15 Oct 2016 19:48:48 +0200
Subject: [Buildroot] [PATCH] package/kodi: needs .py modules
In-Reply-To: <1476547851-30531-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sat, 15 Oct 2016 18:10:51 +0200")
References: <1476547851-30531-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <878ttpa4fz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Kodi segfaults as soon as it tries to load a python module:

 >     Could not find platform independent libraries <prefix>
 >     Consider setting $PYTHONHOME to <prefix>[:<exec_prefix>]
 >     ImportError: No module named site
 >     Segmentation fault

 > Turns out that keeping .py modules (with or without .pyc) fixes the
 > issue.

 > Currently, Kodi selects python, but since the format of modules is a
 > choice, we can not select it.

 > Fix that by inverting the dependency on python from Kodi:
 >   - turn it into a depends rather than a select,
 >   - add the dependency to ! pyc-only
 >   - update the comment accordingly.

 > In addition, the !MMU and !static dependencies are updated since they
 > are no longer needed for Python (we now depend on it rather than
 > selecting it), but for other packages. The !MMU dependency is moved to
 > the _ARCH_SUPPORTS symbol as well.

 > Also, we can no longer "select BR2_PACKAGE_SAMBA4", because samba4
 > selects python, and we can no longer select python. Therefore, we switch
 > to a "depends on" dependency for samba4, which is fine as a user willing
 > to use Kodi with Samba will certainly realize that Samba should be
 > enabled.

 > Fixes bug #9221.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > [Thomas:
 >  - update on latest master
 >  - take care of the !MMU/!static dependencies.
 >  - take care of the samba4 problem.]
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
