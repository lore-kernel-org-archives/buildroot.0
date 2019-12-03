From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 3 Dec 2019 22:44:26 +0100
Subject: [Buildroot] [PATCH 1/1] board: Add support for nautilus
 chromebook
In-Reply-To: <20191120231927.788e22af@windsurf.home>
References: <20191119213121.165863-1-swboyd@chromium.org>
 <20191120231927.788e22af@windsurf.home>
Message-ID: <2a455525-0306-1922-03a7-14394e7498a5@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 20/11/2019 23:19, Thomas Petazzoni wrote:
>> +	partition kernel {
>> +		image = "Image.kpart"
>> +		bootable = "true"
>> +		partition-type-uuid = FE3A2A5D-4F32-41A7-B725-ACCC3285A309
> Just curious, the UUID needs to be exactly that one for the
> bootloader/firmware to pick up the kernel image from there ?

 Since nobody else responded to this: in GPT, the partition type UUID is the
equivalent of the 1-byte partition type in good old MBR. In [1] you can find
that this GUID is for Chrome OS kernel. So yes, I guess the bootloader searches
for a partition with that GUID.

 Regards,
 Arnout

[1] https://en.wikipedia.org/wiki/GUID_Partition_Table#Partition_type_GUIDs
