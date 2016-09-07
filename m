From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 7 Sep 2016 11:28:50 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Your build results for
	2016-09-05
In-Reply-To: <CAFOYHZD8bOuN_2ie0t3O8XJA1zBJck4=YiyCSEVp=iNpPc43dg@mail.gmail.com>
References: <20160906063035.18941102741@stock.ovh.net>
 <CAFOYHZD8bOuN_2ie0t3O8XJA1zBJck4=YiyCSEVp=iNpPc43dg@mail.gmail.com>
Message-ID: <20160907112850.17240a82@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 7 Sep 2016 21:13:06 +1200, Chris Packham wrote:

> >      sparc64 |             micropython-v1.8.3 | http://autobuild.buildroot.net/results/2b6fc56b98474e66febb673a14a860bd16746172
> >  
> 
> I took a look at this. I can't reproduce it locally but I suspect it
> might be due to the python version on the autobuilder do we have any
> way of figuring that out? The py/makeqstrdefs.py states that "This
> script works with Python 2.6, 2.7, 3.3 and 3.4." so I'm guessing
> anything earlier than 2.6 Is not expected to work.
> 
> If this is the problem do we have any way of enforcing this dependency?

This failure occurred on my autobuilder instance, which has:

$ python --version
Python 2.6.6

So apparently, the script is not completely Python 2.6 compliant like
they pretend it to be.

The line QSTRING_BLACK_LIST = {'NULL', 'number_of', } is defining a
set. It works in Python 2.7, but not in Python 2.6. I guess replacing
with:

QSTRING_BLACK_LIST = set(['NULL', 'number_of'])

should work fine (tested with 2.6, 2.7 and 3.5)

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
