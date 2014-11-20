From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 20 Nov 2014 11:48:41 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2014-11-19
In-Reply-To: <20141120112730.156f9ee6@free-electrons.com> (Thomas Petazzoni's
 message of "Thu, 20 Nov 2014 11:27:30 +0100")
References: <20141120073014.164A510107F@stock.ovh.net>
 <20141120094407.4b487379@free-electrons.com>
 <87y4r6fc2v.fsf@dell.be.48ers.dk>
 <20141120112730.156f9ee6@free-electrons.com>
Message-ID: <87ppcif8qe.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 >> > The uClibc bug about setreuid().
 >> 
 >> > What do we do about this one? It still isn't fixed upstream. Should we
 >> > simply disable uClibc for static builds? (But then we would only have
 >> > musl left as a C library compatible with static builds). Or do we
 >> > simply blacklist for now the packages that are known to use the symbols
 >> > causing problems?
 >> 
 >> > Peter?
 >> 
 >> uClibc with static linking is useful for quite some setups, so I would
 >> find it a pity to globally disable it. Let's just disable the affected
 >> packages with a comment.

 > So you suggest to disable them within Buildroot, or through an
 > exception in the autobuild-run script?

 > Advantage of doing it in the autobuild-run script: we don't need to
 > propagate to all the reverse dependencies. The script will exclude any
 > configuration that has the problematic package selected with a uClibc
 > toolchain.

 > Drawback of doing it in  the autobuild-run script: normal users of
 > Buildroot may run into the issue.

Is there other packages than cdrkit? If the packages don't have huge
reverse dependencies then I would prefer to disable them in Buildroot.


 >> >> sh4a |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/119adf6a31266e71e45fb1951d7e8ebbd1ff41fe/
 >> 
 >> > Bug in the CodeSourcery SH4 toolchain. I don't think we have any other
 >> > solution than blacklisting configurations that contain Qt4 Webkit and
 >> > that use this toolchain. Opinions?
 >> 
 >> Yes, I also think we should just blacklist it.

 > I'll add an exception to the autobuilder then.

Why not to buildroot? It's a toolchain we have a preset for, right?

-- 
Bye, Peter Korsgaard 
