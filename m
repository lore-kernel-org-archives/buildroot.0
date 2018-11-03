From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sat, 03 Nov 2018 19:49:04 -0300
Subject: [Buildroot] [PATCH 1/5] check-package: fix check of file in
 current dir with -b
References: <20181103045624.31059-2-ricardo.martincoski@gmail.com>
Message-ID: <5bde25e0211ca_661b3fbbac0f484c493e8@ultri5.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, Nov 03, 2018 at 01:56 AM, Ricardo Martincoski wrote:

> One of the possible usages of check-package is to first cd to the
> directory that contains the files to test (e.g. a package directory) and
> then call the script passing the files in the current dir.
> It already works when used for intree files, but for files in a
> br2-external it throws an exception because some check functions (from
> utils/checkpackagelib/lib_*.py) do need the name of the file being
> processed and assume there will be a slash before the name.
> 
> Notice RemoveDefaultPackageSourceVariable and TypoInPackageVariable lead
> to an exception in this case, but ApplyOrder instead generates a false
> warning.
> 
> Instead of fixing any check function that could lead to different
> behaviour when the script is called with -b for a file in the current
> directory, always use the absolute path of the file being checked when
> -b was passed. A small drawback is that the warning messages will occupy
> more columns in this case, but this approach is more future-proof as new
> check functions may also need to depend on the name of the file being
> processed.

I will rework this patch and resend, based on the feedback in [1].
I will mark v1 of the series as Changes Requested.

[1] http://lists.busybox.net/pipermail/buildroot/2018-November/234966.html


Regards,
Ricardo
