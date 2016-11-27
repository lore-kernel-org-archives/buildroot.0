From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 27 Nov 2016 21:20:30 +0100
Subject: [Buildroot] [PATCH] fs/ubifs: work around fakeroot / sed -i
 issue on systems with SELinux enabled
In-Reply-To: <20161126234027.22300-1-peter@korsgaard.com>
References: <20161126234027.22300-1-peter@korsgaard.com>
Message-ID: <CACXmViYz8KYc4vy1rcPew8436X26GmEJpOW1nK7+As4BSiF__Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Nov 27, 2016 at 12:40 AM, Peter Korsgaard <peter@korsgaard.com> wrote:
> Fixes #9386
>
> GNU sed -i misbehaves on systems with SELinux enabled, as it tries to copy
> to the SELinux security context (xattr) from the source file to to the new
> destination file, which fails under fakeroot and leaves the file with 000
> permissions, causing ubinize to fail when it cannot read to configuration
> file.
>
> So as a workaround, combine the install and tweak steps in a single
> sed with a redirect to the destination file instead.
>
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

I will now revert the changes moving from fakeroot to pseudo.

-- 
Bye, Peter Korsgaard
