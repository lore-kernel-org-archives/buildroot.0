From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 09 Mar 2013 12:09:40 +0100
Subject: [Buildroot] [PATCH] autoconf: don't try to build Emacs files
In-Reply-To: <1362647902-13742-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Thu, 7 Mar 2013 10:18:22 +0100")
References: <1362647902-13742-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87a9qc4yob.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> When building autoconf for the target, we already passed EMACS="no" to
 Thomas> prevent autoconf from building Emacs mode files. But we weren't doing
 Thomas> that when building autoconf for the host. This causes problems when
 Thomas> 'emacs' is not really emacs, but a sort of clone like Jove. So we also
 Thomas> pass EMACS="no" when building host-autoconf to avoid autoconf
 Thomas> ./configure script from detecting emacs and then use it to build .elc
 Thomas> files from .el source code.

Committed, thanks.

-- 
Bye, Peter Korsgaard
