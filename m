From: Max Filippov <jcmvbkbc@gmail.com>
Date: Tue, 13 May 2014 01:05:28 +0400
Subject: [Buildroot] [PATCH 0/2] xtensa binutils fixes backports
In-Reply-To: <1399503065-18819-1-git-send-email-jcmvbkbc@gmail.com>
References: <1399503065-18819-1-git-send-email-jcmvbkbc@gmail.com>
Message-ID: <CAMo8Bf+NTxK-PDG4cYR36h2tFcLSnmv9seEoLcfirYKjb+x0Fg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Thu, May 8, 2014 at 2:51 AM, Max Filippov <jcmvbkbc@gmail.com> wrote:
> Hi Thomas,
>
> this series backports two fixes for binutils:
> - first fixes call target misalignment during link-time relaxation often
>   seen with linux kernel builds;
> - second fixes 'overflow after relaxation' link-time error recently seen
>   with some buildroot packages.
>
> Max Filippov (2):
>   binutils: backport first section frag alignment fix for xtensa gas
>   binutils: backport R_XTENSA_DIFF* relocation signedness fix
>
>  .../2.22/901-xtensa-gas-first-frag-alignment.patch |  51 ++++++++
>  .../902-xtensa-gas-ld-diff-relocation-signed.patch | 133 +++++++++++++++++++++
>  .../901-xtensa-gas-first-frag-alignment.patch      |  51 ++++++++
>  .../902-xtensa-gas-ld-diff-relocation-signed.patch | 133 +++++++++++++++++++++
>  .../901-xtensa-gas-first-frag-alignment.patch      |  51 ++++++++
>  .../902-xtensa-gas-ld-diff-relocation-signed.patch | 133 +++++++++++++++++++++
>  .../2.24/901-xtensa-gas-first-frag-alignment.patch |  51 ++++++++
>  .../902-xtensa-gas-ld-diff-relocation-signed.patch | 133 +++++++++++++++++++++
>  8 files changed, 736 insertions(+)
>  create mode 100644 package/binutils/2.22/901-xtensa-gas-first-frag-alignment.patch
>  create mode 100644 package/binutils/2.22/902-xtensa-gas-ld-diff-relocation-signed.patch
>  create mode 100644 package/binutils/2.23.1/901-xtensa-gas-first-frag-alignment.patch
>  create mode 100644 package/binutils/2.23.1/902-xtensa-gas-ld-diff-relocation-signed.patch
>  create mode 100644 package/binutils/2.23.2/901-xtensa-gas-first-frag-alignment.patch
>  create mode 100644 package/binutils/2.23.2/902-xtensa-gas-ld-diff-relocation-signed.patch
>  create mode 100644 package/binutils/2.24/901-xtensa-gas-first-frag-alignment.patch
>  create mode 100644 package/binutils/2.24/902-xtensa-gas-ld-diff-relocation-signed.patch

could you please also review/ack this series?

-- 
Thanks.
-- Max
