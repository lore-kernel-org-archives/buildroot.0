From: Samuel Martin <s.martin49@gmail.com>
Date: Wed, 13 Sep 2017 20:55:19 +0200
Subject: [Buildroot] [PATCH] package/lzo: Set CMAKE_INSTALL_LIBDIR for
 host variant explicitly
In-Reply-To: <20170913173724.6157-1-andrew.smirnov@gmail.com>
References: <20170913173724.6157-1-andrew.smirnov@gmail.com>
Message-ID: <CAHXCMMKe5KiGHCP4H4vBMj+kzpFOTDgE5HBWDTJHLOGpFaR9Uw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Andrey,

On Wed, Sep 13, 2017 at 7:37 PM, Andrey Smirnov
<andrew.smirnov@gmail.com> wrote:
> Building host-lzo on 64-bit Fedora 26 ends up with library files
> installed into $(HOST_DIR)/lib64 instead of $(HOST_DIR)/lib where
> other packages (at least host-mtd) depending on it would look for it
> (resulting in build failures). Fix that by specifying the directory to
> be lib/ explicitly.
>
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>

Acked-by: Samuel Martin <s.martin49@gmail.com>

> ---
>
> I suspect this might not be the best solution for this problem, but it
> is a good starting point to discuss what might be and that's why I
> submitted this patch anyway.

Indeed the infra could certainly create the symlink $(HOST_DIR)/lib64
-> lib (or  $(HOST_DIR)/lib32 -> lib).


Regards,

-- 
Samuel
