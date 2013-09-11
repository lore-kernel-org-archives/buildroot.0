From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 11 Sep 2013 08:07:14 +0200
Subject: [Buildroot] [PATCH 1/1] aiccu: new package
In-Reply-To: <CAAXf6LXxcmwVN3hoaV0YqNyN5HPYQSkmqtJ4RBwYYOmQJTLUfA@mail.gmail.com>
References: <1378418213-22160-1-git-send-email-rommel@layer-7.net>
 <CAAXf6LXZnoX6u1fUD_2HX108_-6JnWaBFowV-yzLxsaeDOfFJA@mail.gmail.com>
 <CAAXf6LXxcmwVN3hoaV0YqNyN5HPYQSkmqtJ4RBwYYOmQJTLUfA@mail.gmail.com>
Message-ID: <52300892.2030700@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/09/13 13:39, Thomas De Schampheleire wrote:
> I tried compiling on a powerpc target, but this unfortunately failed:
>
> strip aiccu
> strip: Unable to recognise the format of the input file `aiccu'
> make[2]: *** [aiccu] Error 1
> make[2]: Leaving directory
> `/home/tdescham/repo/contrib/buildroot-review/output/build/aiccu-20070115/unix-console'
>
>
> The aiccu/unix-console/Makefile hardcodes the 'strip' command, but
> this should be the cross-strip, provided by buildroot through
> TARGET_STRIP. I think that aiccu should be patched to use STRIP, which
> defaults to 'strip', and aiccu.mk in buildroot should then pass the
> right STRIP command.
> This patch could then also be upstreamed...

  Actually, it is better to remove the strip completely. We strip the 
target directory in a final step, so that you still have unstripped 
binaries in the build and staging directories. Most packages leave it up 
to the distro to strip the binaries - which makes it possible to build 
foo-dbg packages that have the debug symbols.

  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
