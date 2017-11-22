From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Nov 2017 22:16:39 +0100
Subject: [Buildroot] [PATCH] systemd: set time epoch for reproducible
 builds
In-Reply-To: <20171116170316.19081-1-john@metanate.com>
References: <20171116170316.19081-1-john@metanate.com>
Message-ID: <20171122221639.40f60340@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 16 Nov 2017 17:03:16 +0000, John Keeping wrote:
> Systemd embeds a timestamp which is used to impose a minimum bound on
> the system time during boot.  Normally this comes from stat'ing the NEWS
> file included with the systemd source, but this makes the build
> non-reproducible.  Pass in $SOURCE_DATE_EPOCH to use a deterministic
> timestamp when reproducible builds are enabled.
> 
> Signed-off-by: John Keeping <john@metanate.com>
> ---
>  package/systemd/systemd.mk | 5 +++++
>  1 file changed, 5 insertions(+)

Following the feedback from Peter Korsgaard and myself, and the lack of
additional justification, I've marked this patch as "Rejected" in our
patch tracking system.

John: don't hesitate to get back to us with a more detailed explanation
of the issue if you have not been convinced by Peter's explantion and
mine.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
