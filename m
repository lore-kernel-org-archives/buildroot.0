From: Joakim Bech <joakim.bech@linaro.org>
Date: Tue, 29 Jan 2019 13:00:07 +0100
Subject: [Buildroot] [PATCH v2 1/1] toolchain: update AArch32/AArch64
 toolchains to 8-2-2019.01
In-Reply-To: <2f050b43-578d-2208-1cc6-e81df01f8b6d@mind.be>
References: <20190128133500.7515-1-joakim.bech@linaro.org>
 <20190128170533.16555-1-joakim.bech@linaro.org>
 <f01f063d-4b46-62b9-12f4-1cba370a3029@mind.be>
 <20190129102608.4k3wfli3dyomb7aa@debby>
 <1e40561f-02d9-c356-8630-c301251048ff@mind.be>
 <2f050b43-578d-2208-1cc6-e81df01f8b6d@mind.be>
Message-ID: <20190129120007.bwfy3wwcgtd3xzi2@debby>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jan 29, 2019 at 12:34:33PM +0100, Arnout Vandecappelle wrote:
> 
> 
> On 29/01/2019 12:27, Arnout Vandecappelle wrote:
> >>> On 28/01/2019 18:05, Joakim Bech wrote:
> >>> [snip]
> >>>> +config BR2_KERNEL_HEADERS_5_00
> >>>> +	bool "Linux 5.00.x kernel headers"
> >>>> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_00
> >>>  Adding support for the 5.0 headers should be a separate patch. See commit
> >>> 649883d2c9957b7a7fcf81c4475f848ad8865ca1 for an example how it was done for 4.20.
> >>>
> >> So after looking a bit more into the git log of how patches where
> >> created in the past it looks like I should create 4 patches, "pseudo git
> >> log -4".
> >> - toolchain-external: update Arm ARM 8.2-2019.01
> >> - toolchain-external: update Arm AArch64-BE toolchain 8.2-2019.01
> >> - toolchain-external: update Arm AArch64 toolchain 8.2-2019.01
> >> - toolchain: add necessary options to support 5.0 kernel headers
> >  Indeed, that's the way to go.
> 
>  Hold on a moment, I'm having second thoughts on this... This toolchain is using
> 5.0-rcX kernel headers. I'm not so sure that we will want that in our 2019.02
> LTS release... So I expect that this patch will not get included in the 2919.02
> cut-off, and will end up being superseded by the Arm 2019.03 release...
> 
>  Peter?
> 
>  That said, the part that adds support for 5.0 kernel headers is certainly
> something we'd like to have in the 2019.02 LTS.
> 
That is actually sufficient for our (OP-TEE) usage, i.e., as mentioned
in my earlier patch set we are pre-downloading the toolchain outside
Buildroot. But we need the kernel header changes, otherwise we cannot
upgrade our "pre-downloaded" toolchain. On the other hand, it's not the
end of the world if we hold off with this for a month or two.

Anyhow, I'm holding off posting v3 until I've seen a reply from Peter.

-- 
Regards,
Joakim
