From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 26 May 2020 11:23:44 +0200
Subject: [Buildroot] [PATCH 1/1] package/lrzip: security bump to
 8781292dd5833c04eeead51d4a5bd02dc6432dc7
In-Reply-To: <20200516081938.642974-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 16 May 2020 10:19:38 +0200")
References: <20200516081938.642974-1-fontaine.fabrice@gmail.com>
Message-ID: <87r1v7gicf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Bump to latest upstream commit as it fixes a huge number of CVEs. Some
 > of them can't be linked to a given commit (e.g.
 > https://github.com/ckolivas/lrzip/issues/67). Moreover, upstream does
 > not plan to tag a new release any time soon:
 > https://github.com/ckolivas/lrzip/issues/99

 > - Fix CVE-2017-8842: The bufRead::get() function in libzpaq/libzpaq.h in
 >   liblrzip.so in lrzip 0.631 allows remote attackers to cause a denial
 >   of service (divide-by-zero error and application crash) via a crafted
 >   archive.
 > - Fix CVE-2017-8843: The join_pthread function in stream.c in
 >   liblrzip.so in lrzip 0.631 allows remote attackers to cause a denial
 >   of service (NULL pointer dereference and application crash) via a
 >   crafted archive.
 > - Fix CVE-2017-8844: The read_1g function in stream.c in liblrzip.so in
 >   lrzip 0.631 allows remote attackers to cause a denial of service
 >   (heap-based buffer overflow and application crash) or possibly have
 >   unspecified other impact via a crafted archive.
 > - Fix CVE-2017-8845: The lzo1x_decompress function in lzo1x_d.ch in LZO
 >   2.08, as used in lrzip 0.631, allows remote attackers to cause a
 >   denial of service (invalid memory read and application crash) via a
 >   crafted archive.
 > - Fix CVE-2017-8846: The read_stream function in stream.c in
 >   liblrzip.so in lrzip 0.631 allows remote attackers to cause a denial
 >   of service (use-after-free and application crash) via a crafted
 >   archive.
 > - Fix CVE-2017-8847: The bufRead::get() function in libzpaq/libzpaq.h in
 >   liblrzip.so in lrzip 0.631 allows remote attackers to cause a denial
 >   of service (NULL pointer dereference and application crash) via a
 >   crafted archive.
 > - Fix CVE-2017-9928: In lrzip 0.631, a stack buffer overflow was found
 >   in the function get_fileinfo in lrzip.c:979, which allows attackers to
 >   cause a denial of service via a crafted file.
 > - Fix CVE-2017-9929: In lrzip 0.631, a stack buffer overflow was found
 >   in the function get_fileinfo in lrzip.c:1074, which allows attackers
 >   to cause a denial of service via a crafted file.
 > - Fix CVE-2018-5747: In Long Range Zip (aka lrzip) 0.631, there is a
 >   use-after-free in the ucompthread function (stream.c). Remote
 >   attackers could leverage this vulnerability to cause a denial of
 >   service via a crafted lrz file.
 > - Fix CVE-2018-11496: In Long Range Zip (aka lrzip) 0.631, there is a
 >   use-after-free in read_stream in stream.c, because decompress_file in
 >   lrzip.c lacks certain size validation.

 > Also:
 >  - update indentation of hash file (two spaces)
 >  - drop patch (already in version)
 >  - manage host-nasm dependency which is enabled by default and has been
 >    fixed by:
 >    https://github.com/ckolivas/lrzip/commit/9f16f65705e2f1e11c41647405adcce6a12d286c

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard
