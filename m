From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Mar 2013 19:59:13 +0100
Subject: [Buildroot] [PATCH 4/5] Enable ccache for cmake packages
In-Reply-To: <1362590066-5448-5-git-send-email-luca@lucaceresoli.net>
References: <1362590066-5448-1-git-send-email-luca@lucaceresoli.net>
 <1362590066-5448-5-git-send-email-luca@lucaceresoli.net>
Message-ID: <20130306195913.2c7e6db7@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Luca Ceresoli,

On Wed,  6 Mar 2013 18:14:25 +0100, Luca Ceresoli wrote:
> CMake fails in detecting the compiler when ccache is used. Add a wrapper
> script to make it happy.

This raises the question of whether we want to generalize this in some
way: should we be doing the ccache wrapper thing in a generic way, and
use it everywhere? Since we already have a wrapper for external
toolchain tools, does it really make sense to have a shell wrapper
around a C wrapper? Should we have a single C wrapper used in all cases
(internal, external, crosstool-ng), that handles everything?

I don't (yet) have a strong opinion on this, I just wanted to have a
more global reflection about wrappers, and avoid creating many
wrappers to solve different problems.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
