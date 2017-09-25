From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 25 Sep 2017 23:41:26 +0200
Subject: [Buildroot] [PATCH 1/1] [RFC] mvebu_espressobin-88f3720 : Add
 support for espressobin
In-Reply-To: <8132918e-ebf8-dbf6-72e9-c10ed675d962@gmail.com>
References: <1506290733-6042-1-git-send-email-chevalliersebmax@gmail.com>
 <1506290733-6042-2-git-send-email-chevalliersebmax@gmail.com>
 <8132918e-ebf8-dbf6-72e9-c10ed675d962@gmail.com>
Message-ID: <5c6b0144-03fd-93e1-bea8-e10c0de4f196@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 25-09-17 23:02, Romain Naour wrote:
> Hi Maxime,
> 
> Le 25/09/2017 ? 00:05, Maxime Chevallier a ?crit?:
>> Add support for the Globalscale 'Espressobin' board based
>> on Marvell Armada 3720.
>>
>> This board has a dual Cortex-A53, 1GB DDR3, USBs, ethernets,
>> and some GPIO ports. More informations on the vendor site :
>> http://espressobin.net/tech-spec/
>>
>> This config uses the mainline linux support for the board and
>> the buildroot toolchain using glibc, since uclibc does not
>> support aarch64.
>>
>> Mainline device-tree does not include SDCard support yet, so USB
>> is the preferred way to boot the image, using the default pre-flashed
>> u-boot on SPI NOR.
> Usually we use configs or board in the commit title.
> 
> "board: Add support for espressobin 88f3720" should be enough.
> 
> Otherwise, looks good for me as is.

 Indeed, looks good to me as well.

 I don't like the name much, though. Isn't globalscale_espressobin_defconfig
more appropriate?

> 
> Linux 4.14-rc2 is out, do you know if the SDCard support has been added in this
> release?
> 
> Maybe you can also add a new entry in .gitlab-ci.yml file for CI testing in gitlab.
> (see .gitlab-ci.yml.in to regenerate this file). But this can be done in a
> follow up patch.

 No, this is not optional, it *must* be added otherwise we get errors from CI
(well, except that the gitlab sync is currently broken). Just run
'make .gitlab-ci.yml'.


 Regards,
 Arnout

[snip]
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
