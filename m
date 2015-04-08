From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 08 Apr 2015 18:25:58 -0300
Subject: [Buildroot] [PATCH] strongswan: needs atomics
In-Reply-To: <20150408232230.362b95bd@free-electrons.com>
References: <1428507128-8490-1-git-send-email-gustavo@zacarias.com.ar>	<20150408212227.615c05a2@free-electrons.com>	<55258D3D.9070800@zacarias.com.ar>	<20150408224028.1c419e88@free-electrons.com>	<55259A87.7050504@zacarias.com.ar>
 <20150408232230.362b95bd@free-electrons.com>
Message-ID: <55259CE6.6050407@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/08/2015 06:22 PM, Thomas Petazzoni wrote:

> Thanks for the summary.
> 
> How do you handle Blackfin, which uses gcc 4.3, while I believe
> libatomic is a new thing in gcc 4.8, no?
> 
> Are you sure all atomic intrinsics are tied to the existence of
> libatomic? It's quite hard to find some good documentation on the web
> about libatomic.

Experimental evidence says that if it's hardware supported you don't
need libatomic, for the rest you do.
The problem is some bits may be, others may not.
Example: i386, mips, mipsel, they do the up-to-32-bits stuff but need
libatomic for 64+ bits.
Regards.
