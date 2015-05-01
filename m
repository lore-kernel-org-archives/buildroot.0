From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 01 May 2015 14:02:08 +0200
Subject: [Buildroot] [PATCH 0/8] configs: defconfigs for Atmel boards
In-Reply-To: <20150501093459.1814ec0f@free-electrons.com>
References: <1430398311-10804-1-git-send-email-alexandre.belloni@free-electrons.com>
 <CAMQcK5JsC7TpJ5pdWmF-6m8zUa0_gXKYUBWQwWEA0-tx2uONQw@mail.gmail.com>
 <20150501093459.1814ec0f@free-electrons.com>
Message-ID: <55436B40.3030007@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/01/15 09:34, Thomas Petazzoni wrote:
> Ryan, Alex,
> 
> On Thu, 30 Apr 2015 09:33:50 -0500, Ryan Barnett wrote:
> 
>> Since you are moving all of the Atmel boards to use NAND boot
>> configuration, it would be good to have a 'README' that explains how
>> to load the boards utilizing the SAM-BA tool (it appears all the NAND
>> configurations are using this). At minimum it would be to point to
>> Linux4SAM wiki for loading instructions.
> 
> Fully agreed.
> 
> Alexandre, please also include generating a NAND capable filesystem
> image as part of those defconfig, so that they can easily be
> flashed/used on the boards. I guess UBI images is going to be the most
> appropriate solution. But clearly, such defconfigs should not generate
> just a tarball.

 Actually, I think it's better to use SD card images where possible.

- If you're using it just for experimentation, then the SD card is a much more
flexible and less risky way to experiment. Personally, I even prefer
kernel-linked-with-initramfs (and DTB) images, since that's just a single file
and it automatically gives you the rest of the SD card as a FAT partition.

- If you want to use it for an actual product (prototype), then you're anyway
going to have to study in a bit more detail how the flash works and you'll
probably want to do a slightly more complicated flash partitioning.


 That said, I do think it's really useful to have those tcl scripts for using
SAM-BA.


 And of course, since I never use the defconfigs myself, my opinion is probably
not that important.


 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
