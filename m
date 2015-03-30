From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 30 Mar 2015 23:08:22 +0200
Subject: [Buildroot] [PATCH v3] BINFMT_FLAT_SHARED: is not really shared
 for buildroot purposes
In-Reply-To: <1427490623-24292-1-git-send-email-arnout@mind.be>
References: <1427490623-24292-1-git-send-email-arnout@mind.be>
Message-ID: <20150330230822.736e527d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle (Essensium/Mind),

On Fri, 27 Mar 2015 22:10:23 +0100, Arnout Vandecappelle
(Essensium/Mind) wrote:
> From: Sonic Zhang <sonic.zhang@analog.com>
> 
> Although BINFMT_FLAT_SHARED is indeed a shared library format, it does
> not support dynamic library loading with dlopen(). So for buildroot
> purposes, BR2_STATIC_LIBS shouldn't be selected.
> 
> As it happens, the compiler options that are added for
> BINFMT_FLAT_SHARED also make the compiler ignore the -static option, so
> we can simply force BR2_STATIC_LIBS and things work out perfectly.
> 
> Therefore, remove the select of BR2_BINFMT_SUPPORTS_SHARED from
> BINFMT_FLAT_SHARED, which in turn makes sure that BR2_STATIC_LIBS is
> selected.
> 
> [Arnout: rewrite commit message, add explanatory comment]
> 
> Signed-off-by: Sonic Zhang <sonic.zhang@analog.com>
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
