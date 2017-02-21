From: Wolfgang Grandegger <wg@grandegger.com>
Date: Tue, 21 Feb 2017 09:53:32 +0100
Subject: [Buildroot] Relocatable internal toolchain
In-Reply-To: <CAHXCMML2HKsOgxZRLpcMbCY8Lci6-N_s1+qVTRxCHqyvP+rzgg@mail.gmail.com>
References: <57c96cfd-7d0c-c9de-04d2-2da8f5dd7f7c@grandegger.com>
 <CAHXCMML2HKsOgxZRLpcMbCY8Lci6-N_s1+qVTRxCHqyvP+rzgg@mail.gmail.com>
Message-ID: <40e82fc5-e730-7ced-d6da-ccf61652507a@grandegger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Samuel, all

more on that topic...

Am 26.01.2017 um 11:47 schrieb Samuel Martin:
> Hi Wolfgang, all,
> 
> On Thu, Jan 26, 2017 at 9:25 AM, Wolfgang Grandegger <wg@grandegger.com> wrote:
>> Hello,
>>
>> I prefer a relocatable (internal) toolchain and before digging deeper... Are
>> there any plans in that direction? I realized some attempts (patches) to
>> make the buildroot toolchain relocatable but they have not (yet) been
>> accepted. What are the pros and cons? Are there principle problems?
> 
> Yes, there are plans for this.
> 
> There had been a couple of the series posted on this topic (the latest one [1]).
> And we talked about this during the last Buildroot Meeting, you can
> check the report [2] for detailed conclusions.
> To sum-up:
> - Producing the relocatable host tools will be addressed step-by-step;
> - Preparatory changes making buildroot using absolute canonical paths
> are already merged [4];
> - Next step: fixing RPATH in host tools binaries thanks to some
> patchelf [3] features to be implemented and upstreamed (this should be
> enough to meet Buildroot needs);

I have now implemented "patchelf --make-rpath-relative ROOTDIR ..:"
following closely your related patches. Before starting the up-streaming
process, I first want to get some feedback here. Does it fit our needs?
Any other ideas or comments?

It would be nice to get rid of the "readelf" scripts as well. We could
call "patchelf" on any regular file and simply ignore the errors (not
an ELF file, not dynamic or not shared). That's fast but maybe a bit
too hackish. Having an extra option for that purpose might be
better/cleaner.

Below is the preliminary patchelf patch.

Wolfgang.
