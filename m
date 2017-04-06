From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Apr 2017 21:37:35 +0200
Subject: [Buildroot] [PATCH v5 08/13] support/test-pkg: get configs from
 buildroot defconfigs
In-Reply-To: <20170406181854.5242-8-arnout@mind.be>
References: <cover.1491502445.git.arnout@mind.be>
 <20170406181854.5242-8-arnout@mind.be>
Message-ID: <20170406213735.003749a9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 6 Apr 2017 20:18:48 +0200, Arnout Vandecappelle
(Essensium/Mind) wrote:
> Now we have the toolchain configs in the buildroot directory itself, it
> is no longer necessary to fetch it from the toolchain URL.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>

On the principle, I am OK with this direction, but it is needs to be
coordinated with a change to autobuild-run to also use the base
autobuild defconfigs from the Buildroot tree. Otherwise, we will have
two copies: one used by people running test-pkg, one used by the actual
autobuilders. It is not difficult to see those two copies quickly
getting out of sync.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
