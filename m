From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 07 Mar 2020 21:39:30 +0100
Subject: [Buildroot] [PATCH] linux/linux.mk: use HOST_MAKE_ENV rather
 than TARGET_MAKE_ENV
In-Reply-To: <20200131174940.12469-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Fri, 31 Jan 2020 18:49:39 +0100")
References: <20200131174940.12469-1-peter@korsgaard.com>
Message-ID: <87wo7vx5kt.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > While the kernel is built for the target, the build may need various host
 > libraries depending on config (and kernel version), so use HOST_MAKE_ENV
 > instead of TARGET_MAKE_ENV.

 > In particular, this ensures that our host-pkgconf will look for host
 > libraries and not target ones.

 > Fixes building scripts/dtc for Buildroot configurations enabling libyaml and
 > host-pkgconf for kernels after commit 067c650c45 (dtc: Use pkg-config to
 > locate libyaml).

 > With this enabled, we can drop the PKG_CONFIG_* variables for the
 > _NEEDS_HOST_LIBELF conditional, as those are included in HOST_MAKE_ENV.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2019.02.x and 2019.11.x, thanks.

-- 
Bye, Peter Korsgaard
