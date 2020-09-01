From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 01 Sep 2020 20:14:52 +0200
Subject: [Buildroot] [PATCH] package/python-django: security bump to
 version 3.0.10
In-Reply-To: <20200901142222.13132-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Tue, 1 Sep 2020 16:22:22 +0200")
References: <20200901142222.13132-1-peter@korsgaard.com>
Message-ID: <87imcx9xer.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issues:
 > CVE-2020-24583: Incorrect permissions on intermediate-level directories on Python 3.7+
 > On Python 3.7+, FILE_UPLOAD_DIRECTORY_PERMISSIONS mode was not applied to
 > intermediate-level directories created in the process of uploading files and
 > to intermediate-level collected static directories when using the
 > collectstatic management command.

 > You should review and manually fix permissions on existing
 > intermediate-level directories.

 > CVE-2020-24584: Permission escalation in intermediate-level directories of
 > the file system cache on Python 3.7+
 > On Python 3.7+, the intermediate-level directories of the file system cache
 > had the system?s standard umask rather than 0o077 (no group or others
 > permissions).

 > https://docs.djangoproject.com/en/dev/releases/3.0.10/

 > In addition, 3.0.8..10 contains a number of bugfixes.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
