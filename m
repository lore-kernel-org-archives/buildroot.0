From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 31 Mar 2018 16:57:23 +0200
Subject: [Buildroot] [PATCH 3/5] arch/mips: add DSP support
In-Reply-To: <20170721170635.41202-3-Vincent.Riera@imgtec.com>
References: <20170721170635.41202-1-Vincent.Riera@imgtec.com>
 <20170721170635.41202-3-Vincent.Riera@imgtec.com>
Message-ID: <7bbdd4b4-e275-7a1f-b15d-26629814eb65@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi all,

On 21-07-17 19:06, Vicente Olivert Riera wrote:
> This patch adds support for the MIPS DSP ASE. They come in three
> versions, DSP (r1), DSPr2 and DSPr3. Each one of them is a superset of
> the other, so selecting DSPr2 will imply DSP (r1) as well, and selecting
> DSPr3 will imply both DSP (r1) and DSPr2 as well.
> 
> For generic target architecture variants we let the user choose between
> the different compatible versions. For well known cores the user can
> only choose the DSP version that specific core would implement, or none,
> since implementing the DSP module in a core may be optional.
> 
> DSP (r1) and DSPr2 are available since MIPS release version 2.
> DSPr3 is only available since MIPS release version 6.

 This and the following patches are pretty complicated. Given that interest in
MIPS in general seems to be declining, and given that Vicente is no longer
contributing to Buildroot, we feel that there is a big risk that this stuff is
just going to bitrot and little chance that anybody will actually ever use this.

 Therefore, I've marked these patches as Rejected in patchwork.

 If anybody feels they need this, feel free to resend. For your convenience,
here are the patchwork URLs:

http://patchwork.ozlabs.org/patch/792228/
http://patchwork.ozlabs.org/patch/792227/
http://patchwork.ozlabs.org/patch/792226/


 Regards,
 Arnout

> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  arch/Config.in                                     |  3 +
>  arch/Config.in.mips                                | 71 ++++++++++++++++++++++
>  toolchain/toolchain-common.in                      |  3 +
>  .../toolchain-external/pkg-toolchain-external.mk   |  5 ++
>  toolchain/toolchain-wrapper.c                      |  3 +
>  5 files changed, 85 insertions(+)
[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
