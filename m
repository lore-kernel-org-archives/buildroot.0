From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Fri, 12 Jan 2018 20:21:56 -0600
Subject: [Buildroot] [PATCH v2] kvm-unit-tests: test for rdseed/rdrand
In-Reply-To: <20180112231711.16d6b77d@windsurf.lan>
References: <1515499487-29937-1-git-send-email-matthew.weber@rockwellcollins.com>
 <20180112231711.16d6b77d@windsurf.lan>
Message-ID: <CANQCQpbDsu6n0v=jg1Bs=MHSSxvYgUVnVJvQBcMhJc3CGcHMQg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Fri, Jan 12, 2018 at 4:17 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
>>
>>>> kvm-unit-tests kvm-unit-tests-20171020 Configuring
> cd /home/test/buildroot/output/build/kvm-unit-tests-kvm-unit-tests-20171020 && ./configure --arch="x86_64" --processor="" --endian="little"
> Checking for rdseed/rdrand... No.
>
> but the CFLAGS you assign have no effect. And indeed you assign CFLAGS,
> but there's nothing that actually uses the CFLAGS set by the configure
> script.
>
> In fact, you can perfectly test this on your side: just introduce a
> stupid typo in the rdseed test program that makes it fail to build
> unconditionally, and verify that the NO_RDSEEDRAND define really exists
> when the C file is built.
>

Ah shoot, correct they force CFLAGS to empty.  Fixed in v2 and I typo
tested it successfully.
https://patchwork.ozlabs.org/patch/860274/

Matt
