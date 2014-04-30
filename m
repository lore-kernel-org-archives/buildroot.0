From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Wed, 30 Apr 2014 08:47:51 -0400
Subject: [Buildroot] [PATCH v2 1/2] ccache: change default cache
 directory path to match config setting
In-Reply-To: <CAAXf6LXG8LgqvoZHd0sza1A-1nv=MC22r-hBREOwsaozEM7dZQ@mail.gmail.com>
References: <1398826359-2711-1-git-send-email-danomimanchego123@gmail.com>
 <1398826359-2711-2-git-send-email-danomimanchego123@gmail.com>
 <CAAXf6LXG8LgqvoZHd0sza1A-1nv=MC22r-hBREOwsaozEM7dZQ@mail.gmail.com>
Message-ID: <CANxTyt5q=JoZjV1rfOuFGzagAwheWYM-U4m7HJD+xhNiwn+=Tw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Wed, Apr 30, 2014 at 4:49 AM, Thomas De Schampheleire
<patrickdepinguin@gmail.com> wrote:
> Note that the code you're patching is:
>
>         cache_dir = getenv("CCACHE_DIR");
>         if (cache_dir) {
>                 cache_dir = x_strdup(cache_dir);
>         } else {
>                 const char *home_directory = get_home_directory();
>                 if (home_directory) {
>                         cache_dir = format("%s/.ccache", home_directory);
>                 }
>         }
>
> Obtaining home_directory and checking it for non-NULL is actually no
> longer needed, as the cache_dir will become hardcoded. Moreover, using
> 'format' is also no longer needed.
> There is thus some redundant code here, but in my opinion it does not
> really hurt and using your patch as-is is preferred because it is more
> simple than reworking the code above.

Right - it was a choice of patching with a place-holder + sed or
sed-alone, and then simplest-sed-possible, or not.  So I opted for the
simplest change, in hopes that "simpler" translated to "easier to
review, test, and accept".

Thanks for reviewing, testing, etc.!

Danomi -
