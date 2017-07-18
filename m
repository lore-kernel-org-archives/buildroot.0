From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Jul 2017 23:47:10 +0200
Subject: [Buildroot] [PATCHv3] support/tests: allow properly indented
 config fragment
In-Reply-To: <20170718203839.14913-1-yann.morin.1998@free.fr>
References: <20170718203839.14913-1-yann.morin.1998@free.fr>
Message-ID: <20170718234710.2759bb07@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 18 Jul 2017 22:38:39 +0200, Yann E. MORIN wrote:
> Currently, defining a config fragment in the runtime test infra requires
> that the fragment not to be indented. This is beark, and causes grievance
> when looking at the code (e.g. to fix it).
> 
> Just strip out all leading spaces/tabs when writing the configuration
> lines into the config file, allowing in-line indented config fragments,
> like so:
> 
>     class TestFoo(bla):
>         config = bla.config + \
>             """
>             FOO=y
>             # BAR is not set
>             """
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> 
> ---
> Changes v2 -> v3:
>   - use and fix code snippet provided by Arnout, thanks! ;-)
>   - do it in our base test class, not on the builder class  (Arnout)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
