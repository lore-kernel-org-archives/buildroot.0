From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 16 Oct 2017 23:51:51 +0200
Subject: [Buildroot] [PATCH] libzip: security bump to version 1.3.0
In-Reply-To: <20170907212133.10036-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Thu, 7 Sep 2017 23:21:33 +0200")
References: <20170907212133.10036-1-peter@korsgaard.com>
Message-ID: <87po9mu5fs.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issues:
 > CVE-2017-12858: Double free vulnerability in the _zip_dirent_read function
 > in zip_dirent.c in libzip allows attackers to have unspecified impact via
 > unknown vectors.

 > CVE-2017-14107: The _zip_read_eocd64 function in zip_open.c in libzip before
 > 1.3.0 mishandles EOCD records, which allows remote attackers to cause a
 > denial of service (memory allocation failure in _zip_cdir_grow in
 > zip_dirent.c) via a crafted ZIP archive.

 > For more details, see
 > https://blogs.gentoo.org/ago/2017/09/01/libzip-use-after-free-in-_zip_buffer_free-zip_buffer-c/
 > https://blogs.gentoo.org/ago/2017/09/01/libzip-memory-allocation-failure-in-_zip_cdir_grow-zip_dirent-c/

 > libzip-1.3.0 also adds optional bzip2 support, so handle that.

 > While we're at it, add a hash for the license file.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2017.08.x, thanks.

-- 
Bye, Peter Korsgaard
