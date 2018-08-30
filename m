From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Thu, 30 Aug 2018 15:01:39 +0200
Subject: [Buildroot] [PATCH 1/3] configs/zynq_zed: uboot: bump to
 xilinx-v2018.2 (fixes build)
In-Reply-To: <20180828231552.1c693ee1@windsurf.home>
References: <20180828080059.21788-1-luca@lucaceresoli.net>
 <20180828231552.1c693ee1@windsurf.home>
Message-ID: <96b399ad-506f-4a2e-7dce-18190137721a@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On 28/08/2018 23:15, Thomas Petazzoni wrote:
> Luca, Peter,
> 
> On Tue, 28 Aug 2018 10:00:57 +0200, Luca Ceresoli wrote:
>> Bump to the most recent Xilinx release.
>>
>> Fixes:
>>   .../output/host/include/libfdt_env.h:71:30: error: conflicting types for ?fdt64_t?
>>   .../output/host/include/libfdt_env.h:91:24: error: expected ?)? before ?x?
>>   .../output/host/include/libfdt.h:150:21: error: redefinition of ?fdt_offset_ptr_w?
>> ...and many, many other similar errors.
>>
>> [Run-time tested]
>> Tested-by: Luca Ceresoli <luca@lucaceresoli.net>
>> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
>> ---
>>  configs/zynq_zed_defconfig | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> I am not sure we want to apply these updates to master, because we need
> a more general solution, and this more general solution will also fix
> the Zynq configurations.
> 
> So I would suggest that we take those patches into next, and
> implemented the more general solution in master (which could very well
> be reverting dtc).

No problem.

I had started preparing these patches when the outcome of the dtc issue
was totally unclear. Since they were working I thought I'd send them
anyway. I'm OK with committing them to master or next or even after 2018.08.

Bye,
-- 
Luca
