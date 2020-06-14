From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 14 Jun 2020 19:30:31 +0200
Subject: [Buildroot] [PATCH 1/1] package/icu: bump version to 67-1
References: <20200613163031.2566037-1-bernd.kuhls@t-online.de>
 <20200614163537.GF2346@scaer>
Message-ID: <ne3irgx7eb.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Sun, 14 Jun 2020 18:35:37 +0200 schrieb Yann E. MORIN:

> This is already causing some issues in the autobuilders:
> 
>     http://autobuild.buildroot.org/results/
6d2/6d2658a3c165c99df3eae87b2970e738bd386245/
> 
>     utext.cpp:572:5: error: 'max_align_t' in namespace 'std' does not
>     name a type
>          std::max_align_t    extension;
>          ^
> 
> and assorted issues.

Hi Yann,

it looks like we need to bump the minimum gcc version of icu to 4.9:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=56019#c3

Adding

ICU_CONF_ENV += \
       CFLAGS="$(TARGET_CFLAGS) -std=c11" \
       CXXFLAGS="$(TARGET_CXXFLAGS) -std=c++11"

does not fix the problem.

Regards, Bernd
