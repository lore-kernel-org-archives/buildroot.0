From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 02 May 2015 10:15:25 -0300
Subject: [Buildroot] [PATCH v2 1/1] package/boost: bump to version 1.58.0
In-Reply-To: <20150501162931.5c466549@free-electrons.com>
References: <1430482091-8140-1-git-send-email-joerg.krause@embedded.rocks>	<55437264.90900@zacarias.com.ar>
 <20150501162931.5c466549@free-electrons.com>
Message-ID: <5544CDED.5010207@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/01/2015 11:29 AM, Thomas Petazzoni wrote:

>> Hi.
>> It will need some extra tweaking since it failed in a similar way for sh4:
>> http://autobuild.buildroot.net/results/ccd/ccd5c83963032ba49b1627b1dff39e34a9486943/build-end.log
> 
> Generally speaking, doing:
> 
> if $(arch) != arm && $(arch) != mips1
> 
> to decide whether to use -m32 is going to cause numerous problems. It
> should be an opt-in test rather than an opt-out test. I.e only those
> architectures that actually need -m32 should use it, rather than trying
> to exclude all architectures that do not provide -m32.

Actually on second thought they shouldn't even do that, that's compiler
setup and it's up to packaging to care care of it, via CFLAGS.
Regards.
