From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 08 Feb 2017 09:46:24 +0100
Subject: [Buildroot] [PATCH] bash: add upstream security fixes to patch
	level 12
In-Reply-To: <20170208081203.15945-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Wed, 8 Feb 2017 09:12:03 +0100")
References: <20170208081203.15945-1-peter@korsgaard.com>
Message-ID: <87tw85oysf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes CVE-2017-5932 - Shell code execution on tab completion of specially
 > crafted files. For details, see the report:

 > https://github.com/jheyens/bash_completion_vuln/raw/master/2017-01-17.bash_completion_report.pdf

 > We unfortunately cannot easily download these because of the file names (not
 > ending in patch) and patch format (p0), so convert to p1 format and include
 > in package/bash with the following script:

 > for i in 06 07 08 09 10 11 12; do
 > 	cat > bash44-0$i.patch << EOF
 > From https://ftp.gnu.org/gnu/bash/bash-4.4-patches/bash44-0$i

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

 > EOF
 > 	curl https://ftp.gnu.org/gnu/bash/bash-4.4-patches/bash44-0$i | \
 > 		sed -e 's|^\*\*\* \.\./|*** |' -e 's|^--- |--- b/|' >> bash44-0$i.patch
 > done

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
