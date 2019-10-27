From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 27 Oct 2019 11:40:55 +0100
Subject: [Buildroot] [PATCH 1/1] package/softether: bump to version
 4.30-9700-beta
In-Reply-To: <20191027095600.16937-1-fontaine.fabrice@gmail.com>
References: <20191027095600.16937-1-fontaine.fabrice@gmail.com>
Message-ID: <20191027114055.1195414d@windsurf.dhcp.lyon.intranet>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 27 Oct 2019 10:56:00 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Update first patch

Why is the first patch still there, since it is a patch from upstream ?
I would have expected it to go away ?

Also, your patch overall doesn't apply:

$ git pwam 1184954
Applying patch #1184954 using "git am -s"
Description: [1/1] package/softether: bump to version 4.30-9700-beta
Applying: package/softether: bump to version 4.30-9700-beta
error: patch failed: package/softether/0010-Encrypt-set-default-RSA-key-size-to-1024-everywhere-.patch:1
error: package/softether/0010-Encrypt-set-default-RSA-key-size-to-1024-everywhere-.patch: patch does not apply
Patch failed at 0001 package/softether: bump to version 4.30-9700-beta
hint: Use 'git am --show-current-patch' to see the failed patch
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".
'git am' failed with exit status 128

It is probably not your fault, if I remember correctly, there are some
DOS-style newlines in softether that always cause problems. Could you
push your patch somewhere in a Git branch, so that I can pick it up
directly ?

Note that I will apply Matt's patch that drops the "v" prefix, so if
you could rebase on that, it would be nice.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
