From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun, 01 Apr 2018 17:40:42 -0300
Subject: [Buildroot] [PATCH] check-package: support symlinks to the
 script
References: <20180401200516.21064-1-arnout@mind.be>
Message-ID: <5ac143ca7881c_68702ad20ef91810867b9@ultri4.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, Apr 01, 2018 at 05:05 PM, Arnout Vandecappelle (Essensium/Mind) wrote:

> The check-package script finds base_dir (= the Buildroot directory) and
> cd's into it. To be able to support relative paths as arguments, it
> first recalculates the arguments relative to base_dir.
> 
> However, if there is a symlink anywhere on the path to the
> check-package script, the relative paths will be wrong. To solve this,
> use realpath() instead of abspath(), so symlinks are resolved before
> calculating the relative path.
> 
> Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Acked-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>

Sorry. I forgot about this use case.
Thank you for fixing it.


Regards,
Ricardo
