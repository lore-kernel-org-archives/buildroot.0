From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 02 Mar 2020 21:35:31 +0000
Subject: [Buildroot] [Bug 12596] host-e2fsprogs: tune2fs incompatibility on
 older glibc version
In-Reply-To: <bug-12596-163@https.bugs.busybox.net/>
References: <bug-12596-163@https.bugs.busybox.net/>
Message-ID: <bug-12596-163-E3cVXEyT2s@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12596

--- Comment #1 from romain.naour at gmail.com ---
Hi Ryan,

I'm not sure we can do anything. Glibc guaranties only old binaries compatible
with newer version of Glibc. If you build an application with newer glibc
symbols than the version available in your host, it's not going to work.

For example, linaro toolchains needs glibc >= 2.14 because of API changes to
glibc?s memcpy API [1]

I guess it's a similar problem here for Glibc 2.25...

[1] https://releases.linaro.org/components/toolchain/binaries/latest-7/

Best regards,
Romain

-- 
You are receiving this mail because:
You are on the CC list for the bug.
