From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Jun 2014 10:44:23 +0200
Subject: [Buildroot] [PATCH 1/2] graph-depends: support calling from
 recursive make
In-Reply-To: <1403554284-4935-1-git-send-email-arnout@mind.be>
References: <1403554284-4935-1-git-send-email-arnout@mind.be>
Message-ID: <20140629104423.0875c8f7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle (Essensium/Mind),

On Mon, 23 Jun 2014 22:11:23 +0200, Arnout Vandecappelle
(Essensium/Mind) wrote:
> The graph-depends script calls make. If the outer make was called
> recursively, or if it was called with '-C <somedir>', then the
> environment will contain "MAKEFLAGS=w --". Therefore, the recursive
> make prints 'Entering' and 'Leaving' messages, which clobbers the
> output for dot.
> 
> To avoid this, add "--no-print-directory" to the recursive make
> arguments. Since we require GNU make 3.81, we can be sure that this
> option is available.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Patches 1/2 and 2/2 applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
