From: Michael Nosthoff <buildroot@heine.tech>
Date: Wed, 21 Oct 2020 17:28:37 +0200
Subject: [Buildroot] [PATCH 1/4] package/libabseil-cpp: bump version to
 20200923.2
In-Reply-To: <20201021151839.31731-1-buildroot@heine.tech>
References: <20201021151839.31731-1-buildroot@heine.tech>
Message-ID: <331c90d0-8c60-c973-88bc-eafb74e4ca64@heine.tech>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On 21.10.2020 17:18, Michael Nosthoff via buildroot wrote:
> * removed patch 0003 as it is now in upstream
> * removed patch 0002 as the logic has been reworked
> * adjusted patch 0001 offset
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>

> diff --git a/package/libabseil-cpp/0002-absl-debugging-use-execinfo.h-only-when-available.patch b/package/libabseil-cpp/0002-absl-debugging-use-execinfo.h-only-when-available.patch
> deleted file mode 100644
> index dd40d4138f..0000000000
> --- a/package/libabseil-cpp/0002-absl-debugging-use-execinfo.h-only-when-available.patch
> +++ /dev/null

I decided to remove the patch after following your discussion with
upstream [0] and the change that followed it [1].

It now relies on __has_include which, as pointed out in the discussion,
works from gcc 4.9.2. And if __has_include isn't available it uses the
fallback.

Do you think this is sufficient? Or should we add a dependency on GCC >
4.9.2?

Regards,
Michael



[0] https://github.com/abseil/abseil-cpp/pull/746
[1]
https://github.com/abseil/abseil-cpp/commit/dc969f34a79d019497abb61c2a3f79b5b4be2ea9#diff-3ffc77d325a418b7d7b1663776b1d59f2c7562d83a3edb24cf22a6c2a5ac7f9a
