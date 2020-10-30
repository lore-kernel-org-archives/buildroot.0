From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 30 Oct 2020 09:03:10 +0100
Subject: [Buildroot] [PATCH 1/1] package/libpam-tacplus: fix
 CVE-2020-27743
In-Reply-To: <20201028082658.47272-1-fontaine.fabrice@gmail.com>
References: <20201028082658.47272-1-fontaine.fabrice@gmail.com>
Message-ID: <20201030090310.2cb6cf63@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 28 Oct 2020 09:26:58 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> libtac in pam_tacplus through 1.5.1 lacks a check for a failure of
> RAND_bytes()/RAND_pseudo_bytes(). This could lead to use of a
> non-random/predictable session_id.
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...failure-of-OpenSSL-RAND_pseudo_bytes.patch | 146 ++++++++++++++++++
>  package/libpam-tacplus/libpam-tacplus.mk      |   3 +
>  2 files changed, 149 insertions(+)
>  create mode 100644 package/libpam-tacplus/0005-Check-for-failure-of-OpenSSL-RAND_pseudo_bytes.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
