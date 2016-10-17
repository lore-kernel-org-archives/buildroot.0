From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 17 Oct 2016 10:41:22 +0200
Subject: [Buildroot] [PATCH] linux-pam: backport build fix when crypt()
 is not part of crypt_libs
In-Reply-To: <1476692833-20087-1-git-send-email-jcmvbkbc@gmail.com>
References: <1476692833-20087-1-git-send-email-jcmvbkbc@gmail.com>
Message-ID: <20161017104122.71adb9d4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 17 Oct 2016 01:27:13 -0700, Max Filippov wrote:
> The build fails at pam_pwhistory.so linking step with the following
> message:
>   ld: cannot find -l-lintl
> This happens because the configure script incorrectly adds '-l' to LIBS
> when the crypt function is a part of libc.
> 
> Backport fix from the linux-pam mainline.
> Backported from: 01e0038fa55581c4afc9d63b6180d2ea77ba2940

Thanks for the patch. However I think this is already fixed, since the
bump to linux-pam 1.3.0, in commit
https://git.buildroot.org/buildroot/commit/?id=4882037d631012934ace1a6fe5f19ce66c2f3b68.

And indeed, since we merged this commit, the build issue doesn't occur
anymore.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
