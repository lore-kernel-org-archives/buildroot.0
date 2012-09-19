From: Belisko Marek <marek.belisko@gmail.com>
Date: Wed, 19 Sep 2012 22:08:20 +0200
Subject: [Buildroot] [PATCH] Add package raspberrypi-firmware.
In-Reply-To: <505A21D6.7060808@mind.be>
References: <1347914057-20287-1-git-send-email-marek.belisko@open-nandra.com>
 <5058EF56.3070208@mind.be>
 <CALR4fEJzZPa+CAeCvuFrFZoNwO562+6_LDEM8xP2a15dy1YJuA@mail.gmail.com>
 <CAAfyv365AxzAfJSP3rnhbgKoDKMq19AyUnZkkSW54uerXCOYTg@mail.gmail.com>
 <505A21D6.7060808@mind.be>
Message-ID: <CAAfyv36do0+Cf+ZYyj67Sypt13UzfM2TRyx9-Pwq_28fVgsWsw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Wed, Sep 19, 2012 at 9:49 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 09/19/12 10:09, Belisko Marek wrote:
>>
>> On Wed, Sep 19, 2012 at 9:59 AM, Diego Iastrubni<diegoiast@gmail.com>
>> wrote:
>>>
>>> On Wed, Sep 19, 2012 at 1:01 AM, Arnout Vandecappelle<arnout@mind.be>
>>> wrote:
>>>>>
>>>>>
>>>>> +define RASPBERRYPI_FIRMWARE_INSTALL_TARGET_BOOTLOADER
>>>>> +       if [ ! -d "$(TARGET_DIR)/boot" ]; then \
>>>>> +               mkdir $(TARGET_DIR)/boot; \
>>>>> +       fi; \
>>>>
>>>>
>>>>
>>>>   Just "mkdir -p $(TARGET_DIR)/boot".  Or even better, replace the cp
>>>> below with
>>>>          install -D -m 0644<fromfile>  <tofile>
>>>>
>>>>
>>>
>>> Wait... this implies that /boot/ is on the rootfs... ext2... and rbpi
>>> demands that the "boot" partition will be vfat.. right? What am I
>>> missing?
>>
>> My mistake, this shouldn't got to $(TARGET_DIR) but to $(IMAGES_DIR)
>> which will then can be copied by user to FAT partition of SD card
>> necessary for booting.
>> There is no need to have it in rootfs/boot.
>
>
>  Shouldn't all images be in that boot directory, then?  Or rather, doesn't
> it make more sense to place the bootfiles directly in the images dir?
Idea behind /boot directory was to copy raspberrypi booloader files +
config file +
kernel cmdline file + kernel bzImage to  that directory and compress it
to output/images/boot.tar.gz (probably in post-build.sh script)
directory to make it
more user friendly (avoid manually copy files from different parts of
buildroot).

>
>  Regards,
>  Arnout
>
> --
> Arnout Vandecappelle                               arnout at mind be
> Senior Embedded Software Architect                 +32-16-286540
> Essensium/Mind                                     http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F

Cheers,

marek

-- 
as simple and primitive as possible
-------------------------------------------------
Marek Belisko - OPEN-NANDRA
Freelance Developer

Ruska Nova Ves 219 | Presov, 08005 Slovak Republic
Tel: +421 915 052 184
skype: marekwhite
twitter: #opennandra
web: http://open-nandra.com
