From: =?UTF-8?Q?Beno=C3=AEt_Mauduit?= <benoit.mauduit@gmail.com>
Date: Mon, 28 Mar 2011 16:33:25 +0200
Subject: [Buildroot] [Bug 3511] New: make busybox-menuconfig does not
 download busybox package
In-Reply-To: <bug-3511-163@https.bugs.busybox.net/>
References: <bug-3511-163@https.bugs.busybox.net/>
Message-ID: <AANLkTim7uk2BJeqB8Y3kjHX5pAOGfuKKog80arp1=8Zn@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Mar 28, 2011 at 2:16 PM,  <bugzilla@busybox.net> wrote:
> https://bugs.busybox.net/show_bug.cgi?id=3511
>
> ? ? ? ? ? Summary: make busybox-menuconfig does not download busybox
> ? ? ? ? ? ? ? ? ? ?package
> ? ? ? ? ? Product: buildroot
> ? ? ? ? ? Version: unspecified
> ? ? ? ? ?Platform: PC
> ? ? ? ?OS/Version: Linux
> ? ? ? ? ? ?Status: NEW
> ? ? ? ? ?Severity: minor
> ? ? ? ? ?Priority: P5
> ? ? ? ? Component: Other
> ? ? ? ?AssignedTo: unassigned at buildroot.uclibc.org
> ? ? ? ?ReportedBy: dmitry at radiofid.ru
> ? ? ? ? ? ? ? ?CC: buildroot at uclibc.org
> ? Estimated Hours: 0.0
>
>
> 'make busybox-menuconfig' does not download busybox package, while 'make
> linux26-menuconfig' and 'make uclibc-menuconfig' do. Workaround is to call
> 'make busybox' (which fails since no crosscompiler is available yet) and repeat
> 'make busybox-menuconfig'.
> ...

It's because busybox use GENTARGET mechanism, and stamp.extracted
rules doesn't depend on stamp.downloaded. (Which it's the case for
linux.mk)

However, you can run : 'make busybox-source'.

-- 
Beno?t Mauduit
