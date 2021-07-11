From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 11 Jul 2021 19:23:41 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/gesftpserver: Fix
 per-package build without Python
In-Reply-To: <20210626150516.41f5ccd8@windsurf> (Thomas Petazzoni's message of
 "Sat, 26 Jun 2021 15:05:16 +0200")
References: <20210624123237.23997-1-anaumann@ultratronik.de>
 <20210626150516.41f5ccd8@windsurf>
Message-ID: <875yxgzrvm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > On Thu, 24 Jun 2021 14:32:37 +0200
 > Andreas Naumann <anaumann@ultratronik.de> wrote:

 >> When building per-package in an environment without Python, the gesftpserver
 >> configure script dies when looking for Python support.
 >> The configure script is happy (doesnt check and wont error out) when being
 >> told that Python is not available, so we hack around this by setting the
 >> appropriate env variable.
 >> 
 >> Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>

 > Thanks, but the issue is not at all related to per-package. In an
 > environment without Python, gesftpserver fails to build, even with
 > BR2_PER_PACKAGE_DIRECTORIES disabled.

 > So I've applied after rewriting the commit log, and adding a comment
 > inside the .mk file.

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
