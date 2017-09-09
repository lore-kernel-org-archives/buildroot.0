From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 9 Sep 2017 22:07:20 +0200
Subject: [Buildroot] [PATCH] libarchive: security bump to version 3.3.2
In-Reply-To: <2f11135f109fc82711e0efbc13e3fd46c292f364.1504987373.git.baruch@tkos.co.il>
References: <2f11135f109fc82711e0efbc13e3fd46c292f364.1504987373.git.baruch@tkos.co.il>
Message-ID: <20170909220720.62315b90@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  9 Sep 2017 23:02:53 +0300, Baruch Siach wrote:
> CVE-2016-8687: Stack-based buffer overflow in the safe_fprintf function
> in tar/util.c in libarchive 3.2.1 allows remote attackers to cause a
> denial of service via a crafted non-printable multibyte character in a
> filename.
> 
> CVE-2016-8688: The mtree bidder in libarchive 3.2.1 does not keep track
> of line sizes when extending the read-ahead, which allows remote
> attackers to cause a denial of service (crash) via a crafted file, which
> triggers an invalid read in the (1) detect_form or (2) bid_entry
> function in libarchive/archive_read_support_format_mtree.c.
> 
> CVE-2016-8689: The read_Header function in
> archive_read_support_format_7zip.c in libarchive 3.2.1 allows remote
> attackers to cause a denial of service (out-of-bounds read) via multiple
> EmptyStream attributes in a header in a 7zip archive.
> 
> CVE-2016-10209: The archive_wstring_append_from_mbs function in
> archive_string.c in libarchive 3.2.2 allows remote attackers to cause a
> denial of service (NULL pointer dereference and application crash) via a
> crafted archive file.
> 
> CVE-2016-10349: The archive_le32dec function in archive_endian.h in
> libarchive 3.2.2 allows remote attackers to cause a denial of service
> (heap-based buffer over-read and application crash) via a crafted file.
> 
> CVE-2016-10350: The archive_read_format_cab_read_header function in
> archive_read_support_format_cab.c in libarchive 3.2.2 allows remote
> attackers to cause a denial of service (heap-based buffer over-read and
> application crash) via a crafted file.
> 
> CVE-2017-5601: An error in the lha_read_file_header_1() function
> (archive_read_support_format_lha.c) in libarchive 3.2.2 allows remote
> attackers to trigger an out-of-bounds read memory access and
> subsequently cause a crash via a specially crafted archive.
> 
> Add upstream patch fixing the following issue:
> 
> CVE-2017-14166: libarchive 3.3.2 allows remote attackers to cause a
> denial of service (xml_data heap-based buffer over-read and application
> crash) via a crafted xar archive, related to the mishandling of empty
> strings in the atol8 function in archive_read_support_format_xar.c.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  ...g-sensible-for-empty-strings-to-make-fuzz.patch | 42 ++++++++++++++++++++++
>  package/libarchive/libarchive.hash                 |  2 +-
>  package/libarchive/libarchive.mk                   |  2 +-
>  3 files changed, 44 insertions(+), 2 deletions(-)
>  create mode 100644 package/libarchive/0001-Do-something-sensible-for-empty-strings-to-make-fuzz.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
