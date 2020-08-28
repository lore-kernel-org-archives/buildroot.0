From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Aug 2020 19:03:40 +0200
Subject: [Buildroot] [PATCH] package/chrony: security bump to version
 3.5.1
In-Reply-To: <20200821205105.733-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Fri, 21 Aug 2020 22:51:04 +0200")
References: <20200821205105.733-1-peter@korsgaard.com>
Message-ID: <87d03ar9cj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issues:
 > CVE-2020-14367: Insecure writing of pidfile
 > -------------------------------------------

 > When chronyd is configured to save the pidfile in a directory where the
 > chrony user has write permissions (e.g. /var/run/chrony - the default
 > since chrony-3.4), an attacker that compromised the chrony user account
 > could create a symbolic link at the location of the pidfile to make
 > chronyd starting with root privileges follow the symlink and write its
 > process ID to a file for which the chrony user doesn't have write
 > permissions, causing a denial of service, or data loss.

 > This issue was reported by Matthias Gerstner of SUSE.

 > For further details, see the oss-security posting:
 > https://www.openwall.com/lists/oss-security/2020/08/21/1

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2020.02.x and 2020.05.x, thanks.

-- 
Bye, Peter Korsgaard
