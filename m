From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 25 Mar 2019 21:20:19 +0100
Subject: [Buildroot] [PATCH] package/bash: add upstream patches up to
 patch level 23
In-Reply-To: <20190313093955.27965-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Wed, 13 Mar 2019 10:39:55 +0100")
References: <20190313093955.27965-1-peter@korsgaard.com>
Message-ID: <87zhpik8os.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > We unfortunately cannot easily download these because of the file names (not
 > ending in patch) and patch format (p0), so convert to p1 format and include
 > in package/bash with the following script:

 > j=1; for i in 19 20 21 22 23; do
 >     file=$(printf '%04d-patch44-0%d.patch' $j $i)
 >     cat > $file << EOF
 > From https://ftp.gnu.org/gnu/bash/bash-4.4-patches/bash44-0$i

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

 > EOF
 >     curl https://ftp.gnu.org/gnu/bash/bash-4.4-patches/bash44-0$i | \
 >         sed -e 's|^\*\*\* \.\./|*** |' -e 's|^--- |--- b/|' >> $file

 >     j=$(( j + 1 ))
 > done

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2019.02.x, thanks.

-- 
Bye, Peter Korsgaard
