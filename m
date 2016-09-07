From: Chris Packham <judge.packham@gmail.com>
Date: Wed, 7 Sep 2016 21:13:06 +1200
Subject: [Buildroot] [autobuild.buildroot.net] Your build results for
	2016-09-05
In-Reply-To: <20160906063035.18941102741@stock.ovh.net>
References: <20160906063035.18941102741@stock.ovh.net>
Message-ID: <CAFOYHZD8bOuN_2ie0t3O8XJA1zBJck4=YiyCSEVp=iNpPc43dg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Sep 6, 2016 at 6:30 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> This is the list of Buildroot build failures that occured on
> 2016-09-05, and for which you are a registered architecture developer
> or package developer. Please help us improving the quality of
> Buildroot by investigating those build failures and sending patches to
> fix them. Thanks!
>
> Build failures related to your packages:
>
>      sparc64 |             micropython-v1.8.3 | http://autobuild.buildroot.net/results/2b6fc56b98474e66febb673a14a860bd16746172
>

I took a look at this. I can't reproduce it locally but I suspect it
might be due to the python version on the autobuilder do we have any
way of figuring that out? The py/makeqstrdefs.py states that "This
script works with Python 2.6, 2.7, 3.3 and 3.4." so I'm guessing
anything earlier than 2.6 Is not expected to work.

If this is the problem do we have any way of enforcing this dependency?
