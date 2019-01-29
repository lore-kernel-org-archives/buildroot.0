From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 29 Jan 2019 23:07:29 +0100
Subject: [Buildroot] [PATCH v3] tpm2-tools: drop dependency on tpm2-abrmd
In-Reply-To: <20190125150304.16661-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Fri, 25 Jan 2019 16:03:04 +0100")
References: <20190125150304.16661-1-peter@korsgaard.com>
Message-ID: <877een2k4e.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > tpm2-tools is commonly used with the resource manager, tpm2-abrmd - But it
 > CAN be used without, E.G. by setting the TPM2TOOLS_TCTI_NAME environment
 > variable to communicate directly with the kernel driver:

 > export TPM2TOOLS_TCTI_NAME=device

 > Either directly with the TPM device (/dev/tpmN) or through the in-kernel
 > resource manager provided by Linux kernel since 4.12 (/dev/tpmrmN)

 > For some use cases (E.G. initramfs) it makes sense to use tpm2-tools
 > without abrmd, so remove the tpm2-abrmd select, and instead a note in the
 > help text that it may be needed.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 > ---
 > Changes since v2:
 > - Drop the imply and instead add a comment as suggested by Yann and Arnout

Committed to 2018.11.x, thanks.

-- 
Bye, Peter Korsgaard
