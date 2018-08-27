From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 27 Aug 2018 10:45:47 +0200
Subject: [Buildroot] Analysis of defconfig build failures
In-Reply-To: <20180827102815.23605ecd@windsurf> (Thomas Petazzoni's message of
 "Mon, 27 Aug 2018 10:28:15 +0200")
References: <20180812170138.0b51be07@windsurf>
 <87600bbg68.fsf@dell.be.48ers.dk> <20180815213421.08e0a3b6@windsurf>
 <87ftzf9v7u.fsf@dell.be.48ers.dk> <20180816001829.3f7a1436@windsurf>
 <CAAXf6LVNs8470+VwKJCM68cHdp+ZgD-JxEpCbUpMXte4JYm68Q@mail.gmail.com>
 <20180816220655.37fbff34@windsurf>
 <CAAXf6LX52KbkJ3AHfvG4ZMZvRHtpcqUHfo98JeTjFnuWWfMWNg@mail.gmail.com>
 <CAAXf6LW1V3FLD8B=BQ=nGO3guTfR6Xsk2JtRFc5aei-ZP=hbcQ@mail.gmail.com>
 <CAAXf6LVAjPadPVB1Ubq_M=i1s8746fVAWNDvYm8dK_ZTBMbQgQ@mail.gmail.com>
 <87in3w9qjj.fsf@dell.be.48ers.dk> <20180827102815.23605ecd@windsurf>
Message-ID: <87efek9ozo.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > Hello,
 > On Mon, 27 Aug 2018 10:12:16 +0200, Peter Korsgaard wrote:

 >> > I.e. there is preprocessing of the dts file, then the actual
 >> > compilation via dtc.
 >> > With this in mind, I actually don't think that this behavior is
 >> > negatively impacted by my changes. I now think it is a failure on top
 >> > of the original failures. When I undo my changes prior to running this
 >> > command, then the same errors occur. And since no other binary than
 >> > the compiler (preprocessor) and the prebuilt dtc is used, there cannot
 >> > be other impact of the changes I did to two header files.  
 >> 
 >> > Nevertheless, this defconfig still does not build correctly.  
 >> 
 >> :/
 >> 
 >> I guess giving the timing, the best solution for 2018.08 is to simply
 >> revert the dtc bump?

 > Is this fixing all issues we have, without introducing other problems ?
 > If so, then I'm fine with a revert of the dtc bump, of course.

That was my understanding based on Yann's git bisect, yes. These
defconfigs all used to work.

Yann?

-- 
Bye, Peter Korsgaard
