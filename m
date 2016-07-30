From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Sat, 30 Jul 2016 14:05:16 -0500
Subject: [Buildroot] [PATCH 6/7] zynq_zc706: bump U-Boot to
	xilinx-v2016.2
In-Reply-To: <20160730181450.04333637@free-electrons.com>
References: <1468834703-27518-1-git-send-email-yamada.masahiro@socionext.com>
 <1468834703-27518-7-git-send-email-yamada.masahiro@socionext.com>
 <CANQCQpaM__7tuCvn7=tm3xkxv7aG4Yi_to-YVD5QP0HN+R-7xQ@mail.gmail.com>
 <20160730181450.04333637@free-electrons.com>
Message-ID: <CANQCQpamSTQickVBkpJc+gR_UpGKfWq5X3Myj_MzadPuQ6oiJw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Saturday, July 30, 2016, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Thu, 28 Jul 2016 12:47:39 -0500, Matthew Weber wrote:
>
>> > -If you already have the Xilinx tools installed, the following sequence
>> > -will unpack, patch and build the rfs, kernel, uboot, and uboot-spl.
>> > -
>> > -make zynq_zc706_defconfig
>> > -make uboot-patch
>> > -cp
${XILINX_SDK_LIB}/hwplatform_templates/ZC706_hw_platform/ps7_init.{c,h} \
>> > -   output/build/uboot-xilinx-v2014.1/board/xilinx/zynq/
>> > -
>> > -Where ${XILINX_SDK_LIB} is
${XILINX}/SDK/${VERSION}/data/embeddedsw/lib.
>> > -
>> > -After copying these files into the U-Boot source tree, you can
>> > -continue the build with:
>>
>> Isn't this good information to still generally include somewhere in
>> the notes for any of the Zynq boards as if they build a custom bit
>> file there would be updated handoff files needing copied in.
>
> These manual steps are no longer needed with the new U-Boot version, so
> removing those details makes sense.

I agree with regards to the default devkit setup, but any custom FPGA
development can affect the ps7_init file.  I'll submit a patch to provide
guidance for how to pull in the files and to define the situation that
requires those steps.


>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
>

-- 
Matthew L Weber / Pr Software Engineer
Airborne Information Systems / Security Systems and Software / Secure
Platforms
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
www.rockwellcollins.com

Note: Any Export License Required Information and License Restricted Third
Party Intellectual Property (TPIP) content must be encrypted and sent to
matthew.weber at corp.rockwellcollins.com.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160730/16ce8ba7/attachment.html>
