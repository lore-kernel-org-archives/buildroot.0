From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 4 Feb 2020 23:20:08 +0100
Subject: [Buildroot] [PATCH] package/ntfs-3g: add upstream security fix
 for CVE-2019-9755
In-Reply-To: <20200204155031.5504-1-peter@korsgaard.com>
References: <20200204155031.5504-1-peter@korsgaard.com>
Message-ID: <20200204232008.1f41421c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue,  4 Feb 2020 16:50:31 +0100
Peter Korsgaard <peter@korsgaard.com> wrote:

> Fixes CVE-2019-9755: An integer underflow issue exists in ntfs-3g 2017.3.23.
> A local attacker could potentially exploit this by running /bin/ntfs-3g with
> specially crafted arguments from a specially crafted directory to cause a
> heap buffer overflow, resulting in a crash or the ability to execute
> arbitrary code.  In installations where /bin/ntfs-3g is a setuid-root
> binary, this could lead to a local escalation of privileges.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  ...an-error-when-failed-to-build-the-mo.patch | 72 +++++++++++++++++++
>  1 file changed, 72 insertions(+)
>  create mode 100644 package/ntfs-3g/0001-Fixed-reporting-an-error-when-failed-to-build-the-mo.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
