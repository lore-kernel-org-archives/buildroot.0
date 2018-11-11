From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 11 Nov 2018 21:02:55 +0100
Subject: [Buildroot] [PATCH 1/3] fs: apply permissions late
In-Reply-To: <20181110175724.GG2445@scaer> (Yann E. MORIN's message of "Sat,
 10 Nov 2018 18:57:24 +0100")
References: <cover.1540626349.git.yann.morin.1998@free.fr>
 <4f9a31b0fb8f87ded9c788cb92d727b6763859ac.1540626349.git.yann.morin.1998@free.fr>
 <762db85d-d4a9-95b5-8280-d46dfd5f2a72@mind.be>
 <20181110175724.GG2445@scaer>
Message-ID: <87muqf5qmo.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

Hi,

 >> Just to be clear: with this patch, the 'tar' filesystem does still work because
 >> the creation of the tarball works OK, it's just the extraction that goes wrong,
 >> right?

 > Oh, you poinpoint an issue: the tar filesystem must be also modified to
 > add --xattrs-include='*' otherwise it would not contain any xattrs, and
 > even less so, any capabilty.

I believe my tests showed that --xattrs-include isn't needed when
creating the tarball (but _IS_ needed when extracting), as long as
--xattrs is passed.

-- 
Bye, Peter Korsgaard
