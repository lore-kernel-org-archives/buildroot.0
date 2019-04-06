From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 06 Apr 2019 19:14:15 +0200
Subject: [Buildroot] [PATCH] fs/common.mk: disable real chown calls in
 fakeroot
In-Reply-To: <20190403201325.31664-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Wed, 3 Apr 2019 22:13:25 +0200")
References: <20190403201325.31664-1-peter@korsgaard.com>
Message-ID: <87imvrm4yg.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > fakeroot by default forwards {f,l,}chown calls to libc and ignores
 > permission issues, which may cause issues when building in restricted
 > environments like user namespaces as set up with bubblewrap where a chown
 > call with a uid/gid not mapped in the user namespace instead returns EINVAL.
 > This error is not masked by fakeroot and returned to the caller, causing
 > failures.

 > There is no real reason to really perform the *chown calls in the context of
 > Buildroot (as the calls will likely just fail and files are not accessed
 > outside the fakeroot environment any way).

 > This forwarding can be disabled by setting the FAKEROOTDONTTRYCHOWN
 > environment variable, so set it when fakeroot is executed.

 > Reported-by: Esben Nielsen <nielsen.esben@gmail.com>
 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
