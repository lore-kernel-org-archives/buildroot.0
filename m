From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 10 Mar 2020 23:45:13 +0100
Subject: [Buildroot] [PATCH] package/libexif: add post-0.6.21 upstream
 security fixes
In-Reply-To: <20200208150713.9635-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sat, 8 Feb 2020 16:07:13 +0100")
References: <20200208150713.9635-1-peter@korsgaard.com>
Message-ID: <875zfbn81y.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issues:
 > - CVE-2016-6328: A vulnerability was found in libexif.  An integer overflow
 >   when parsing the MNOTE entry data of the input file.  This can cause
 >   Denial-of-Service (DoS) and Information Disclosure (disclosing some
 >   critical heap chunk metadata, even other applications' private data).

 > - CVE-2017-7544: libexif through 0.6.21 is vulnerable to out-of-bounds heap
 >   read vulnerability in exif_data_save_data_entry function in
 >   libexif/exif-data.c caused by improper length computation of the allocated
 >   data of an ExifMnote entry which can cause denial-of-service or possibly
 >   information disclosure.

 > - CVE-2018-20030: An error when processing the EXIF_IFD_INTEROPERABILITY and
 >   EXIF_IFD_EXIF tags within libexif version 0.6.21 can be exploited to
 >   exhaust available CPU resources.

 > - CVE-2019-9278: In libexif, there is a possible out of bounds write due to
 >   an integer overflow.  This could lead to remote escalation of privilege in
 >   the media content provider with no additional execution privileges needed.
 >   User interaction is needed for exploitation.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2019.02.x and 2019.11.x, thanks.

-- 
Bye, Peter Korsgaard
