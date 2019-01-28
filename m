From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 28 Jan 2019 22:20:07 +0100
Subject: [Buildroot] [PATCH v3] tpm2-tools: drop dependency on tpm2-abrmd
In-Reply-To: <20190128211124.GJ7130@scaer> (Yann E. MORIN's message of "Mon,
 28 Jan 2019 22:11:24 +0100")
References: <20190125150304.16661-1-peter@korsgaard.com>
 <20190128211124.GJ7130@scaer>
Message-ID: <87va28bhtk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Peter, All,
 > On 2019-01-25 16:03 +0100, Peter Korsgaard spake thusly:
 >> tpm2-tools is commonly used with the resource manager, tpm2-abrmd - But it
 >> CAN be used without, E.G. by setting the TPM2TOOLS_TCTI_NAME environment
 >> variable to communicate directly with the kernel driver:
 >> 
 >> export TPM2TOOLS_TCTI_NAME=device
 >> 
 >> Either directly with the TPM device (/dev/tpmN) or through the in-kernel
 >> resource manager provided by Linux kernel since 4.12 (/dev/tpmrmN)
 >> 
 >> For some use cases (E.G. initramfs) it makes sense to use tpm2-tools
 >> without abrmd, so remove the tpm2-abrmd select, and instead a note in the
 >> help text that it may be needed.
 >> 
 >> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

 > Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

 > Thank you. :-)

You're welcome ;) Thanks for your review.

Committed, thanks.

-- 
Bye, Peter Korsgaard
