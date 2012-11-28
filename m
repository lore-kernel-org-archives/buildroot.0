From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 28 Nov 2012 22:59:04 +0100
Subject: [Buildroot] Problem building libglib2
In-Reply-To: <CAE21AQqs92x6=x_ELTWz7MqMLNDrq9VDXK17+P_2sB-7wc=JXw@mail.gmail.com>
References: <CAE21AQquyvDfegH5f8FebeE8LFTnOY3r75Yuy6ZpWs72uD80MQ@mail.gmail.com>
 <20121128143100.152d26d6@skate>
 <CAE21AQqs92x6=x_ELTWz7MqMLNDrq9VDXK17+P_2sB-7wc=JXw@mail.gmail.com>
Message-ID: <50B68928.4010500@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 28/11/12 19:09, Charles Manning wrote:
> On Thu, Nov 29, 2012 at 2:31 AM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com>  wrote:
>> Dear Charles Manning,
>>
>> On Wed, 28 Nov 2012 14:37:46 +1300, Charles Manning wrote:
>>
>>> I'm a buildroot newbie and am trying to figure out what went wrong
>>> here.
>>
>> This looks odd. Could you give us your Buildroot .config and tell us
>> the Buildroot version you're using?
>
> Hello Thomas
>
> I have been working up from beaglebone defconfig towards a rootfs that
> I want for a project.
>
> The confg-201211281330 worked fine. I then added the bluez package and
> things fell over.
>
> I am using HEAD as of some time yesterday: commit
> 3bdbe9abb90de0262832d5d545f239fa41fb0e91

  There was a similar report from Alex (in CC).  I tried to reproduce it but
failed.  I'll also try with this config.

  What is going wrong in your (and Alex's) build is that ld tries to find
libpthread.so.0 in /lib instead of in $(STAGING_DIR)/lib.

  Could you (and Alex):
- tell us which host environment you have;
- re-run the failed build with 'V=1 make libglib2' and
post the failed command (should be something starting with:
/bin/sh ../../libtool  --tag=CC   --mode=link ...)
- post output/build/libglib2-2.30.3/config.log
- post output/build/libglib2-2.30.3/gobject/Makefile


  I vaguely remember having seen this problem before, but can't remember
if and how I solved it :-(


  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
