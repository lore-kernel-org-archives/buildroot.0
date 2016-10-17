From: Joao Pinto <Joao.Pinto@synopsys.com>
Date: Mon, 17 Oct 2016 11:57:46 +0100
Subject: [Buildroot] [PATCH v4 1/3] vexpress-firmware: new package
In-Reply-To: <20161015125037.4a17bad5@free-electrons.com>
References: <1476518623-30654-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1476518623-30654-2-git-send-email-thomas.petazzoni@free-electrons.com>
 <20161015125037.4a17bad5@free-electrons.com>
Message-ID: <146c0c9f-abaf-d766-f4b2-5abc469fc89e@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi Thomas and Yann,

Thanks for the review and extra-effort.

Joao

On 10/15/2016 11:50 AM, Thomas Petazzoni wrote:
> Hello,
> 
> On Sat, 15 Oct 2016 10:03:41 +0200, Thomas Petazzoni wrote:
>> From: Joao Pinto <jpinto@synopsys.com>
>>
>> This commit adds a new package for the SCP (System Control Processor)
>> firmware for the ARM reference platforms. There will most likely be
>> other SCP firmware provided by other vendors, but they might be provided
>> in a different form, so we for now create a vendor-specific package
>> named vexpress-firmware.
>>
>> Since this firmware is used for booting, we create the package in boot/
>> and not in package/.
>>
>> The package simply installs a single pre-built binary file into the
>> images directory.
>>
>> Signed-off-by: Joao Pinto <jpinto@synopsys.com>
>> [Thomas:
>>  - Rename the package from scpfirmware to vexpress-firmware.
>>  - Add a Config.in prompt for the package.
>>  - Remove the prompt-less Config.in options to select the Git repo and
>>    version. Since we only support the Vexpress firmware, there's no need
>>    for configurability here, so we just use the right Git repo/version
>>    in the .mk file.
>>  - Use $(INSTALL) -D to install the firmware file.
>>  - Add license information.]
>> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>> ---
>>  boot/Config.in                              |  1 +
>>  boot/vexpress-firmware/Config.in            |  6 ++++++
>>  boot/vexpress-firmware/vexpress-firmware.mk | 20 ++++++++++++++++++++
>>  3 files changed, 27 insertions(+)
>>  create mode 100644 boot/vexpress-firmware/Config.in
>>  create mode 100644 boot/vexpress-firmware/vexpress-firmware.mk
> 
> Applied to master, after adding a hash file, as suggested by Yann.
> 
> Thomas
> 
