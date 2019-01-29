From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 29 Jan 2019 22:54:14 +0100
Subject: [Buildroot] [PATCH] package/libarchive: add four security
 patches
In-Reply-To: <20190125185053.4882-1-patrickdepinguin@gmail.com> (Thomas De
 Schampheleire's message of "Fri, 25 Jan 2019 19:50:52 +0100")
References: <20190125185053.4882-1-patrickdepinguin@gmail.com>
Message-ID: <875zu73zax.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

 > From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
 > Add backported patches for the following four security issues in libarchive.
 > There is no new release yet including these patches.

 > - CVE-2018-1000877 (https://nvd.nist.gov/vuln/detail/CVE-2018-1000877)

 > "libarchive version commit 416694915449219d505531b1096384f3237dd6cc onwards
 > (release v3.1.0 onwards) contains a CWE-415: Double Free vulnerability in
 > RAR decoder - libarchive/archive_read_support_format_rar.c, parse_codes(),
 > realloc(rar->lzss.window, new_size) with new_size = 0 that can result in
 > Crash/DoS. This attack appear to be exploitable via the victim must open a
 > specially crafted RAR archive."

 > - CVE-2018-1000878 (https://nvd.nist.gov/vuln/detail/CVE-2018-1000878)

 > "libarchive version commit 416694915449219d505531b1096384f3237dd6cc onwards
 > (release v3.1.0 onwards) contains a CWE-416: Use After Free vulnerability in
 > RAR decoder - libarchive/archive_read_support_format_rar.c that can result
 > in Crash/DoS - it is unknown if RCE is possible. This attack appear to be
 > exploitable via the victim must open a specially crafted RAR archive."

 > - CVE-2018-1000879 (https://nvd.nist.gov/vuln/detail/CVE-2018-1000879)

 > "libarchive version commit 379867ecb330b3a952fb7bfa7bffb7bbd5547205 onwards
 > (release v3.3.0 onwards) contains a CWE-476: NULL Pointer Dereference
 > vulnerability in ACL parser - libarchive/archive_acl.c,
 > archive_acl_from_text_l() that can result in Crash/DoS. This attack appear
 > to be exploitable via the victim must open a specially crafted archive
 > file."

 > - CVE-2018-1000880 (https://nvd.nist.gov/vuln/detail/CVE-2018-1000880)

 > "libarchive version commit 9693801580c0cf7c70e862d305270a16b52826a7 onwards
 > (release v3.2.0 onwards) contains a CWE-20: Improper Input Validation
 > vulnerability in WARC parser -
 > libarchive/archive_read_support_format_warc.c, _warc_read() that can result
 > in DoS - quasi-infinite run time and disk usage from tiny file. This attack
 > appear to be exploitable via the victim must open a specially crafted WARC
 > file."

 > Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

Committed to 2018.02.x and 2018.11.x, thanks.

-- 
Bye, Peter Korsgaard
