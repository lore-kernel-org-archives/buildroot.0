From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Dec 2014 20:49:49 +0100
Subject: [Buildroot] Using external toolchain
In-Reply-To: <CALo-6+gkiNsQ-3151+wsfqGsr9tjOhyQGGveKU7ZwsYkX9RMqw@mail.gmail.com>
References: <CALo-6+iOGt+y1JjC8AaJ3vpck_tb1h7ZTSAd3LBcypfwGCZRfg@mail.gmail.com>
 <20141220161011.48833511@free-electrons.com>
 <CALo-6+gkiNsQ-3151+wsfqGsr9tjOhyQGGveKU7ZwsYkX9RMqw@mail.gmail.com>
Message-ID: <20141223204949.58a5ff74@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Charles Krinke,

On Tue, 23 Dec 2014 10:32:11 -0800, Charles Krinke wrote:

> loginutils/passwd.c: In function 'passwd_main':
> loginutils/passwd.c:93:16: error: storage size of 'rlimit_fsize' isn't known
>   struct rlimit rlimit_fsize;
>                 ^
> loginutils/passwd.c:180:2: warning: implicit declaration of function
> 'setrlimit' [-Wimplicit-function-declaration]
>   setrlimit(RLIMIT_FSIZE, &rlimit_fsize);
>   ^
> loginutils/passwd.c:180:12: error: 'RLIMIT_FSIZE' undeclared (first use in
> this function)

Too old Busybox. Please make sure you have a version that has at least
http://git.buildroot.net/busybox/commit/loginutils/passwd.c?id=c5fe9f7b723f949457263ef8e22ab807d5b549ce.

You should *really* consider updating. By using a 3 years old
Buildroot, with 3 years old upstream software, you are going to face
zillions of issues that have already been fixed since 2+ years, like
this passwd.c build problem. This very problem is an excellent
illustration of why sticking with such old versions is a bad decision.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
