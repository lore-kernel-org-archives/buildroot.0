From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 6 May 2017 14:52:21 +0200
Subject: [Buildroot] Analysis of build results for 2017-05-04
In-Reply-To: <CANQCQpYL-sL2xGKw==LAgEOSnoD_ULAaCtj=cb-KAFyM0ZJt4A@mail.gmail.com>
References: <20170505062802.8C0262097E@mail.free-electrons.com>
 <20170505132423.3602e294@free-electrons.com>
 <CANQCQpYL-sL2xGKw==LAgEOSnoD_ULAaCtj=cb-KAFyM0ZJt4A@mail.gmail.com>
Message-ID: <20170506145221.3db37159@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 5 May 2017 17:11:08 -0500, Matthew Weber wrote:

> > Matt, since this issue occurred on your autobuilder slave, could you
> > indicate if you have done some maintenance / manually removed some
> > downloaded files ?  
> 
> Let me check, I have 4 autobuilders setup to share the same archive folder.

Why do you have such a setup? The autobuild-run script by itself is
capable of running multiple slave instances at the same time, while
making sure that each has its own download folder.

> > chmod +x /accts/mlweber1/rclinux/rc-buildroot-test/scripts/instance-1/dl/ti_cgt_pru_2.1.4_linux_installer_x86.bin
> > chmod: changing permissions of '/accts/mlweber1/rclinux/rc-buildroot-test/scripts/instance-1/dl/ti_cgt_pru_2.1.4_linux_installer_x86.bin': Operation not permitted
> >
> > Matthew: this is a configuration issue on your autobuilder slave. It is
> > not normal that we are not allowed to set execution permissions. Could
> > you fix this?  
> 
> Yep, I'll resolve this tonight.  Similar issue to above, I'm using a
> cached folder for my builds and the autobuilder.  I''ll fix the
> permissions and separate the dl folders from being shared.

OK. Please just use the autobuild-run script as-is, and run a single
invocation of the script. It can spawn multiple instances by itself, as
said above.


> > Fixed by
> > https://git.buildroot.org/buildroot/commit/?id=4d11848a21d4424a04e8428c4cd3bd5e972aacdf.
> >
> > Who wants to be in the DEVELOPERS file for this package ?  
> 
> I'll take it.  Want me to submit a patch?

Yes, please :-)

> >>     mips64el |                 libselinux-2.6 | NOK | http://autobuild.buildroot.net/results/98df2219b99c74f63d214dee5feb77925932f17d |  
> >
> > Python/SWIG issue in SELinux.
> >
> > Matthew? Adam?  
> 
> Ah fun, will take a look,  I'm starting to not like SWIG :-)

Thanks!

> > Matthew, are you doing something funky like sharing the download
> > folders between the different instances ?  
> 
> Yes, I will separate them out.

Thanks. But again, I'm worried about why they could be shared. The
autobuild-run script does not make them shared between instances.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
