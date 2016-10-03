From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 3 Oct 2016 10:13:58 +0200
Subject: [Buildroot] [PATCH v2] zynq: document how to use custom
 ps7_init files
In-Reply-To: <CANQCQpZVLQ=QU=Gh5bMofFd-SVy2vWgOVVmpsK3p6X7g42fuLQ@mail.gmail.com>
References: <1475031612-43682-1-git-send-email-matthew.weber@rockwellcollins.com>
 <c12b938d-96da-ad8e-4dbd-bdf00bd281ed@mind.be>
 <CANQCQpZVLQ=QU=Gh5bMofFd-SVy2vWgOVVmpsK3p6X7g42fuLQ@mail.gmail.com>
Message-ID: <1813883c-94ce-d80f-3546-8e1cf8eb0d43@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 03-10-16 03:47, Matthew Weber wrote:
>> >  Which makes me think: perhaps a uboot option should be added (conditional on
>> > BR2_TARGET_UBOOT_ZYNQ_IMAGE) that allows the user to specify a custom file?
>> >
> Agree, Masahiro when you looked at the xilinx vs upstream u-boot, did
> both approach custom hw files in a similar manner?
> 
> Another item to note is the Zynq MPSoC (next gen SoC) so far hasn't
> decided to use the u-boot SPL approach.   I'm hoping to get more
> details next week at a Xilinx conference to understand their direction
> as I think a new Buildroot Xilinx handoff files package maybe a better
> solution as there are multiple parts.  (i.e. FPGA bit files and other
> pieces we may want to install in images/, place the hw platform files
> for use by uboot  and use the handoff files headers to compile FPGA
> soft IP embeddedsw drivers (another package I need to finish getting
> patches ready for).

 Sounds like a good idea. It does mean that that package would have to
manipulate the U-Boot sources - we try to avoid that one package manipulates the
source of another package. However we have a couple of precedents for that
situation anyway, so it should be acceptable.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
