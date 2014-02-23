From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 23 Feb 2014 16:45:41 +0100
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20140223110021.16b6b976@skate> (Thomas Petazzoni's message of
 "Sun, 23 Feb 2014 11:00:21 +0100")
References: <20140223073009.3676E101056@stock.ovh.net>
 <20140223110021.16b6b976@skate>
Message-ID: <87ha7pq1cq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 >> avr32 |               gst1-libav-1.2.2 | NOK | http://autobuild.buildroot.net/results/d727c0f61b84acee08d2262691e07f9839235f54/

 > Don't know. Any idea?

Presumably avr32 has some relocation limitations like we've seen on mips
xtensaand arc, maybe there's a magic gcc argument to make it use a
different type?


 >> mipsel |                  rt-tests-0.83 | NOK | http://autobuild.buildroot.net/results/074265602bec4aba6c82d1aee389045e8ad33d4b/

 > Ryan Barnett has sent a patch to fix this. Peter, can you commit
 > http://patchwork.ozlabs.org/patch/323254/ and
 > http://patchwork.ozlabs.org/patch/323255/.

Will do.


 >> bfin |                     sdl-1.2.15 | NOK | http://autobuild.buildroot.net/results/9c893390fb4ca5630f03387adc918c8a3d80c912/
 >> nios2 |                     sdl-1.2.15 | NOK | http://autobuild.buildroot.net/results/543b4135c7996133f32e82d72d6f2969622f8617/

 > Both fixed by http://patchwork.ozlabs.org/patch/323145/. Peter can you
 > commit this patch?

I've already cherry picked the similar patch from next yesterday.

-- 
Bye, Peter Korsgaard
