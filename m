From: Max Filippov <jcmvbkbc@gmail.com>
Date: Fri, 8 May 2020 01:31:32 -0700
Subject: [Buildroot] [PATCH] package/binutils: fix XTENSA_NDIFF handling
 for PR ld/25861
In-Reply-To: <74b3c3ee-67e4-d3e0-0cf8-82e064ebfb00@gmail.com>
References: <20200430050822.32017-1-jcmvbkbc@gmail.com>
 <bfdb477a-cf89-21d4-c42c-e5a405b2edf3@gmail.com>
 <74b3c3ee-67e4-d3e0-0cf8-82e064ebfb00@gmail.com>
Message-ID: <CAMo8BfKCYu9aSMn-3F2Cy8Sj7nJvGo4eHzM=gx2QgUmQjGNTyw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Romain,

On Thu, May 7, 2020 at 2:10 PM Romain Naour <romain.naour@gmail.com> wrote:
> It seems elf2flt used by qemu_xtensa_lx60_nommu_defconfig doesn't support
> R_XTENSA_PDIFF32:
>
>   elf2flt: 267 bad relocs
>
> https://gitlab.com/kubu93/buildroot/-/jobs/543293510

Thanks for the report. Proposed fix:
https://github.com/uclinux-dev/elf2flt/pull/18

-- 
Thanks.
-- Max
