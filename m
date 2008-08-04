From: Wade Berrier <wberrier@gmail.com>
Date: Mon, 4 Aug 2008 10:35:37 -0600
Subject: [Buildroot] [PATCH] fix bash job control (was: my /etc/init.d/rcS
	won't run)
Message-ID: <bbbeeccd0808040935o2c32c231q7af8e9e9a15e353b@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Marc from the previous thread pointed me in the right direction to fix this.

Attached is a patch to bash.mk so it builds correctly and can be used
from busybox's init.

(To create the patch, I built bash on my linux desktop to generate a
config.log.  Then I went through bash's aclocal.m4 to see which
options were skipped when cross compiling.  Anything that didn't match
up with my desktop's config.log I manually forced in bash.mk).

Thanks,

Wade
