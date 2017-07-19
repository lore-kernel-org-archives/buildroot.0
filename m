From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 19 Jul 2017 15:23:48 +0200
Subject: [Buildroot] [git commit] libglib2: disable compiler warnings
In-Reply-To: <87d18wbmc1.fsf@dell.be.48ers.dk>
References: <20170704170700.6316E81E06@busybox.osuosl.org>
 <87d18wbmc1.fsf@dell.be.48ers.dk>
Message-ID: <20170719152348.66d289c3@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 19 Jul 2017 15:14:22 +0200, Peter Korsgaard wrote:
> >>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:  
> 
>  > commit: https://git.buildroot.net/buildroot/commit/?id=f2800ac57cde2cd71df295d33441faae1b30dd3e
>  > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master  
> 
>  > By default, libglib enables some fairly aggressive warnings, treated
>  > as errors. In particular, the -Wformat=2 warning triggers a warning
>  > due to the return value of the ngettext() macro from uClibc libintl
>  > stub not being understood as being potentially a format string.  
> 
>  > So, before we enable the stub libintl in uClibc, we disable such
>  > warnings. A bug will be reported to upstream uClibc to get the actual
>  > bug fixed, but disabling compiler warnings treated as errors is anyway
>  > a good thing in the context of Buildroot.  
> 
>  > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>  > Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>  > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>  
> 
> Committed to 2017.02.x and 2017.05.x, thanks.

Doesn't do much harm, but it wasn't causing any visible issue in
2017.02/2017.05 I believe. It's really enabling the uClibc-ng intl stub
that triggered that warning.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
