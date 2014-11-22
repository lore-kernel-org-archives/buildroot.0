From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Nov 2014 19:06:00 +0100
Subject: [Buildroot] [PATCH 1/1] Disable sample xerces
In-Reply-To: <1416499328-13083-1-git-send-email-damien@kal-host.com>
References: <1416499328-13083-1-git-send-email-damien@kal-host.com>
Message-ID: <20141122190600.291a90c9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Damien Lanson,

Thanks for your contribution!

On Thu, 20 Nov 2014 17:02:08 +0100, Damien Lanson wrote:

> New try to send a patch with git send-email. This patch remove building and
> installing sample for xerces. If it's good, I have other patch to remove
> building and/or installing of sample or example or dev file in some package.

Unfortunately, this is not good yet to be applied. When you do a "git
format-patch", you should send the patch unchanged with "git
send-email". Or if you want to make some comments, do them below the
"---" sign. Right now, from the point of view of git, the description
of your patch is the personal message "New try to send a patch ...".

Basically, your process to send the patch should be:

	git format-patch HEAD^
	git send-email 0001-....patch

Also, while your patch certainly works, it would be good to have a
solution that can potentially be submitted upstream, by patching
configure.ac to provide a --enable-samples/--disable-samples option.

It's also a good idea to add a small commit log to explain why this
commit is needed. And finally, the title of your commit should be:

	xerces: disable the build of samples

i.e, it should always have "<pkg>: " as a prefix.

Can you resend an updated version of your patch with those changes?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
