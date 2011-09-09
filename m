From: Wade Berrier <wberrier@gmail.com>
Date: Fri, 09 Sep 2011 09:40:51 -0600
Subject: [Buildroot] [PATCH] intltool: use built host libexpat during
	configure
In-Reply-To: <20110907161121.41b2a43b@skate>
References: <20110906191020.GA29969@berrier.lan>
 <20110906232416.077d2091@skate> <j47s9g$n6q$1@dough.gmane.org>
 <20110907161121.41b2a43b@skate>
Message-ID: <j4dc25$juq$1@dough.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/07/2011 08:11 AM, Thomas Petazzoni wrote:
> Le Wed, 07 Sep 2011 07:41:03 -0600,
> Wade Berrier <wberrier@gmail.com> a ?crit :
> 
>> So, am I correct when guessing the culprit is Expat.so? (missing rpath
>> to libexpat.so.1)
> 
> Well, here Expat.so has a correct rpath:
> 
> $ readelf -d output/host/usr/lib/perl/auto/XML/Parser/Expat/Expat.so | grep RPATH
>  0x000000000000000f (RPATH)              Library rpath: [/home/thomas/projets/buildroot/output/host/usr/lib]
> 
> Can you check the output of the same command for Expat.so ?

Running this command on my older (2010.02) version of buildroot doesn't
have an rpath.  So it looks like it was already fixed.  Sorry for the
noise :(

At some point I'll get the ngrep package cleaned up and resubmit.

Thanks for the feedback and the help.

Wade

> 
> Thomas
