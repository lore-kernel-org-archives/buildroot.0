From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 8 Apr 2015 22:42:05 +0200
Subject: [Buildroot] [PATCH UNTESTED] autobuild-run: handle failed
 network connection
In-Reply-To: <1428525283-8015-1-git-send-email-patrickdepinguin@gmail.com>
References: <1428525283-8015-1-git-send-email-patrickdepinguin@gmail.com>
Message-ID: <20150408224205.25c254c2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Wed,  8 Apr 2015 22:34:43 +0200, Thomas De Schampheleire wrote:
> From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> 
> Due to a network failure, checking of the autobuild-run version or
> obtaining the toolchain configurations could fail, causing the instance to
> stop with an exception (and not restarting automatically).
> 
> Fix this scenario by catching such errors and continuing with a new build.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Thanks for quickly proposing a patch for this! But I'm wondering if we
shouldn't instead fix the main autobuild-run process (which starts the
subprocesses) to read the exit code of its subprocesses, and restart
them if they fail. This would allow to make sure the subprocesses
continue to run, regardless of the reason for which they failed.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
