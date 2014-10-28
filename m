From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 28 Oct 2014 17:17:34 +0000
Subject: [Buildroot] [PATCH] lame: Disable for Aarch64 and MIPS when
 building with debug symbols
In-Reply-To: <544FCF49.5010704@zacarias.com.ar>
References: <1414515902-3153-1-git-send-email-Vincent.Riera@imgtec.com>
 <544FCF49.5010704@zacarias.com.ar>
Message-ID: <544FCFAE.3050806@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/28/2014 05:15 PM, Gustavo Zacarias wrote:
> On 10/28/2014 02:05 PM, Vicente Olivert Riera wrote:
>
>> Building lame with debug symbols needs the following macros to be
>> defined: _FPU_MASK_IM, _FPU_MASK_ZM, _FPU_MASK_OM.
>> If BR2_ENABLE_DEBUG is selected, then we have to disable lame for
>> Aarch64 and MIPS because these architectures don't have those macros
>> defined.
>>
>> Fixes:
>> 	http://autobuild.buildroot.net/results/721/721dff299b204b1d3ccc0846009eb17faa2d29eb/
>>
>> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
>> ---
>>   package/lame/Config.in |    7 +++++++
>>   1 files changed, 7 insertions(+), 0 deletions(-)
>
> What happens when another package that uses lame selects it? (like mpd,
> gst-plugins-ugly, gst1-plugins-ugly).
> Regards.
>

You are right, the dependences should be propagated to those packages. I 
will respin a new version.

My apologies for that.

-- 
Vicente Olivert Riera
Graduate Software Engineer, MIPS Processor IP
Imagination Technologies Limited
t: +44 (0)113 2429814
www.imgtec.com
