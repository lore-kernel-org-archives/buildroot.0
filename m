From: Ryan Barnett <ryan.barnett@rockwellcollins.com>
Date: Wed, 8 May 2019 07:37:33 -0500
Subject: [Buildroot] [PATCH] package/atftp: security bump to version
 0.7.2
In-Reply-To: <20190508063519.27686-1-peter@korsgaard.com>
References: <20190508063519.27686-1-peter@korsgaard.com>
Message-ID: <CAMQcK5JisKX_KeD_3LTgQ36yNBAsR_PkvtQzD7v-v3=pxVVjtQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, May 8, 2019 at 1:35 AM Peter Korsgaard <peter@korsgaard.com> wrote:
>
> Fixes the following security issues:
>
> CVE-2019-11365: An issue was discovered in atftpd in atftp 0.7.1.  A remote
> attacker may send a crafted packet triggering a stack-based buffer overflow
> due to an insecurely implemented strncpy call.  The vulnerability is
> triggered by sending an error packet of 3 bytes or fewer.  There are
> multiple instances of this vulnerable strncpy pattern within the code base,
> specifically within tftpd_file.c, tftp_file.c, tftpd_mtftp.c, and
> tftp_mtftp.c.
>
> CVE-2019-11366: An issue was discovered in atftpd in atftp 0.7.1.  It does
> not lock the thread_list_mutex mutex before assigning the current thread
> data structure.  As a result, the daemon is vulnerable to a denial of
> service attack due to a NULL pointer dereference.  If thread_data is NULL
> when assigned to current, and modified by another thread before a certain
> tftpd_list.c check, there is a crash when dereferencing current->next.
>
> For details, see
> https://pulsesecurity.co.nz/advisories/atftpd-multiple-vulnerabilities
>
> Patch 0001-Makefile.am-link-against-libpthread-for-atftp.patch patches
> Makefile.am, so add _AUTORECONF.
>
> CFLAGS is now correctly handled since commit f9dbb96844167f (configure.ac:
> fix hard setting of CFLAGS), so drop the workaround about passing
> -fgnu89-inline in CPPFLAGS.
>
> Add a hash for the license file.
>
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/atftp/atftp.hash |  3 ++-
>  package/atftp/atftp.mk   | 10 +++++-----
>  2 files changed, 7 insertions(+), 6 deletions(-)
>
> diff --git a/package/atftp/atftp.hash b/package/atftp/atftp.hash
> index b7860c7681..3e5e783cff 100644
> --- a/package/atftp/atftp.hash
> +++ b/package/atftp/atftp.hash

Reviewed-by: Ryan Barnett <ryan.barnett@rockwellcollins.com>

---
Ryan Barnett | Sr Systems Engineer | Commercial Avionics
COLLINS AEROSPACE
400 Collins Rd NE, Cedar Rapids, IA 52498 USA
Tel: +1 319 263 3880
ryan.barnett at collins.com | collinsaerospace.com
