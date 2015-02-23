From: Nicolas Cavallari <Nicolas.Cavallari@green-communications.fr>
Date: Mon, 23 Feb 2015 12:23:17 +0100
Subject: [Buildroot] [PATCH 6/7] libsigrok: enable building C++ bindings
In-Reply-To: <20150220193035.7f90d46f@free-electrons.com>
References: <1424435342-2188-1-git-send-email-bgolaszewski@baylibre.com>
 <1424435342-2188-7-git-send-email-bgolaszewski@baylibre.com>
 <20150220193035.7f90d46f@free-electrons.com>
Message-ID: <54EB0DA5.1040406@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 20/02/2015 19:30, Thomas Petazzoni wrote:
> Moreover, you make this apparently depend on the selected C library.
> But isn't C++11 support purely a gcc problem ?

This software uses std::stod, which suffers from the same problem as
std::to_string with uclibc : GCC currently requires a lot more than
necessary to enable it.

https://gcc.gnu.org/bugzilla/show_bug.cgi?id=58393

So it's just a matter of updating buildroot's
850-libstdcxx-uclibc-c99.patch. Again.
