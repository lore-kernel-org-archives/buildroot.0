From: =?UTF-8?Q?Micka=c3=abl_Tansorier?= <mickael.tansorier@smile.fr>
Date: Mon, 22 Jul 2019 09:07:42 +0200
Subject: [Buildroot] fitImage: proposal to sign images into fitImage
Message-ID: <994ab8c3-bf81-2b91-946a-8281105bfc36@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

In project, I worked to add option in builroot to sign kernel and 
devicetree image for fitImage.

Uboot support fitImage signature check, but buildroot have no option to 
build fitImage with specific signature.

I would like to propose patch, but I'm not sure about the best practice 
to do that. Have you any suggestion ?
I can send you my patch (draft) to improve it.

My idea is to add variables to get path of `its` file, `dts` to describe 
public key for uboot, and server where to download keys to sign in 
Config.in.
Then in `uboot.mk`:
  - I download keys
  - I replace kernel name, dtb name, and keys name in `its` file. (To 
get right path to its).
  - I replace keys name in `dts` file
  - I compile `dts` to `dtb` with space to add pubic key
  - I compile fitImage with `mkimage`

It could be find if this can be generic.

I appreciate if any of you have idea or suggertion.

Thank.

Regards.
-- 
Tansorier Micka?l

Smile ECS / OpenWide Ing?nierie
D?l?gu? du Personnel pour l'agence de Nantes

[Pr?serve ta libert?: https://gafam.laquadrature.net/]
