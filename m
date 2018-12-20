From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 20 Dec 2018 10:20:59 +0100
Subject: [Buildroot] Cross compiling kernel module for the target
In-Reply-To: <CA+OsCCRWydtsa1RVjGhc8ZdV-guMuA1ORauct4XH8ZYjgk6zvw@mail.gmail.com>
References: <CA+OsCCTCqQ+Fne+=VtXKgi5E_ezkdTAva-zTk6KaWa9egem0Sg@mail.gmail.com>
 <20181220090411.7ab00f70@windsurf>
 <CA+OsCCQ2TWYiEv-a8uRaJVSd4YX9A4T_EV1ihC1Y2ZyrNPAkag@mail.gmail.com>
 <20181220100733.5c6d0860@windsurf>
 <CA+OsCCRWydtsa1RVjGhc8ZdV-guMuA1ORauct4XH8ZYjgk6zvw@mail.gmail.com>
Message-ID: <20181220102059.1884d72d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 20 Dec 2018 10:14:41 +0100, ?ukasz Przenios?o wrote:
> Thomas, sorry for the Cc, its there now.
> No, my module is supposed to be a completely separate thing for now. I
> intend to build it using cross compilation tools provided by build root
> after the image is loaded to the target. I want to load the module using
> insmod. Then after the module is stable, I could add it to the buildroot
> config.

You cannot build a kernel module out of nowhere, it has to be compiled
against a kernel source tree with configuration, or a kernel headers
tree with configuration. In the context of Buildroot, only the former
exists, so if you don't build your Linux kernel with Buildroot, you
cannot build a kernel module with Buildroot.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
