From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 27 Oct 2014 17:19:36 +0000
Subject: [Buildroot] [PATCH] trinity: Disable for Microblaze architecture
In-Reply-To: <20141027174348.0d4bcccb@free-electrons.com>
References: <1414426270-14436-1-git-send-email-Vincent.Riera@imgtec.com>
 <20141027174348.0d4bcccb@free-electrons.com>
Message-ID: <544E7EA8.7030207@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas Petazzoni,

On 10/27/2014 04:43 PM, Thomas Petazzoni wrote:
> Dear Vicente Olivert Riera,
>
> On Mon, 27 Oct 2014 16:11:10 +0000, Vicente Olivert Riera wrote:
>> This package doesn't support the Microblaze architecture. The full list
>> of supported architectures is in the trinity website, and Microblaze is
>> not among them.
>
> Then what we want is not something like the patch you propose, but
> instead a patch using positive logic to enable Trinity only on the
> architecture that are known to work.
>
> The website says: "Trinity supports Alpha, Aarch64, ARM, i386, IA-64,
> MIPS, PowerPC-64, S390, S390x, SPARC-64, x86-64.". So it means that not
> only Microblaze is going to cause issue, but also Blackfin, ARC,
> Xtensa, SPARC 32 bits, and probably some others I forgot.
>
> Can you respin the patch with something like:
>
> 	depends BR2_... || BR2_... || BR2_...
>
> Thanks!
>
> Thomas

Done: http://patchwork.ozlabs.org/patch/403703/

I have marked the former patch as superseded.

Best regards,
-- 
Vicente Olivert Riera
Graduate Software Engineer, MIPS Processor IP
Imagination Technologies Limited
t: +44 (0)113 2429814
www.imgtec.com
