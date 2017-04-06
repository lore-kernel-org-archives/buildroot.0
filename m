From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Apr 2017 21:55:46 +0200
Subject: [Buildroot] [PATCH v5 06/13] configs: add autobuild toolchain
 defconfigs
In-Reply-To: <20170406181854.5242-6-arnout@mind.be>
References: <cover.1491502445.git.arnout@mind.be>
 <20170406181854.5242-6-arnout@mind.be>
Message-ID: <20170406215546.6e0b393d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 6 Apr 2017 20:18:46 +0200, Arnout Vandecappelle
(Essensium/Mind) wrote:

> Note: I choose to name them xxx_defconfig and put them under to configs
> directory so they can be used directly as a quick way to set up a build
> with an external toolchain. However, neither test-pkg nor autobuild-run
> will use them as _defconfig, so we could just as well call them *.config
> and put them under e.g. support/autobuild-toolchains. Let me know what
> you think.

It's not a fully clear-cut opinion, but I believe I have a preference
for having those in support/<something>/ rather than as official
defconfigs.

I don't think it makes much sense to advertise them as defconfigs.
Those base configurations are very specialized, some of them use
completely stupid toolchain configurations (ARM no thread, really?)
that only exist for the sake of testing various combinations of
toolchain features. So making those visible to random users along with
real defconfigs for boards doesn't seem like a good idea.

Plus it avoids the need to support defconfigs in subfolders (even
though I guess you went through great lengths to workaround make
stupidity about how patterns without slashes are handled), and the big
question of your last RFC patch on how to display them in
"list-defconfigs".

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
