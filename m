From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 4 Sep 2015 14:20:16 +0100
Subject: [Buildroot] [PATCH v2 1/6] python-urwid: bump version and add
 checksums
In-Reply-To: <1441266926-2942-1-git-send-email-cvubrugier@fastmail.fm>
References: <1441266926-2942-1-git-send-email-cvubrugier@fastmail.fm>
Message-ID: <55E99A90.9050409@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Christophe Vu-Brugier,

On 09/03/2015 08:55 AM, Christophe Vu-Brugier wrote:
> Signed-off-by: Christophe Vu-Brugier <cvubrugier@fastmail.fm>
> 
> ---
> Changes since v1:
>  * Change hash URL from PyPI as suggested by Baruch Siach
> 
> ---
>  package/python-urwid/python-urwid.hash | 3 +++
>  package/python-urwid/python-urwid.mk   | 2 +-
>  2 files changed, 4 insertions(+), 1 deletion(-)
>  create mode 100644 package/python-urwid/python-urwid.hash
> 
> diff --git a/package/python-urwid/python-urwid.hash b/package/python-urwid/python-urwid.hash
> new file mode 100644
> index 0000000..eceed9d
> --- /dev/null
> +++ b/package/python-urwid/python-urwid.hash
> @@ -0,0 +1,3 @@
> +# md5 from https://pypi.python.org/pypi/urwid/1.3.0, sha256 locally computed
> +md5	a989acd54f4ff1a554add464803a9175  urwid-1.3.0.tar.gz
> +sha256	29f04fad3bf0a79c5491f7ebec2d50fa086e9d16359896c9204c6a92bc07aba2  urwid-1.3.0.tar.gz
> diff --git a/package/python-urwid/python-urwid.mk b/package/python-urwid/python-urwid.mk
> index 4f1be46..1cd3022 100644
> --- a/package/python-urwid/python-urwid.mk
> +++ b/package/python-urwid/python-urwid.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -PYTHON_URWID_VERSION = 1.2.1
> +PYTHON_URWID_VERSION = 1.3.0
>  PYTHON_URWID_SOURCE = urwid-$(PYTHON_URWID_VERSION).tar.gz
>  PYTHON_URWID_SITE = https://pypi.python.org/packages/source/u/urwid
>  PYTHON_URWID_LICENSE = LGPLv2.1+
> 

Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Compile test for MIPS architecture:

$ grep ^PYTHON_URWID_VERSION package/python-urwid/python-urwid.mk
PYTHON_URWID_VERSION = 1.3.0

$ file output/target/usr/lib/python2.7/site-packages/urwid/str_util.so
output/target/usr/lib/python2.7/site-packages/urwid/str_util.so: ELF
32-bit MSB shared object, MIPS, MIPS32 rel2 version 1 (SYSV),
dynamically linked, with unknown capability 0x41000000 = 0xf676e75, with
unknown capability 0x10000 = 0x70401, stripped

Regards,

Vincent.
