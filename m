From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Aug 2015 21:06:46 +0200
Subject: [Buildroot] [PATCH v3] ola: Add patch to fix linking issue
In-Reply-To: <1439902602-21646-1-git-send-email-simon.marchi@polymtl.ca>
References: <1439902602-21646-1-git-send-email-simon.marchi@polymtl.ca>
Message-ID: <20150818210646.4bc62eaf@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Simon Marchi,

On Tue, 18 Aug 2015 08:56:42 -0400, Simon Marchi wrote:
> This patch fixes this autobuild failure:
> 
>   http://autobuild.buildroot.net/results/e14/e14e1700d4fe359c56be57587bdb509e002e5753/build-end.log
> 
> The problem is caused by the -fvisibility-inlines-hidden switch.
> Removing the switch is probably the least intrusive way we can make the
> problem go away.  The first solution that was considered was to move the
> definition of the offending method to the .cpp file.  However, with
> other combinations of compilers and platforms, I suppose it could happen
> with other methods as well.  Removing the switch ensures we catch them
> all.
> 
> Built-tested with the config from the build bot, as well as with all OLA
> options/plugins enabled.
> 
> Signed-off-by: Simon Marchi <simon.marchi@polymtl.ca>
> ---
>  .../0001-Remove-fvisibiliy-inlines-hidden.patch    | 26 ++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>  create mode 100644 package/ola/0001-Remove-fvisibiliy-inlines-hidden.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
