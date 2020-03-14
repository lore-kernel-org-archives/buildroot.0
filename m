From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 14 Mar 2020 18:39:16 +0100
Subject: [Buildroot] [PATCH v2,
 1/3] package/libarchive: security bump to version 3.4.2
In-Reply-To: <20200228221236.1982482-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Fri, 28 Feb 2020 23:12:34 +0100")
References: <20200228221236.1982482-1-fontaine.fabrice@gmail.com>
Message-ID: <87pndeu98b.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > - Fix CVE-2020-9308: archive_read_support_format_rar5.c in libarchive
 >   before 3.4.2 attempts to unpack a RAR5 file with an invalid or
 >   corrupted header (such as a header size of zero), leading to a SIGSEGV
 >   or possibly unspecified other impact.
 > - Add new mbedtls optional dependency and use --with-nettle to enable
 >   nettle support, see
 >   https://github.com/libarchive/libarchive/commit/f96a71144b7725ca4a94d84bd27d7dca8c2f58d2

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 > Changes v1 -> v2:
 >  - Add --without-mbedtls to host variant

Committed to 2019.11.x, thanks.

According to https://security-tracker.debian.org/tracker/CVE-2020-9308,
the rar5 support was only added in 3.4.0, so the 3.3.3 version we have
in 2019.02.x is not affected.

-- 
Bye, Peter Korsgaard
