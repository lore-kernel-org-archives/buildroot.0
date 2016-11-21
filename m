From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Nov 2016 22:43:03 +0100
Subject: [Buildroot] [PATCH v2] mpv: needs atomics or 8-byte sync
In-Reply-To: <20161120145434.20506-1-arnout@mind.be>
References: <20161120145434.20506-1-arnout@mind.be>
Message-ID: <20161121224303.7bd7749e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 20 Nov 2016 15:54:34 +0100, Arnout Vandecappelle
(Essensium/Mind) wrote:
> The wscript checks the following.
>         'func': check_libs(['atomic'],
>             check_statement('stdint.h',
>                 'int64_t test = 0;'
>                 'test = __atomic_add_fetch(&test, 1, __ATOMIC_SEQ_CST)')),
> and
>         'func': check_statement('stdint.h',
>                     'int64_t test = 0;'
>                     '__typeof__(test) x = ({int a = 1; a;});'
>                     'test = __sync_add_and_fetch(&test, 1)'),
> It fails if neither of these are available.
> 
> Fixes
> http://autobuild.buildroot.net/results/8c20f719f784af1312294600e39004c1d382368a
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
> I couldn't find a compiler without atomics and with 8-byte sync, so not
> entirely sure if it's enough.

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
