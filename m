From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 5 Aug 2016 09:46:08 +0200
Subject: [Buildroot] [PATCH 2/3] gcc: configs: rename
 BR2_EXTRA_GCC_CONFIG_OPTIONS
In-Reply-To: <1470349800-27521-2-git-send-email-pgynther@google.com>
References: <1470349800-27521-1-git-send-email-pgynther@google.com>
 <1470349800-27521-2-git-send-email-pgynther@google.com>
Message-ID: <20160805094608.137bfee1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  4 Aug 2016 15:29:59 -0700, Petri Gynther wrote:
> Rename BR2_EXTRA_GCC_CONFIG_OPTIONS to BR2_GCC_EXTRA_CONFIG_OPTIONS
> to be consistent with BR2_GCC_* and BR2_BINUTILS_EXTRA_CONFIG_OPTIONS.
> 
> Signed-off-by: Petri Gynther <pgynther@google.com>

Thanks for your contributions!

However, for patch 2/3 and 3/3, which merely rename existing config
options "for the sake of consistency", it means that they break all
existing configurations.

Even though I do like consistency, we generally try to avoid such
renames "just for the beauty of it" in order to not break the existing
configurations that our users have.

Or at the very least, handling in Config.in.legacy should be added for
the previous option name, so that users are notified that there is an
issue when they upgrade Buildroot.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
