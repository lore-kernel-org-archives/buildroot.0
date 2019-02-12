From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 12 Feb 2019 20:04:06 +0100
Subject: [Buildroot] [PATCH 2/2] package/runc: add upstream security fix
 for CVE-2019-5736
In-Reply-To: <20190212131504.28231-2-peter@korsgaard.com> (Peter Korsgaard's
 message of "Tue, 12 Feb 2019 14:15:04 +0100")
References: <20190212131504.28231-1-peter@korsgaard.com>
 <20190212131504.28231-2-peter@korsgaard.com>
Message-ID: <871s4cvnfd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > The vulnerability allows a malicious container to (with minimal user
 > interaction) overwrite the host runc binary and thus gain root-level
 > code execution on the host. The level of user interaction is being able
 > to run any command (it doesn't matter if the command is not
 > attacker-controlled) as root within a container in either of these
 > contexts:

 >   * Creating a new container using an attacker-controlled image.
 >   * Attaching (docker exec) into an existing container which the
 >     attacker had previous write access to.

 > For more details, see the advisory:

 > https://www.openwall.com/lists/oss-security/2019/02/11/2

 > The fix for this issue uses fexecve(3), which isn't available on uClibc, so
 > add a dependency on !uclibc to runc and propagate to the reverse
 > dependencies (containerd/docker-engine).

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
