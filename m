From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Nov 2015 13:57:32 +0100
Subject: [Buildroot] [PATCH v2] gpsd: add work-around and re-enable for
 microblaze
In-Reply-To: <1448195040-8082-1-git-send-email-sergio.prado@e-labworks.com>
References: <1448195040-8082-1-git-send-email-sergio.prado@e-labworks.com>
Message-ID: <20151122135732.3fc6bb45@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Sergio Prado,

On Sun, 22 Nov 2015 10:24:00 -0200, Sergio Prado wrote:
> Fix (works around) bug #6872
> https://bugs.busybox.net/show_bug.cgi?id=6872
> 
> The gpsd package was disabled due to an internal compiler error for
> the microblaze architecture in the following commit:
> http://git.buildroot.net/buildroot/commit/?id=d517415bcda380336f4a27bf248cef4d81791c9e
> 
> The problem is due to an specific GCC optimization flag
> (-fexpensive-optimizations), so disabling it we can work around this
> problem and compile gpsd for the microblaze architecture.
> 
> Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
> Changes v1 -> v2:
>   - added a comment explaining why we are disabling the optimization flag.
> ---
>  package/gpsd/Config.in        | 3 ---
>  package/gpsd/gpsd.mk          | 8 +++++++-
>  package/sconeserver/Config.in | 2 --
>  3 files changed, 7 insertions(+), 6 deletions(-)

Applied to master, thanks. Could you test with gcc 5.x, and if the
problem still exists, report a bug to the gcc bug tracker ? While your
workaround is OK, it is not good for gcc to fail this way when building
gpsd.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
