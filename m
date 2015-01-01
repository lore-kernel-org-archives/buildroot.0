From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 1 Jan 2015 14:52:38 +0100
Subject: [Buildroot] [PATCH v2 6/7] Adding sofia-sip
In-Reply-To: <1418398967-2183-7-git-send-email-gregd72002@gmail.com>
References: <1418398967-2183-1-git-send-email-gregd72002@gmail.com>
 <1418398967-2183-7-git-send-email-gregd72002@gmail.com>
Message-ID: <20150101145238.53d594f5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gregory Dymarek,

On Fri, 12 Dec 2014 15:42:46 +0000, Gregory Dymarek wrote:
> Signed-off-by: Gregory Dymarek <gregd72002@gmail.com>
> ---
>  package/Config.in                                  |  1 +
>  package/sofia-sip/Config.in                        |  5 ++++
>  ...ag.h-reintroduce-soatag_local_sdp_str_ref.patch | 26 ++++++++++++++++++
>  package/sofia-sip/sofia-sip.hash                   |  1 +
>  package/sofia-sip/sofia-sip.mk                     | 31 ++++++++++++++++++++++
>  5 files changed, 64 insertions(+)
>  create mode 100644 package/sofia-sip/Config.in
>  create mode 100644 package/sofia-sip/sofia-sip-1.12.11-0001-soa_tag.h-reintroduce-soatag_local_sdp_str_ref.patch
>  create mode 100644 package/sofia-sip/sofia-sip.hash
>  create mode 100644 package/sofia-sip/sofia-sip.mk

Thanks, applied, after doing a number of changes:

    [Thomas:
     - Add better Config.in help text.
     - Fix the hash file format.
     - Fix comment header in .mk file.
     - Remove SOURCE variable, as it had the default value.
     - Add dependency on host-pkgconf, used by the configure script.
     - Add LICENSE and LICENSE_FILES variables.
     - Do not use BR2_HAVE_DOCUMENTATION, this option has been
       removed. Instead, always disable doxygen.
     - Simplify the IPv6 test.
     - Add optional dependency on OpenSSL.
     - Fixup the handling of the --enable-ndebug.]

See the final commit at
http://git.buildroot.net/buildroot/commit/?id=fbfa66535072bf6bffdddfbe30f8adda801d13b2.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
