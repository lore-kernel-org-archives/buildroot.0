From: Michael Walle <michael@walle.cc>
Date: Wed, 20 Nov 2019 11:00:23 +0100
Subject: [Buildroot] [External] Re: [PATCH 1/9] package/rcw: upgrade the
 rcw version to LSDK-19.09
In-Reply-To: <CANQCQpYBjDv8-=hDyOGeCHMQymFqsu3St+9fCvhcgunVQs9UKw@mail.gmail.com>
References: <20191120040725.32207-1-jerry.huang@nxp.com>
 <20191120040725.32207-2-jerry.huang@nxp.com>
 <8ef6b0156f54102d837ecfc429ae810d@walle.cc>
 <20191120103204.19a15798@windsurf.home>
 <CANQCQpbZdy0q_qvRf8AWKu8wVFTNh8o9fjY7=UDeiKmU8zhnGw@mail.gmail.com>
 <20191120104539.37da1c64@windsurf.home>
 <CANQCQpYBjDv8-=hDyOGeCHMQymFqsu3St+9fCvhcgunVQs9UKw@mail.gmail.com>
Message-ID: <d4ad37bc14e611dc3ef2f4ff1ec8543b@walle.cc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Am 2019-11-20 10:51, schrieb Matthew Weber:
> Changming,
> 
> On Wed, Nov 20, 2019 at 3:45 AM Thomas Petazzoni
> <thomas.petazzoni@bootlin.com> wrote:
>> 
>> On Wed, 20 Nov 2019 03:38:40 -0600
>> Matthew Weber <matthew.weber@collins.com> wrote:
>> 
>> > > True, rcw is very short and quite generic. Matt, what do you think?
>> >
>> > Michael, good points, maybe we could append a prefix to make it
>> > freescale-qoriq-rcw?
>> 
>> Yes, freescale-qorqiq-rcw is good.

sounds good. but also see below.

>> 
> 
> I can send a patch, however do you want to add this rename as a patch
> in your current layerscape devkit series as you touch lots of RCW
> variables?  Let me know your plan, I can send it but I don't want to
> do it in the middle of your work :).

The RCW is really board dependent. I can imagine some OEMs are using the 
ones from freescale, but most likely they won't fit their boards. For 
example, we have our own RCW repository (although only binary for now) 
for our board. Therefore, wouldn't it be better to have different rcw 
config(s) in the board directories?

TBH I just had a quick look at the package makefile and saw that it 
copies the RCWs to /usr/share. Most likely, you (also?) need them in a 
flash/sdcard image, though.

-michael
