From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 21 Feb 2019 13:54:29 +0100
Subject: [Buildroot] [PATCH] utils/scanpypi: protect against zip-slip
 vulnerability in zip/tar handling
In-Reply-To: <20190211222202.10786-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Mon, 11 Feb 2019 23:22:02 +0100")
References: <20190211222202.10786-1-peter@korsgaard.com>
Message-ID: <87d0nls3ne.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > For details, see https://github.com/snyk/zip-slip-vulnerability
 > Older python versions do not validate that the extracted files are inside
 > the target directory.  Detect and error out on evil paths before extracting
 > .zip / .tar file.

 > Given the scope of this (zip issue was fixed in python 2.7.4, released
 > 2013-04-06, scanpypi is only used by a developer when adding a new python
 > package), the security impact is fairly minimal, but it is good to get it
 > fixed anyway.

 > Reported-by: Bas van Schaik <security-reports@semmle.com>
 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2018.02.x and 2018.11.x, thanks.

-- 
Bye, Peter Korsgaard
