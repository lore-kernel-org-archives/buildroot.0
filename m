From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 3 Dec 2019 21:46:28 +0100
Subject: [Buildroot] [PATCHv2 1/2] configs/raspberrypi: change
 deprecated pi3-miniuart-bt option to miniuart-bt
In-Reply-To: <20191203211204.6c4951f4@gmx.net>
References: <20191203132658.863709-1-arthur.courtel@smile.fr>
 <20191203211204.6c4951f4@gmx.net>
Message-ID: <d4430993-aaee-7cf4-9290-cb8547022fee@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 03/12/2019 21:12, Peter Seiderer wrote:
> Hello Arthur,
> 
> thanks for the patch, one nitpick below...
> 
> On Tue,  3 Dec 2019 14:26:57 +0100, Arthur Courtel <arthur.courtel@smile.fr> wrote:
> 
>> This option will be used in RPI4 config in order to have a working serial port on gpios.
>> This change makes this option not only RPI3 specific.
>>
>> Signed-off-by: Arthur Courtel <arthur.courtel@smile.fr>
>> ---
>>  board/raspberrypi/post-image.sh      | 8 ++++----
>>  board/raspberrypi/readme.txt         | 2 +-
>>  configs/raspberrypi3_64_defconfig    | 2 +-
>>  configs/raspberrypi3_defconfig       | 2 +-
>>  configs/raspberrypi3_qt5we_defconfig | 2 +-
>>  configs/raspberrypi4_defconfig       | 2 +-
>>  6 files changed, 9 insertions(+), 9 deletions(-)
>>
>> diff --git a/board/raspberrypi/post-image.sh b/board/raspberrypi/post-image.sh
>> index bbeb0bc721..9dbd98ef9b 100755
>> --- a/board/raspberrypi/post-image.sh
>> +++ b/board/raspberrypi/post-image.sh
>> @@ -10,13 +10,13 @@ GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
>>  for arg in "$@"
>>  do
>>  	case "${arg}" in
>> -		--add-pi3-miniuart-bt-overlay)
>> +		--add-miniuart-bt-overlay)
> Maybe keep additional the legacy '--add-pi3-miniuart-bt-overlay' option for people
> using old custom config files?

 I don't think we need to do that. Everything in board/ is supposed to be
internal. If you use one of our defconfigs as inspiration for your own custom
config, you should copy all the support stuff as well.

 Regards,
 Arnout
