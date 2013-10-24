From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 24 Oct 2013 21:29:32 +0200
Subject: [Buildroot] [PATCH] uboot-tools: fix license issues
In-Reply-To: <526913FC.7070905@zacarias.com.ar>
References: <1382452676-2514-1-git-send-email-gustavo@zacarias.com.ar>
 <CAAXf6LW3ob7ev6VBpG3ajRR=aMSdgN0mM=O7a7wX2+cLd6fRBA@mail.gmail.com>
 <20131023113944.2e370a3b@skate>
 <CAAXf6LVeND62F7qgxLhcYcqw-QDy6QO+7+A7CZHB5gonp+AsTA@mail.gmail.com>
 <2e6a07b0-2c59-47f7-a320-9f4ba3ddffe2@email.android.com>
 <52691180.9070908@mind.be> <526913FC.7070905@zacarias.com.ar>
Message-ID: <5269751C.1000207@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 24/10/13 14:35, Gustavo Zacarias wrote:
> On 10/24/2013 09:24 AM, Arnout Vandecappelle wrote:
>>   Now, for the specific case of U-Boot, we can do better: if _VERSION is
>> 2013.10 or larger, we can use the new license specification, else the
>> old one (and due to U-Boot's versioning policy we can just use sort;
>> custom has to be handled separately anyway).
>
> We don't use version choices any more, just a recommended version
> string, so matching might not be that easy.

  We don't? Then what does BR2_TARGET_UBOOT_CUSTOM_VERSION do?

> And there's custom tarball / git repo / etc too.

  Exactly, for these the other considerations still apply.

>
>>   But another issue is that the license that we specify is just plain
>> wrong (as so often): all the U-Boot versions contain code that is GPLv2
>> without + and that is BSD-3c, some also contain code that is eCos-2.0,
>> IBM-pibs, LGPL. So we should probably fix the license spec for U-Boot
>> regardless of where it comes from.
>
> The U-Boot licenses that apply rely on the selected target too which
> complicates things.
> I don't think we want to become license police here other than "one or
> more of X, Y, ..., please do your homework".

  I agree completely. But currently it just says GPLv2+, which is plain 
wrong.

  Regards,
  Arnout

> Regards.
>
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
