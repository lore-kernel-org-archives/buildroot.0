From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 3 Jan 2018 16:42:34 -0600
Subject: [Buildroot] [PATCH] kvm-unit-test: revert use of RDSEED and
 RDRAND
In-Reply-To: <20180103232707.1e834d98@windsurf.lan>
References: <20171207043631.9312-1-matthew.weber@rockwellcollins.com>
 <20171214094459.4b383336@windsurf.png.is.keysight.com>
 <CANQCQpaDCyJLRZRk5mwun3sGy1Ex7WVZO5E35YZM02m-Synv-g@mail.gmail.com>
 <20171218084954.54776e85@windsurf> <20180103232707.1e834d98@windsurf.lan>
Message-ID: <CANQCQpaEF6aZKx8FWFNsctjvugx=zsM_Fc0c7ODDtvknLYOQVQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Wed, Jan 3, 2018 at 4:27 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Mon, 18 Dec 2017 08:49:54 +0100, Thomas Petazzoni wrote:
>
>> On Fri, 15 Dec 2017 14:41:05 -0600, Matthew Weber wrote:
>>
>> > It isn't really a bug upstream.  I think the long term fix would be a
>> > check for a minimum binutils version.
>>
>> Or kvm-unit-tests could do a configure test to verify if
>> rdseed/rdrand are supported, and only use them if so.
>
> Any chance you could submit a patch implementing this?
>

Yeah, I've done the research but was still looking at how.  Here's
where I was at below.......

I'd default to disable because we don't have any way to tell what the
end processor is for execution of what we build.  Worst case we could
use the cpu type and enable a new configure option to turn this
feature on/off.  I can suggest that to the mailing list and maybe
they'd be ok with it defaulting to on.

Matt
