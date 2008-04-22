From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Tue, 22 Apr 2008 18:40:53 +0200
Subject: [Buildroot] Improper device nodes
	createdinside	project_build_arm/uclibc/root/dev/
References: <16803332.post@talk.nabble.com><20080421140757.GC21702@cloud.net.au><16819059.post@talk.nabble.com><20080422005042.GA19794@cloud.net.au><8763uaqs3b.fsf@macbook.be.48ers.dk>
	<20080422095909.GA31643@cloud.net.au>
Message-ID: <040301c8a49d$c1408170$050514ac@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



> On Tue, Apr 22, 2008 at 09:14:16AM +0200, Peter Korsgaard wrote:
>> >>>>> "Hamish" == Hamish Moffatt <hamish@cloud.net.au> writes:
>> 
>> Hi,
>> 
>>  >> If this is what it is suppose to do, then how to mount the same for NFS
>>  >> boot. 
>> 
>>  Hamish> You could mount a generated image file somewhere via the loopback
>>  Hamish> device. Then you would have the devices that are in the image. ext2
>>  Hamish> would be a good choice. Do you want to write back to the root or not?
>> 
>>  Hamish> Alternatively you could add a new target output format for NFS root.
>> 
>> We already have that - tarball creation.
> 
> Good point. So, Hebbar: just use the tarball target, and extract it somewhere
> (as root) for use by your target system. Don't mount the
> buildroot/project_build.../.../root directory directly as it won't
> contain the real devices.
> 


Maybe we should have a configuration item allowing this to happen
automatically using "sudo".

I guess, in that case, we should have another 
configuration item (defaulting to no) which enables use of "sudo".

If we decide to do this, then I think that we need to be pretty
careful so we do not allow to untar in the host "/" directory or 
other directories which will destroy the host installation.

Maybe we should only allow it to be in "~/.buildroot/<project>/root".

Opinions?

Best Regards
Ulf Samuelsson                ulf at atmel.com
Atmel Nordic AB
Mail:  Box 2033, 174 02 Sundbyberg, Sweden
Visit:  Kavalleriv?gen 24, 174 58 Sundbyberg, Sweden
Phone +46 (8) 441 54 22     Fax +46 (8) 441 54 29
GSM    +46 (706) 22 44 57
