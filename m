From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Fri, 5 Mar 2021 20:23:09 +0100
Subject: [Buildroot] [PATCH 0/2] package/belle-sip: work around bug 99410
In-Reply-To: <20210305151529.3477575-1-giulio.benetti@benettiengineering.com>
References: <20210305151529.3477575-1-giulio.benetti@benettiengineering.com>
Message-ID: <b67310b8-e253-fb2e-234a-5947d0b17002@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sorry but this patchset is not correct, that is not a gcc bug but a 
binutils bug, specifically:
https://sourceware.org/bugzilla/show_bug.cgi?id=27243

So going to rename and send a v2 patchset.

Best regards
-- 
Giulio Benetti
Benetti Engineering sas

On 3/5/21 4:15 PM, Giulio Benetti wrote:
> This pachset introduces gcc bug 99410 and uses it work around package
> belle-sip.
> 
> Giulio Benetti (2):
>    toolchain: introduce BR2_TOOLCHAIN_HAS_GCC_BUG_99410
>    package/belle-sip: fix build failure due to gcc bug 99410
> 
>   package/belle-sip/belle-sip.mk | 8 ++++++++
>   toolchain/Config.in            | 7 +++++++
>   2 files changed, 15 insertions(+)
> 
