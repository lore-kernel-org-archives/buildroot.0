From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 2 Nov 2012 23:17:08 +0100
Subject: [Buildroot] [PATCH] uClibc: install libc.so even if
 BR2_PREFER_STATIC_LIB is enabled
In-Reply-To: <1351764953-24251-1-git-send-email-arnout@mind.be>
References: <50924B99.5080605@mind.be>
 <1351764953-24251-1-git-send-email-arnout@mind.be>
Message-ID: <20121102231708.7d28d857@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle (Essensium/Mind),

On Thu,  1 Nov 2012 11:15:53 +0100, Arnout Vandecappelle
(Essensium/Mind) wrote:
> BR2_PREFER_STATIC_LIB _prefers_ static linking, but doesn't force it
> for all packages.  So some binaries may still be built without
> -static, and they will need libc.so on the target.
> 
> Therefore, put libc.so.0 in the target unconditionally.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
> Untested!

This is an exact revert of c95174a8dfb6f72b80768b73b8f04448f846c122. Do
we really want to make circles and redo/undo our changes? :-)

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
