From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 11 Apr 2019 18:27:57 +0200
Subject: [Buildroot] [PATCH v2 1/2] package/hostapd: add upstream 2019-1, 2, 3,
 4 security patches
In-Reply-To: <20190411111103.19705-1-peter@korsgaard.com>
References: <20190411111103.19705-1-peter@korsgaard.com>
Message-ID: <20190411182757.5ec63ac5@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 11 Apr 2019 13:11:02 +0200
Peter Korsgaard <peter@korsgaard.com> wrote:

> Fixes the following security vulnerabilities:
> 
> - CVE-2019-9494 (cache attack against SAE)
> 
> For details, see the advisory:
> https://w1.fi/security/2019-1/sae-side-channel-attacks.txt
> 
> - CVE-2019-9495 (cache attack against EAP-pwd)
> 
> For details, see the advisory:
> https://w1.fi/security/2019-2/eap-pwd-side-channel-attack.txt
> 
> - CVE-2019-9496 (SAE confirm missing state validation in hostapd/AP)
> 
> For details, see the advisory:
> https://w1.fi/security/2019-3/sae-confirm-missing-state-validation.txt
> 
> - CVE-2019-9497 (EAP-pwd server not checking for reflection attack)
> - CVE-2019-9498 (EAP-pwd server missing commit validation for scalar/element)
> - CVE-2019-9499 (EAP-pwd peer missing commit validation for scalar/element)
> 
> For details, see the advisory:
> https://w1.fi/security/2019-4/eap-pwd-missing-commit-validation.txt
> 
> Notice that SAE is not currently enabled in Buildroot, but the patches are
> included here anyway for completeness.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/hostapd/hostapd.hash | 14 ++++++++++++++
>  package/hostapd/hostapd.mk   | 15 +++++++++++++++
>  2 files changed, 29 insertions(+)

Both applied, thanks! It's an interesting practice to delivery those
security fixes only in the form of patches, and not do some proper
point releases. But oh well, if that's how upstream works.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
