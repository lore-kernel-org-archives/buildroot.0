From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 28 Oct 2014 14:15:53 -0300
Subject: [Buildroot] [PATCH] lame: Disable for Aarch64 and MIPS when
 building with debug symbols
In-Reply-To: <1414515902-3153-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1414515902-3153-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <544FCF49.5010704@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/28/2014 02:05 PM, Vicente Olivert Riera wrote:

> Building lame with debug symbols needs the following macros to be
> defined: _FPU_MASK_IM, _FPU_MASK_ZM, _FPU_MASK_OM.
> If BR2_ENABLE_DEBUG is selected, then we have to disable lame for
> Aarch64 and MIPS because these architectures don't have those macros
> defined.
> 
> Fixes:
> 	http://autobuild.buildroot.net/results/721/721dff299b204b1d3ccc0846009eb17faa2d29eb/
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  package/lame/Config.in |    7 +++++++
>  1 files changed, 7 insertions(+), 0 deletions(-)

What happens when another package that uses lame selects it? (like mpd,
gst-plugins-ugly, gst1-plugins-ugly).
Regards.
