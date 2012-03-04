From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 4 Mar 2012 12:00:21 +0100
Subject: [Buildroot] Buildroot shared uclibc native compiler only links
	statically
In-Reply-To: <CAGmOteOykAc56k3F1w9Km+6FJ5wzM9WKTvyGWSxRCb7yZv2cew@mail.gmail.com>
References: <CAGmOteOykAc56k3F1w9Km+6FJ5wzM9WKTvyGWSxRCb7yZv2cew@mail.gmail.com>
Message-ID: <201203041200.21575.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sunday 04 March 2012 09:03:58 PHilip RUshik wrote:
> Hello,
> If I build a buildroot system with uClibc as a shared library and with a
> native compiler, the resulting native compiler works great most of the
> time, but it always links with the static libc.a instead of the shared
> library. Why does this happen, anybody know how to fix that?

 This has just been solved on the list (but no patch is committed yet).
Basically, the problem is that the symlink of /usr/lib/libc.so to 
/lib/libc.so.0 isn't included in the target directory.

 As a workaround, you can create that link manually:
ln -s /lib/libc.so.0 target/usr/lib/libc.so


 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
