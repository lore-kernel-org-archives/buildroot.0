From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 25 Jan 2021 19:17:21 +0100
Subject: [Buildroot] [PATCH] package/gcc: fix gcc 8.4,
 9.4 and 10.2 for sparcv8 (ss10)
In-Reply-To: <20210121220032.460d1d9b@windsurf.home>
References: <20210120230234.2086807-1-romain.naour@gmail.com>
 <20210121220032.460d1d9b@windsurf.home>
Message-ID: <11ccc993-44c3-e822-70d8-0b7ad9d70775@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Waldemar, All,

Le 21/01/2021 ? 22:00, Thomas Petazzoni a ?crit?:
> Hello,
> 
> In the title: gcc 9.3 and not gcc 9.4.
> 
> On Thu, 21 Jan 2021 00:02:34 +0100
> Romain Naour <romain.naour@gmail.com> wrote:
> 
>> As reported on IRC by sephthir, the defconfig qemu_sparc_ss10_defconfig
>> doesn't work as expected. Instead it produce illegal instruction
>> messages.
>>
>> gcc 8.3, 9.2 are the latest working gcc version.
>> git bisect between gcc 8.4 and 8.4 allowed to identify
> 
> between gcc 8.3 and 8.4
> 
>> the commit that introcuce the regression.
>>
>> Reverting this patch allowed to produce a working rootfs.
>>
>> Fixes:
>> https://gitlab.com/buildroot.org/buildroot/-/jobs/786589934
>>
>> Signed-off-by: Romain Naour <romain.naour@gmail.com>
>> ---
>>  ...get-92095-internal-error-with-O1-mcp.patch | 325 ++++++++++++++++++
>>  ...get-92095-internal-error-with-O1-mcp.patch | 322 +++++++++++++++++
>>  ...get-92095-internal-error-with-O1-mcp.patch | 325 ++++++++++++++++++
>>  3 files changed, 972 insertions(+)
>>  create mode 100644 package/gcc/10.2.0/0002-Revert-re-PR-target-92095-internal-error-with-O1-mcp.patch
>>  create mode 100644 package/gcc/8.4.0/0002-Revert-re-PR-target-92095-internal-error-with-O1-mcp.patch
>>  create mode 100644 package/gcc/9.3.0/0005-Revert-re-PR-target-92095-internal-error-with-O1-mcp.patch
> 
> Applied with the two nits above fixed. Also, did you report this issue
> to upstream gcc ?

It's reported to upstream gcc [1] but the issue may be located in uClibc.
I'm not familiar with such topic, can you have a look?

[1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=98784

Best regards,
Romain


> 
> Thanks a lot for this investigation!
> 
> Thomas
> 
