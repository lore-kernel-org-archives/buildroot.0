From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 12 Dec 2020 11:46:28 +0100
Subject: [Buildroot] [PATCH] package/docker-containerd: security bump to
 version 1.4.3
In-Reply-To: <20201201222346.5039-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Tue, 1 Dec 2020 23:23:46 +0100")
References: <20201201222346.5039-1-peter@korsgaard.com>
Message-ID: <87wnxnnvy3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issue:
 > - CVE-2020-15257: Access controls for the shim?s API socket verified that
 >   the connecting process had an effective UID of 0, but did not otherwise
 >   restrict access to the abstract Unix domain socket.  This would allow
 >   malicious containers running in the same network namespace as the shim,
 >   with an effective UID of 0 but otherwise reduced privileges, to cause new
 >   processes to be run with elevated privileges.

 > For more details, see the advisory:
 > https://github.com/containerd/containerd/security/advisories/GHSA-36xw-fx78-c5r4

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2020.02.x and 2020.08.x, thanks.

-- 
Bye, Peter Korsgaard
